# BR 模式：三模組特殊玩法系統 設計規劃

---

## 實作現況（2026-09-28 同步）

### 完成狀態總表

| 模組 | 項目 | 狀態 |
|------|------|------|
| 〇 空投機制 | 存活門檻抽獎（60%/30%）、延遲倒數、do_spawn 防重疊 | ✅ 完成 |
| 模組 A | 武器模式 loot table（mode1-7）、loot_spawn 路由 | ✅ 完成 |
| 模組 A | 設定書 UI（武器模式選擇） | ❓ 待確認 |
| 模組 B | event/tick、dispatch（random 1..3）、event_glow、event_speed | ✅ 完成 |
| 模組 B | event_bomb_airdrop | ❌ 待實作 |
| 模組 C | 全部（loot table、偵測 tick、8 種效果函式） | ❌ 待實作 |

### 關鍵 Scoreboard 現況

| Scoreboard | 實際名稱 | 說明 |
|------------|---------|------|
| 武器模式 | `#br_weapon_mode br_sys` | 0=預設, 1~7=預設武器組合 |
| 空投旗標 1 | `#br_airdrop_flag1 br_sys` | 0=未觸發, 1=未中, 2=待發, 3=完成 |
| 空投旗標 2 | `#br_airdrop_flag2 br_sys` | 同上 |
| 空投延遲 1 | `#br_airdrop_delay1 br_sys` | 秒倒數 |
| 空投延遲 2 | `#br_airdrop_delay2 br_sys` | 秒倒數 |
| 空投門檻 60% | `#br_threshold_60 br_sys` | 開局計算後固定 |
| 空投門檻 30% | `#br_threshold_30 br_sys` | 開局計算後固定 |

### 待辦清單

1. **`event_bomb_airdrop.mcfunction`** — 隨機座標召喚 `tag=airdrop_bomb` 村民、落地偵測、15 格 100 傷害
2. **`event/dispatch.mcfunction` 改 `random value 1..4`**，`matches 4` 對應炸彈空投
3. **模組 C 特殊道具** — `pools/special_items.json`、箱型 `*_special` 版本、`special_item/tick.mcfunction` + 8 效果函式
4. **誘餌信號彈** — 雪球落地座標廣播假空投訊息

---

## 可行性評估（2026-08-23 同步）

### 分支現況

- GK 模式已完整實作（commit `0c9a7ed`，155+ 檔案）
- 近期 commit：移除弱勢槍械、修正 minigun NBT（`757ecef`）、修正 TDM 死亡補貼誤觸 GK（`ec7faad`）
- BR 核心機制（縮圈、空投、倒地/救援、祭壇復活）維持原狀，尚未啟動三模組開發

### 已知問題狀態

| 問題 | 狀態 |
|------|------|
| 擊殺任何生物 → 客戶端 `StringIndexOutOfBoundsException` 斷線 | ✅ 已解決 |
| `suffuse:knife` GUN_INDEX 解析失敗 | ✅ 已解決 |
| Aug-22 `FireMode.auto` crash（開背包 tooltip） | ✅ 已解決（清除舊 NBT） |
| Adventure 模式投擲物限制 | ✅ 確認：所有物品皆可投擲 |
| BR 箱子生成方式 | ✅ 確認：完全使用 loot table，已是分層架構 |

### 各模組可行性

#### 〇、空投機制修改 — 可行度 ✅ 高

- `random value` 指令（1.20.1 原生支援）可取代 `spreadplayers` 偽隨機，更精確：
  ```mcfunction
  execute store result score #lottery br_sys run random value 1..10
  execute if score #lottery br_sys matches 1..4 run function br/airdrop/set_delay1
  ```
- 延遲倒數機制設計合理，整合至現有 `main_tick` 無難度
- 需確認現有 Phase 觸發空投的邏輯如何與新機制並存（擇一或並行）

#### 模組 A：限定武器 — 可行度 ✅ 高（工作量大）

- Loot table 分層引用架構正確，MC 1.20.1 支援 `"type": "minecraft:loot_table"` pool entry
- 需確認現有 BR 箱子是否已使用 loot table；若是自定義 give 指令則需整體改寫
- 約 67 個 JSON 檔，量大但結構重複，適合腳本批量生成
- `start.mcfunction` 根據開關組合切換 loot table 的邏輯清晰可行

#### 模組 B：特殊事件 — 可行度 ✅ 高（部分細節待確認）

- 30 秒計時器 + 隨機觸發邏輯直觀
- 全場發光、速度異常：簡單，直接用 effect 指令
- **空投炸彈落地偵測**：建議改用 marker + `execute positioned` 追蹤，而非「最後位置記錄法」（後者有 1-tick 誤差風險）

