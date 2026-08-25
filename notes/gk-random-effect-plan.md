# GK 模式：隨機階段效果系統 設計規劃

## 背景
GK（槍王之王）模式的核心機制——每隊累積擊殺數換武器類別、第一隊完成 9 個類別獲勝——維持不變。
本次新增「隨機階段效果」系統：每局開始時，9 個階段各隨機抽取一個效果，讓每局體驗完全不同。

---

## 模式開關（gk_random_effect）

在 GK 設定書（`config_render.mcfunction`）加入三段切換按鈕：

| 值 | 模式 | 說明 |
|----|------|------|
| 0 | 無效果 | 原始 GK，不套用任何效果 |
| 1 | 普通模式 | 效果強度 0~1（Amplifier 0 或 1，顯示為 I/II 級） |
| 2 | 瘋狂模式 | 效果強度固定 2（Amplifier 2，顯示為 III 級），包含特殊專屬效果 |

---

## 效果池

### 普通模式（gk_random_effect=1）

隨機從以下抽取，強度隨機 0 或 1：

| 效果 | 強度 | 說明 |
|------|------|------|
| Speed | 0~1 | 移動速度提升 |
| Jump Boost | 0~1 | 跳躍提升（不附加緩降） |
| Weakness | 固定 1（Weakness II） | 近戰傷害降低，**僅限 cat9（近戰）階段可抽到** |
| Blindness | 固定 0 | 視野大幅壓縮 |
| Darkness | 固定 0 | 黑暗壓迫感 |
| Glowing | 固定 0 | 全員發光，易被追蹤 |
| 無效果 | — | 對比其他階段更顯珍貴 |

---

### 瘋狂模式（gk_random_effect=2）

不含「無效果」選項，強度固定 2 或搭配額外效果。
分為兩類：

#### A. 普通效果升階（強度固定 Amplifier 2）

| 效果 | 說明 |
|------|------|
| Speed III | 高速移動 |
| Jump Boost III | 高跳（不含緩降） |
| Jump Boost III + Slow Falling II | 高跳後緩慢飄降，空中戰場 |
| Weakness II | 近戰傷害削弱，**僅限 cat9（近戰）階段可抽到** |

#### B. 固定效果 + 額外效果（搭配組合）

| 主效果 | 額外效果 | 組合感受 |
|--------|----------|----------|
| Blindness I | + Speed II | 快速但盲目，極度混亂 |
| Darkness I | + Glowing I | 黑暗中看到發光輪廓，詭異獵殺感 |
| Nausea I | 無 | 畫面扭曲，純心理壓力（⚠ 設定書標注可能造成不適） |

#### C. 瘋狂專屬特殊機制

| 效果 | 機制說明 |
|------|----------|
| **血量上限 1 HP** | `attribute generic.maxHealth base set 2`，再給 `instant_health 1 255` 使血量立即降至 1 HP。換階段時還原為 `base set 100`（GK 預設血量）。 |
| **隱形 + 移除防具 + Speed II** | 開局在 `start.mcfunction` 記錄每位玩家防具等級至 `gk_armor_tier`（0=無, 1=皮革, 2=黃金, 3=鐵甲）。進入此階段時移除所有防具，給予 Invisibility + Speed II。換階段時依 `gk_armor_tier` 還原防具。 |
| **超級力量（一拳殺人）** | `effect give @s strength <duration> 32`（Amplifier 32）。讓玩家可選擇放下槍用拳頭一擊必殺，創造槍與拳的取捨。 |

---

## 隨機分配邏輯

在 `shuffle.mcfunction`（現有隨機武器順序的地方）一併隨機：

- `#gk_effect_type_1` ~ `#gk_effect_type_9`：各階段抽到哪種效果（對應編號）
- `#gk_effect_amp_1` ~ `#gk_effect_amp_9`：效果強度（普通模式隨機 0~1；瘋狂模式固定 2）
- 效果 pool 依 `#gk_random_effect` 的值決定從哪個效果清單抽取

---

## 效果應用邏輯

### apply_stage_effect.mcfunction（新增）

**不在 main_tick 週期呼叫**，只在以下兩個時機執行一次：
- 遊戲開始（`start.mcfunction` 末段）
- 每次換階段（`advance_stage_<team>` 中 `give_weapon` 呼叫後）

每次執行流程（對隊伍所有玩家，固定順序）：
1. `effect clear @a[team=<team>]` — 清除所有舊效果
2. 給予當前階段效果（duration 999999，Minecraft 視為無限）
3. 補回 GK 常駐效果（duration 999999）：
   - `effect give @a[team=<team>] saturation 999999 0 true`
   - `effect give @a[team=<team>] regeneration 999999 0 true`
4. **還原防具**：依 `gk_armor_tier` 給回玩家防具（無論任何階段都執行，確保從隱形階段離開時防具自動回歸）
5. **設定血量上限為 100** + `effect give instant_health 1 255`（先還原預設上限並立即同步目前血量，確保從血量上限階段離開時自動還原）
6. **特殊機制覆蓋**（在上面基礎之上再套用）：
   - 若本階段為「血量上限 1 HP」→ `attribute base set 2` + `effect give instant_health 1 255`（覆蓋步驟 5，縮減上限並立即同步至 1 HP）
   - 若本階段為「隱形」→ 移除所有防具 + `effect give invisibility 999999 0 true`

> **規則：任何更改 maxHealth 的操作之後都必須接 `instant_health 1 255`，確保目前血量立即同步至新上限。**

### 好處
不需要任何特殊清除邏輯：每次換階段固定執行完整流程，先還原再覆蓋，無殘留問題。

---

## 換階段時廣播效果提示

在 `give_weapon.mcfunction` 末段（`#gk_give_cat` 已設定）呼叫 `announce_stage_effect.mcfunction`（新增），廣播本階段效果名稱給全體玩家。

---

## 需新增/修改的檔案

| 檔案 | 類型 | 說明 |
|------|------|------|
| `gamemode/gk/apply_stage_effect.mcfunction` | 新增 | 每 2 秒套用效果給所有玩家 |
| `gamemode/gk/announce_stage_effect.mcfunction` | 新增 | 換階段時廣播效果提示 |
| `gamemode/gk/shuffle.mcfunction` | 修改 | 加入效果隨機抽取邏輯 |
| `gamemode/gk/give_weapon.mcfunction` | 修改 | 加入 apply_stage_effect 與 announce_stage_effect 呼叫 |
| `gamemode/gk/start.mcfunction` | 修改 | 開局記錄 gk_armor_tier，初始化效果相關 scoreboard |
| `gamemode/gk/config_render.mcfunction` | 修改 | 加入 gk_random_effect 三段切換按鈕 |
| `core/init.mcfunction` | 修改 | 新增 gk_random_effect、gk_armor_tier 等 scoreboard 建立 |

---

## 驗證方式

1. 開 GK 局，普通模式確認 9 個階段各有效果且強度最高 II 級
2. 瘋狂模式確認無「無效果」且出現特殊機制（血量上限、隱形、超級力量）
3. 確認換階段後效果**立即**消退並套用新效果（無延遲）、血量上限正確還原、防具正確歸還
4. 確認 `gk_random_effect=0` 時完全無效果
5. 確認效果不滲入其他模式（TDM/DOM/BR）
