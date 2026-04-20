## 核心規範 (Strictly Follow)
- **命名空間：** 必須帶前綴 (`tdm_*`, `dom_*`, `br_*`)，全域常數用 `#`。
- **架構分層：** 偵測 (Detect) -> 邏輯 (Logic) -> 渲染 (UI)，嚴禁跨層呼叫。
- **效能優先：** 優先使用 `@s` 與 `Marker`，禁止無效的全服 `@a` 掃描。

## 模組索引與存取權限
| 資料夾 | 說明 | 存取策略 |
| :--- | :--- | :--- |
| `system/` | 主路由、初始化、流程控制 | **核心區**：修改邏輯時必讀 |
| `gamemode/` | BR / DOM / TDM 核心邏輯 | **核心區**：修改模式時必讀 |
| `player/` | 玩家 Tick 通用邏輯 | 僅在處理玩家屬性時讀取 |
| `class/` | 職業套用與裝備發放 | 僅在調整職業平衡時讀取 |
| `shop/` | **武器購買系統 (223+ 函數)** | **禁區**：除非修改購買邏輯，否則禁止索引 |
| `ui/` | 基地書本 UI 邏輯 | 僅在修改 UI 介面時讀取 |

## 當前任務 (Active Task)
- 正在開發：目前處於 BR 模式開發階段。
- 排除對象：除非必要，否則不要讀取 `shop/` 資料夾下的任何檔案。

> 注意：每個子資料夾的 `README.md` 已包含詳細摘要，優先閱讀摘要而非開啟原始碼。

## 資料夾規範

**新增子資料夾時，必須在該資料夾內建立 `README.md`**，格式如下：
```
# 資料夾名/ — 一句話說明用途

| 函數 | 功能摘要 |
|------|---------|
| `函數名` | 這個函數做什麼 |
```

---

mcfunction 開發七大鐵律
1. 嚴格的模組化與單一職責 (Single Responsibility)

鐵律：絕對不把所有指令塞進同一支檔案。

實作：br_main_tick 只負責全域計時與發派任務；br_player_tick 只處理玩家本體邏輯；br_downed_tick 只處理史萊姆實體。誰的邏輯就交給誰執行，保持檔案乾淨。

2. 效能至上：拒絕高頻硬碟寫入 (Zero Disk I/O per Tick)

鐵律：絕對不可以在每 Tick (1/20秒) 執行的迴圈中，使用會寫入硬碟的指令（如 /spawnpoint、/setblock 等非必要方塊更新）。

實作：使用存在於記憶體中的「隱形 Marker 實體 (br_tracker)」來做空間定位與追蹤，將伺服器負擔降到最低。

3. 事件驅動取代每秒輪詢 (Event-Driven over Polling)

鐵律：如果一件事只有在「特定情況」才會發生，就不要讓伺服器每一 Tick 都去檢查它。

實作：例如「勝利判定 (br_win_check)」，不需要每秒檢查，而是只在「有玩家被淘汰 (br_eliminated)」的那一瞬間才呼叫一次。

4. 解決動態變數限制：全域黑板匹配法 (Chalkboard Matching)

鐵律：Minecraft 原版選擇器無法使用動態變數（不能寫 scores={id=@s}）。

實作：永遠使用 #current_player 作為全域暫存黑板。執行者先把自己的 br_id 或 team_id 抄在黑板上，再讓目標實體去比對黑板上的數字，藉此達成完美的「同隊判定」與「專屬追蹤器綁定」。

5. 嚴格把控 Tick 執行順序 (Tick Order Execution)

鐵律：在同一個 Tick 內，指令是「由上往下」瞬間執行完畢的。順序一旦放錯，就會產生 1 Tick 的延遲 Bug。

實作：例如「死亡判定」必須永遠寫在「追蹤器移動」的前面；「抄寫黑板」必須永遠放在檔案的最頂端。同時，善用物理限制（如 distance=..32）或屬性重置（如 Max Health）來防禦模組造成的延遲衝突。

6. 無痕清理原則 (Clean State Reset)

鐵律：每一次遊戲結束或重啟時，不能留下任何上一局的「垃圾」。

實作：必須要有專屬的重置檔案，精準移除所有玩家身上的大逃殺 Tags (br_downed, br_eliminated ,tdm,dom等)、歸零計分板，並 /kill 掉所有殘留的史萊姆與 Marker 標籤。

7. 指令必須附帶詳細解釋 (Mandatory Inline Documentation)

鐵律：所有新增的指令都必須在同一行或上方加入中文註解，說明「這行在做什麼」以及「為什麼這樣寫」。

實作：每一個 execute、scoreboard、tag、kill 指令旁邊都要寫清楚意圖。例如：
  # 偵測玩家落地：OnGround:1b 代表腳踩在方塊上的那一 Tick
  execute as @a[tag=br_jumped,nbt={OnGround:1b}] run function game_core:gamemode/br_on_landed
禁止出現裸指令（沒有任何註解的指令區塊）。Claude 在每次新增指令時，必須在該行上方或右側加上 # 說明。