#### 模組 C：特殊道具 — 可行度 🟡 中（部分技術難點）

| 道具 | 可行度 | 備註 |
|------|--------|------|
| 瞬移彈（終界珍珠） | ✅ | Adventure 模式可投擲，確認可行 |
| 偵測器（中繼器） | ✅ | 地面物品實體偵測可行 |
| 誘餌信號彈（雪球） | ✅ | Adventure 可投雪球；落地廣播假訊息可行 |
| 隱形斗篷（鞘翅） | ✅ | Slot 102 偵測可行 |
| 護盾（盾牌） | ⚠️ 困難 | datapack 無法乾淨偵測「盾牌右鍵格擋開始」事件；建議改為右鍵計時（`use_item` advancement）或觸發型 scoreboard |
| 急速補包（投擲藥水） | ✅ | 藥水落地範圍回血邏輯標準 |
| 失重彈（雞蛋） | ✅ | Adventure 可投雞蛋；Levitation 效果直接 |
| 磁力三叉戟（三叉戟） | ✅ | Adventure 模式可投擲，確認可行 |

**投擲物落地偵測通用問題**：計劃中的「最後位置追蹤法」在高延遲或高負載下可能漏偵。建議改用 **advancement 觸發**（`projectile_landed_on_block`）或在投擲物上加 tag 後用 `execute unless entity` 配合 marker 記錄。

### 建議開發順序

1. **先解決 `gd656killicon` 斷線問題**（前置阻塞）
2. 空投機制改寫（獨立、低風險、高收益）
3. 模組 A 限定武器（量大但邏輯直線，可批量生成）
4. 模組 B 特殊事件（快速實作，效果明顯）
5. 模組 C 特殊道具（最複雜，放最後）

---

## 背景
BR（大逃殺）模式在原有核心機制（縮圈、空投、倒地/救援、祭壇復活）不變的前提下，
新增三個可獨立開關的模組，玩家開局前自由搭配。

---

## 一、三模組開關

在 BR 設定書（現有 `lobby/` 設定 UI）加入三個獨立切換按鈕：

| Scoreboard | 說明 | 值 |
|------------|------|----|
| `#br_weapon_mode br_sys` | 武器模式（已實作） | 0=預設, 1~7=七種預設組合 |
| `#br_special_event br_sys` | 特殊事件 | 0=關, 1=開 |
| `#br_special_item br_sys` | 特殊道具 | 0=關, 1=開 |

**設定時機**：開局前設定，局中不變。

---

## 〇、空投機制修改（新）

**原機制**：依 Phase 固定觸發空投。

**新機制**：依**存活人數門檻**觸發抽獎，抽中後延遲 5~15 秒才實際召喚，混淆觸發規律。

### 觸發條件

| 門檻 | 觸發時機 | 抽獎機率 |
|------|---------|---------|
| 第一次 | 存活玩家降至起始人數的 **60%** | 40% |
| 第二次 | 存活玩家降至起始人數的 **30%** | 40% |

- 兩次各自只觸發一次（觸發後設旗標防重複）
- 不保證一定有空投，視機率而定（一場 0~2 次）
- 無次數上限（機率本身限制頻率）

### 實作細節（✅ 已完成）

Scoreboard（已建立）：
- `#br_airdrop_flag1/2 br_sys`（0=未觸發, 1=未中, 2=待發, 3=完成）
- `#br_airdrop_delay1/2 br_sys`（秒倒數）
- `#br_threshold_60/30 br_sys`（開局時預算，固定值）

`trigger1.mcfunction`（60% 門檻觸發）：
```mcfunction
scoreboard players set #br_airdrop_flag1 br_sys 1
execute store result score #br_lottery br_sys run random value 1..10
execute if score #br_lottery br_sys matches 1..4 run function game_core:gamemode/br/airdrop/set_delay1
```

`check_lottery.mcfunction`（每秒，含門檻偵測 + 倒數）：
```mcfunction
execute store result score #br_alive br_sys if entity @a[scores={br_death_state=1}]
execute if score #br_airdrop_flag1 br_sys matches 0 if score #br_alive br_sys <= #br_threshold_60 br_sys run function .../trigger1
execute if score #br_airdrop_flag2 br_sys matches 0 if score #br_alive br_sys <= #br_threshold_30 br_sys run function .../trigger2
execute if score #br_airdrop_delay1 br_sys matches 1.. run scoreboard players remove #br_airdrop_delay1 br_sys 1
execute if score #br_airdrop_delay1 br_sys matches 0 if score #br_airdrop_flag1 br_sys matches 2 unless entity @e[type=minecraft:villager,tag=airdrop_bird] run function .../do_spawn1
execute if score #br_airdrop_delay2 br_sys matches 1.. run scoreboard players remove #br_airdrop_delay2 br_sys 1
execute if score #br_airdrop_delay2 br_sys matches 0 if score #br_airdrop_flag2 br_sys matches 2 unless entity @e[type=minecraft:villager,tag=airdrop_bird] run function .../do_spawn2
```

