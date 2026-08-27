# BR 模式：三模組特殊玩法系統 設計規劃

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
| `#br_limit_weapon` | 限定武器 | 0=關, 1~9=限定的 cat 編號 |
| `#br_special_event` | 特殊事件 | 0=關, 1=開 |
| `#br_special_item` | 特殊道具 | 0=關, 1=開 |

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

### 實作細節

新增 scoreboard：
- `#br_airdrop_flag1`（0=未觸發, 1=已判定）
- `#br_airdrop_flag2`（0=未觸發, 1=已判定）
- `#br_airdrop_delay`（延遲倒數，0=無待發，>0=倒數中）
- `#br_player_start`（開局時記錄總人數）

在 `main_tick.mcfunction` 每秒週期中：

```mcfunction
# 計算當前存活人數 → #br_alive
execute store result score #br_alive br_sys if entity @a[scores={br_death_state=1}]

# 60% 門檻（= start × 6 / 10）
scoreboard players operation #br_threshold br_sys = #br_player_start br_sys
scoreboard players operation #br_threshold br_sys *= #br_c6 br_sys   # c6=6
scoreboard players operation #br_threshold br_sys /= #br_c10 br_sys  # c10=10
execute if score #br_airdrop_flag1 br_sys matches 0 if score #br_alive br_sys <= #br_threshold br_sys run function br/airdrop/check_trigger1

# 30% 門檻
scoreboard players operation #br_threshold br_sys = #br_player_start br_sys
scoreboard players operation #br_threshold br_sys *= #br_c3 br_sys   # c3=3
scoreboard players operation #br_threshold br_sys /= #br_c10 br_sys
execute if score #br_airdrop_flag2 br_sys matches 0 if score #br_alive br_sys <= #br_threshold br_sys run function br/airdrop/check_trigger2

# 延遲倒數（若有待發空投）
execute if score #br_airdrop_delay br_sys matches 1.. run scoreboard players remove #br_airdrop_delay br_sys 1
execute if score #br_airdrop_delay br_sys matches 0 if score #br_airdrop_flag1 br_sys matches 2 run function br/airdrop/spawn
execute if score #br_airdrop_delay br_sys matches 0 if score #br_airdrop_flag1 br_sys matches 2 run scoreboard players set #br_airdrop_flag1 br_sys 3
execute if score #br_airdrop_delay br_sys matches 0 if score #br_airdrop_flag2 br_sys matches 2 run function br/airdrop/spawn
execute if score #br_airdrop_delay br_sys matches 0 if score #br_airdrop_flag2 br_sys matches 2 run scoreboard players set #br_airdrop_flag2 br_sys 3
```

`br/airdrop/check_trigger1.mcfunction`：
```mcfunction
# 標記已判定，防止重複觸發
scoreboard players set #br_airdrop_flag1 br_sys 1

# 40% 機率：spreadplayers 偽隨機，取 X mod 10 < 4 判定
summon minecraft:marker ~ 64 ~ {Tags:["br_lottery"]}
spreadplayers ~ ~ 0 100 false @e[type=marker,tag=br_lottery,limit=1]
execute store result score #lottery_x br_sys run data get entity @e[type=marker,tag=br_lottery,limit=1] Pos[0]
kill @e[type=marker,tag=br_lottery]
scoreboard players operation #lottery_x br_sys %= #br_c10 br_sys
# < 4 = 抽中（40%）
execute if score #lottery_x br_sys matches ..3 run function br/airdrop/set_delay1
```

`br/airdrop/set_delay1.mcfunction`：
```mcfunction
# 隨機延遲 100~300 ticks（5~15 秒）
# 用 spreadplayers X mod 201 + 100 近似
summon minecraft:marker ~ 64 ~ {Tags:["br_delay_roll"]}
spreadplayers ~ ~ 0 200 false @e[type=marker,tag=br_delay_roll,limit=1]
execute store result score #br_airdrop_delay br_sys run data get entity @e[type=marker,tag=br_delay_roll,limit=1] Pos[0]
kill @e[type=marker,tag=br_delay_roll]
scoreboard players operation #br_airdrop_delay br_sys %= #br_c201 br_sys  # c201=201
scoreboard players add #br_airdrop_delay br_sys 100
# 標記為「待發」
scoreboard players set #br_airdrop_flag1 br_sys 2
```

（`check_trigger2` / `set_delay2` 邏輯相同，操作 `flag2`）

**開局時**初始化（`start.mcfunction`）：
```mcfunction
execute store result score #br_player_start br_sys if entity @a
scoreboard players set #br_airdrop_flag1 br_sys 0
scoreboard players set #br_airdrop_flag2 br_sys 0
scoreboard players set #br_airdrop_delay br_sys 0
```

---

