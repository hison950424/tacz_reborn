# Proving Grounds Datapack — Claude 工作守則

## 專案概述

這是一個 Minecraft 1.20.1 的伺服器端 datapack，主語言為繁體中文，程式碼位於 `data/game_core/functions/`。

---

## 文件寫入規則（CRITICAL）

所有 `.mcfunction` 及 `.json` 文件**必須以 UTF-8 無 BOM 格式儲存**。

Minecraft 無法讀取含 BOM 的文件，且**不會報錯**，只是靜默失敗。典型症狀：把文件內容完整複製貼上到新文件就能執行，但原文件本身執行沒有任何反應。這個問題曾多次造成難以察覺的 bug。

### PowerShell 寫入文件時，唯一允許的方式：

```powershell
$enc = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText("C:\完整路徑\file.mcfunction", $content, $enc)
```

**嚴禁使用以下指令**（Windows 預設產生 UTF-8 with BOM）：
- `Set-Content`
- `Out-File`
- `Add-Content`
- `echo >` / `>>`
- Notepad 另存新檔（預設）

### 每次新建文件後必須驗證 BOM：

```powershell
$b = [System.IO.File]::ReadAllBytes("完整路徑")
if ($b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF) {
    Write-Host "WARNING: BOM 偵測到！" -ForegroundColor Red
} else {
    Write-Host "OK: 無 BOM" -ForegroundColor Green
}
```

### 批量掃描整個 functions 資料夾：

```powershell
$root = "C:\mcdatapack\1.20.1 Proving Grounds_Server Side_V3.0.0\world\datapacks\tacz_reborn\data\game_core\functions"
$found = Get-ChildItem -Path $root -Recurse -Include "*.mcfunction","*.json" | Where-Object {
    $b = [System.IO.File]::ReadAllBytes($_.FullName)
    $b.Length -ge 3 -and $b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF
}
if ($found) { $found | ForEach-Object { Write-Host "BOM: $($_.FullName)" } }
else { Write-Host "全部檔案無 BOM" }
```

**規則：批量生成文件後，必須執行一次批量掃描，確認全部無 BOM。**

---

## 架構速查

### Scoreboard 關鍵變數

| 變數 | 說明 |
|---|---|
| `#global game_state` | 0=大廳, 1=BR, 2=軍備競賽(TDM/DOM/GK) |
| `#global arms_sub_mode` | 0=BR, 1=TDM, 2=DOM, 3=GK |
| `select_mode` (trigger) | 玩家觸發操作的通道 |
| `join_team` | 1=紅, 2=藍, 3=綠, 4=黃, 5=孤狼, 17=孤狼已分配 |

### select_mode 觸發值對照

| 值 | 作用 |
|---|---|
| 1 | BR 進入大廳流程 |
| 3 | DOM 設定書 |
| 4 | TDM 設定書 |
| 5 | TDM/DOM 開始遊戲 |
| 6 | 職業選擇 |
| 7 | 返回模式選擇 |
| 8 | 取消 |
| 9 | 從地圖返回 |
| 10 | BR 參數設定 |
| 11 | GK 設定介面 |
| 12 | GK 開始遊戲 |
| 13 | BR 參數（其他） |

### 主要路由文件

- `core/main.mcfunction` — 每 tick 主路由（game_state 分派）
- `lobby/tick.mcfunction` — 大廳每 tick 邏輯（select_mode 路由）
- `core/init.mcfunction` — 伺服器初始化（scoreboard 建立等）

### 孤狼（孤狼隊）

- `join_team=5` → 系統分配到 `solo1`~`solo16` 的獨立 Minecraft 隊伍
- GK 模式中每個 solo 隊擁有獨立進度變數（`#gk_stage_solo1` 等）

---

## 編碼慣例

- 所有注解使用繁體中文
- 文件頂部附上 `# 檔案:` 與 `# 目的:` 說明
- 使用 `#global` 前綴表示全域假玩家，`#gk_` 前綴表示 GK 模組變數
- 執行者（`@s`）在文件頂部注解中標明