---

## 二、模組 A：武器模式（br_weapon_mode）✅ 已完成

### 設計概念（實際實作）
管理員從 7 種**預設武器組合（mode1~7）**選擇本局武器池。
`#br_weapon_mode br_sys = 0` 使用原始 loot table；`= 1~7` 各代表一種預設組合。

### 已實作架構

Loot table 分層架構（已建立，已確認）：
- `chests/*.json` 引用 `pools/*.json`，透過 `"type": "minecraft:loot_table"` 組合
- 箱子由 `loot_spawn.mcfunction` 用 `setblock` + `LootTable:` NBT 生成

已建立的 loot table 檔案：
```
data/br/loot_tables/
  pools/general_mode1-7.json       (7 個)
  pools/high_mode1-7.json          (7 個)
  pools/airdrop_mode1-7.json       (7 個)
  chests/general_mode1-7.json      (7 個)
  chests/high_mode1-7.json         (7 個)
  chests/medical_mode1-7.json      (7 個)
  chests/attach_mode1-7.json       (7 個)
```

`loot_spawn.mcfunction` 已根據 `#br_weapon_mode br_sys matches 0~7` 路由到對應 chest 表，**無需再修改**。

### 待確認
- 設定書 UI 是否已實作武器模式選擇（`lobby/tick.mcfunction` 中）

---

## 三、模組 B：特殊事件（br_special_event）

### 已實作（✅）

`event/tick.mcfunction`：每秒 +1，達 30 呼叫 dispatch，重設 0。
`event/dispatch.mcfunction`：`random value 1..3`，1=靜默, 2=發光, 3=速度。
`event/event_glow.mcfunction`：全體存活玩家 Glowing 30 秒。
`event/event_speed.mcfunction`：全體存活玩家隨機 Speed II 或 Slowness II，30 秒。

### 事件清單

| 事件 | 函式名 | 狀態 |
|------|--------|------|
| 無事件（靜默） | — | ✅（dispatch 值 1） |
| 全場發光 | `event_glow.mcfunction` | ✅ |
| 全場速度異常 | `event_speed.mcfunction` | ✅ |
| 空投炸彈 | `event_bomb_airdrop.mcfunction` | ❌ 待實作 |

### 空投炸彈待實作細節
1. 新增 `event_bomb_airdrop.mcfunction`
   - 在地圖範圍內隨機座標召喚 `tag=airdrop_bomb` 的村民
   - 廣播座標訊息（與正常空投格式相似）
2. `main_tick.mcfunction` 中增加落地偵測（`unless entity @e[type=villager,tag=airdrop_bomb]` + marker 記錄最後座標）
3. 落地後：廣播警告 → 3 秒倒數 → `damage @a[distance=..15] 100 out_of_world`
4. `dispatch.mcfunction` 改為 `random value 1..4`，`matches 4` 對應炸彈空投

---

## 四、模組 C：特殊道具（br_special_item）

### 設計概念
開啟特殊道具時，切換箱子至含特殊道具的 loot table 版本（見模組 A loot table 表格）。
每種道具使用**特殊 NBT tag** 與原版物品區分。

Adventure 模式**可以**投擲雞蛋與雪球，無需額外處理。

### 道具清單與 NBT 定義

| 道具 | 物品 | NBT Tag | 效果 |
|------|------|---------|------|
| 瞬移彈 | 終界珍珠 | `{special:"teleport_pearl"}` | 原版珍珠傳送，落地免傷 |
| 偵測器 | 紅石中繼器 | `{special:"detector"}` | 丟到地上，顯示最近敵人座標（一次性） |
| 誘餌信號彈 | 雪球 | `{special:"decoy_flare"}` | 雪球落地後，以落地座標對全體廣播格式與真實空投相同的假訊息 |
| 隱形斗篷 | 鞘翅 | `{special:"invis_cloak"}` | 裝備到胸甲欄，銷毀並給 Invisibility 200（10 秒） |
| 護盾 | 盾牌 | `{special:"barrier_shield"}` | 右鍵使用時銷毀，給 Resistance 255 + Slowness 255，持續 3 秒（60 ticks） |
| 急速補包 | 投擲藥水 | `{special:"rapid_medpack"}` | 落地後 5 格內所有玩家瞬間回滿血 |
| 失重彈 | 雞蛋 | `{special:"gravity_egg"}` | 落地後 3 格內所有玩家 Levitation 100（5 秒） |
| 磁力三叉戟 | 三叉戟 | `{special:"magnet_trident"}` | 落地後銷毀，5 格內所有玩家 tp 到落點中心 |