## 二、模組 A：限定武器（br_limit_weapon）

### 設計概念
管理員選定**一種武器類別（cat1~cat9）**作為本局唯一允許的槍械來源。
`#br_limit_weapon = 0` 表示關閉（使用原始 loot table）；`= N` 表示只允許 catN。

### 實作方案：分層 Loot Table（共用 Pool）

**已確認**：現有 BR 箱子完全使用 loot table，且已是分層架構：
- `chests/*.json` 引用 `pools/*.json`，透過 `"type": "minecraft:loot_table"` 組合
- 箱子由 `loot_spawn.mcfunction` 用 `setblock` + `LootTable:` NBT 生成

現有 pool 結構：
```
pools/general.json     ← 手槍為主（已含各 cat 武器混合）
pools/high.json        ← 高階武器為主
pools/airdrop_mapN.json← 各地圖空投專屬（5 個）
pools/medical.json     ← 醫療物資
pools/attach.json      ← 配件
```

現有 chest 結構（已是分層）：
```
chests/general.json    → 引用 pools/general(75%) + medical(7.5%) + attach(7.5%) + high(10%)
chests/high.json       → 引用 pools/high(75%) + general(15%) + medical(5%) + attach(5%)
chests/airdrop_mapN.json→ 引用 pools/airdrop_mapN(99%) + 其他極低權重
```

#### 需新增的 Pool 檔案（10 個）

將現有 `pools/general.json` 和 `pools/high.json` 中的武器依 cat 拆分：

```
data/br/loot_tables/pools/weapons_cat1.json   ← 手槍（從 general/high 拆出）
data/br/loot_tables/pools/weapons_cat2.json   ← 步槍
data/br/loot_tables/pools/weapons_cat3.json   ← 散彈槍
data/br/loot_tables/pools/weapons_cat4.json   ← 衝鋒槍
data/br/loot_tables/pools/weapons_cat5.json   ← 輕機槍
data/br/loot_tables/pools/weapons_cat6.json   ← 狙擊槍
data/br/loot_tables/pools/weapons_cat7.json   ← 榴彈/特殊
data/br/loot_tables/pools/weapons_cat8.json   ← 其他
data/br/loot_tables/pools/weapons_cat9.json   ← 近戰
data/br/loot_tables/pools/special_items.json  ← 特殊道具
```

#### 需新增的 Chest Wrapper（27 個 + 27 個特殊版 + 3 個純特殊）

每個 catN wrapper 引用 `pools/weapons_catN` 取代原本的武器 pool，配件/醫療比例維持不變：

`chests/general_cat1.json` 範例：
```json
{
  "type": "minecraft:chest",
  "pools": [{
    "rolls": {"min": 6, "max": 14},
    "entries": [
      {"type": "minecraft:loot_table", "name": "br:pools/weapons_cat1", "weight": 7500},
      {"type": "minecraft:loot_table", "name": "br:pools/medical",      "weight": 750},
      {"type": "minecraft:loot_table", "name": "br:pools/attach",       "weight": 750}
    ]
  }]
}
```

特殊道具版（`chests/general_cat1_special.json`）末尾多一個 pool：
```json
{"rolls": {"min": 0, "max": 1}, "entries": [
  {"type": "minecraft:loot_table", "name": "br:pools/special_items", "weight": 1}
]}
```

#### 檔案數量總計（約 67 個）

| 類型 | 數量 |
|------|------|
| 武器 pool（cat1~9）＋特殊道具 pool | 10 |
| 箱型 wrapper（3 箱型 × 9 cat） | 27 |
| 特殊道具版 wrapper（3 × 9） | 27 |
| 純特殊道具箱（general / high / airdrop） | 3 |
| **合計** | **67** |

#### 開局切換邏輯（`loot_spawn.mcfunction` 修改）

在現有 `setblock` 指令前加入條件判斷，根據開關組合選擇對應 chest 表：

```mcfunction
# 限定武器=關，特殊道具=關 → 原有邏輯不動

# 限定武器=關，特殊道具=開 → 純特殊道具版
execute if score #br_limit_weapon dummy matches 0 if score #br_special_item dummy matches 1 \
  as @e[tag=active_loot,tag=crate_general,...] at @s \
  run setblock ~ ~ ~ minecraft:barrel[...]{LootTable:"br:chests/general_special"} replace

# 限定武器=1~9，特殊道具=關 → 對應 catN wrapper
execute if score #br_limit_weapon dummy matches 1..9 if score #br_special_item dummy matches 0 \
  run function br/loot/apply_limit_weapon

# 限定武器=1~9，特殊道具=開 → 對應 catN_special wrapper
execute if score #br_limit_weapon dummy matches 1..9 if score #br_special_item dummy matches 1 \
  run function br/loot/apply_limit_weapon_special
```