### 偵測機制（`br/special_item/tick.mcfunction`）

每秒（`br_timer matches 20`）在 `main_tick` 中呼叫：

**隱形斗篷**（裝備偵測）：
```mcfunction
execute as @a[scores={br_death_state=1}] if data entity @s {Inventory:[{Slot:102b,tag:{special:"invis_cloak"}}]} run function br/special_item/use_invis_cloak
```

**護盾**（使用計數偵測）：
```mcfunction
execute as @a[scores={br_death_state=1}] if data entity @s {SelectedItem:{tag:{special:"barrier_shield"}}} run function br/special_item/check_shield
# check_shield 透過 sneak_time 或 use_item tick 計時觸發
```

**丟置型道具**（地面物品實體偵測）：
```mcfunction
execute as @e[type=item,nbt={Item:{tag:{special:"detector"}}}] at @s run function br/special_item/use_detector
```

**投擲物落地偵測（雪球→誘餌、雞蛋→失重彈、三叉戟→磁力）**：
採用「最後位置追蹤法」：
1. 每 tick 對存在的投擲物實體記錄 `#proj_x`/`#proj_z`/`#proj_y`
2. 下一 tick 若實體消失（`unless entity @e[tag=special_proj]`）→ 在記錄座標執行效果

---

## 五、檔案現況

### 已完成

| 檔案 | 說明 |
|------|------|
| `gamemode/br/airdrop/trigger1/2.mcfunction` | ✅ 空投抽獎（random value 1..10） |
| `gamemode/br/airdrop/set_delay1/2.mcfunction` | ✅ 延遲設定 |
| `gamemode/br/airdrop/check_lottery.mcfunction` | ✅ 每秒門檻偵測 + 倒數 |
| `gamemode/br/airdrop/do_spawn1/2.mcfunction` | ✅ 防重疊召喚 |
| `gamemode/br/event/tick.mcfunction` | ✅ 30 秒計時器 |
| `gamemode/br/event/dispatch.mcfunction` | ✅ random value 1..3 |
| `gamemode/br/event/event_glow.mcfunction` | ✅ 全場發光 |
| `gamemode/br/event/event_speed.mcfunction` | ✅ 全場速度異常 |
| `data/br/loot_tables/chests/general_mode1-7.json` | ✅ 武器模式箱（7 個） |
| `data/br/loot_tables/chests/high_mode1-7.json` | ✅（7 個） |
| `data/br/loot_tables/chests/medical_mode1-7.json` | ✅（7 個） |
| `data/br/loot_tables/chests/attach_mode1-7.json` | ✅（7 個） |
| `data/br/loot_tables/pools/general_mode1-7.json` | ✅（7 個） |
| `data/br/loot_tables/pools/high_mode1-7.json` | ✅（7 個） |
| `data/br/loot_tables/pools/airdrop_mode1-7.json` | ✅（7 個） |
| `gamemode/br/airdrop/loot_spawn.mcfunction` | ✅ 已路由 mode0-7 |
| `gamemode/br/main_tick.mcfunction` | ✅ 已整合 event/tick、check_lottery |
| `gamemode/br/start.mcfunction` | ✅ 已初始化武器模式與空投旗標 |
| `core/init.mcfunction` | ✅ 已新增相關 scoreboard |

### 待實作

| 檔案 | 說明 |
|------|------|
| `gamemode/br/event/event_bomb_airdrop.mcfunction` | ❌ 炸彈空投事件 |
| `gamemode/br/special_item/tick.mcfunction` | ❌ 特殊道具偵測主路由 |
| `gamemode/br/special_item/use_*.mcfunction` | ❌ 8 種效果函式 |
| `data/br/loot_tables/pools/special_items.json` | ❌ 特殊道具 pool |
| `data/br/loot_tables/chests/*_special.json` | ❌ 含特殊道具的箱型版本 |

---

## 六、驗證方式

1. **空投抽獎**：Phase 1 結束後等 30 秒，確認有機率觸發空投且最多兩次後停止抽獎
2. **限定武器**：設定 cat9（近戰），開局後確認所有箱子只出現近戰武器
3. **特殊事件**：開啟後等候 30 秒間隔，確認三種事件各自觸發正常，效果時間到後自動消退
4. **特殊道具**：開啟後確認箱子出現特殊道具，測試 8 種道具的觸發邏輯
5. **組合測試**：限定武器＋特殊道具同時開啟，確認使用 `limit_catN_special.json`
6. **模組隔離**：三模組全關閉時遊戲行為與原版相同；在 GK/TDM/DOM 模式下不啟動