`br/loot/apply_limit_weapon.mcfunction` 用 `execute if score #br_limit_weapon dummy matches N` 逐一判斷，為各箱型套用 `catN` chest 表。

**設定書 UI**：9 個類別循環切換按鈕（選一），`0=關` 作為初始值。

---

## 三、模組 B：特殊事件（br_special_event）

### 設計概念
遊戲中**每 30 秒**觸發一次抽選，可能抽到「無事件」或某個全域事件，事件類型**待討論確認**。

### 事件觸發邏輯（新增 `br/event/tick.mcfunction`）
在 `main_tick.mcfunction` 每秒週期中呼叫：
1. `#br_event_timer` 固定 600 ticks（30 秒）倒數
2. 倒數歸零 → 隨機抽選事件（spreadplayers 偽隨機決定事件序號，含「無事件」選項）
3. 執行對應事件函式（或無事件則跳過）
4. 重設計時器為 600

### 事件清單（`br/event/` 目錄）（**類型待討論，以下為草案**）

| 事件 | 函式名 | 效果 | 持續時間 |
|------|--------|------|----------|
| 無事件 | — | 靜默跳過 | — |
| 全場發光 | `event_glow.mcfunction` | 全體存活玩家 Glowing 30 秒，互相暴露位置 | 30 秒 |
| 空投炸彈 | `event_bomb_airdrop.mcfunction` | 廣播座標並落下空投村民，落地後 15 格內 100 傷害爆炸 | 落地即觸發 |
| 全場速度異常 | `event_speed.mcfunction` | 隨機 Speed II 或 Slowness II，全體存活玩家，30 秒 | 30 秒 |

### 空投炸彈的特殊實作
- 召喚與正常空投相同的村民（tag=`airdrop_bomb`）
- 落地偵測在 `main_tick` 中增加對 `airdrop_bomb` tag 的判斷
- 落地後：廣播警告 + 3 秒倒數 + `damage @a[distance=..15] 100 out_of_world`

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

## 五、需新增/修改的檔案

| 檔案 | 類型 | 說明 |
|------|------|------|
| `gamemode/br/airdrop/lottery.mcfunction` | 新增 | 空投抽獎邏輯 |
| `gamemode/br/event/tick.mcfunction` | 新增 | 事件 30 秒計時器與觸發 |
| `gamemode/br/event/event_glow.mcfunction` | 新增 | 全場發光事件 |
| `gamemode/br/event/event_bomb_airdrop.mcfunction` | 新增 | 空投炸彈事件 |
| `gamemode/br/event/event_speed.mcfunction` | 新增 | 全場速度異常事件 |
| `gamemode/br/special_item/tick.mcfunction` | 新增 | 特殊道具偵測主路由 |
| `gamemode/br/special_item/use_*.mcfunction` | 新增 | 各特殊道具使用效果（8 個） |
| `data/br/loot_tables/chests/limit_catN.json` | 新增 | 各 cat 限定武器箱（9 個） |
| `data/br/loot_tables/chests/limit_catN_special.json` | 新增 | 各 cat 限定武器＋特殊道具箱（9 個） |
| `data/br/loot_tables/chests/special_only.json` | 新增 | 僅特殊道具箱（1 個） |
| `gamemode/br/loot/apply_limit_weapon.mcfunction` | 新增 | 根據 cat 編號套用限定武器 loot table |
| `gamemode/br/loot/apply_limit_weapon_special.mcfunction` | 新增 | 限定武器＋特殊道具 loot table 套用 |
| `gamemode/br/main_tick.mcfunction` | 修改 | 加入 event/tick、special_item/tick、新空投抽獎邏輯 |
| `gamemode/br/start.mcfunction` | 修改 | 初始化三模組開關，根據開關組合切換 loot table |
| `gamemode/br/phase/phase1_end.mcfunction`（或 phase2_start） | 修改 | 初始化空投抽獎計時器與計數 |
| `core/init.mcfunction` | 修改 | 新增相關 scoreboard |

---

## 六、驗證方式

1. **空投抽獎**：Phase 1 結束後等 30 秒，確認有機率觸發空投且最多兩次後停止抽獎
2. **限定武器**：設定 cat9（近戰），開局後確認所有箱子只出現近戰武器
3. **特殊事件**：開啟後等候 30 秒間隔，確認三種事件各自觸發正常，效果時間到後自動消退
4. **特殊道具**：開啟後確認箱子出現特殊道具，測試 8 種道具的觸發邏輯
5. **組合測試**：限定武器＋特殊道具同時開啟，確認使用 `limit_catN_special.json`
6. **模組隔離**：三模組全關閉時遊戲行為與原版相同；在 GK/TDM/DOM 模式下不啟動
