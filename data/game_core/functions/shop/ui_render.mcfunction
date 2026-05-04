# ==========================================
# 檔案: shop/ui_render.mcfunction
# 執行者: @s
# ==========================================
# 重啟按鈕權限
scoreboard players enable @s transfer_act

# 推播高密度控制台 (以大量的空白推走舊訊息防洗頻)
tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
tellraw @s ["",{"text":"=== 💸 轉帳終端 ===","color":"gold","bold":true}]
tellraw @s ["",{"text":"當前可用餘額: ","color":"gray"},{"score":{"name":"@s","objective":"gd656killicon.score"},"color":"green"},{"text":" 元","color":"green"}]
tellraw @s ["",{"text":"預計匯出金額: ","color":"gray"},{"score":{"name":"@s","objective":"transfer_val"},"color":"yellow"},{"text":" 元","color":"yellow"}]
tellraw @s {"text":"-----------------------","color":"dark_gray"}
tellraw @s ["",{"text":"[ -500 ]","color":"red","clickEvent":{"action":"run_command","value":"/trigger transfer_act set 1"}},{"text":" ","color":"white"},{"text":"[ -50 ]","color":"red","clickEvent":{"action":"run_command","value":"/trigger transfer_act set 2"}},{"text":" ","color":"white"},{"text":"[ -5 ]","color":"red","clickEvent":{"action":"run_command","value":"/trigger transfer_act set 3"}},{"text":" | ","color":"gray"},{"text":"[ +5 ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger transfer_act set 4"}},{"text":" ","color":"white"},{"text":"[ +50 ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger transfer_act set 5"}},{"text":" ","color":"white"},{"text":"[ +500 ]","color":"green","clickEvent":{"action":"run_command","value":"/trigger transfer_act set 6"}}]
tellraw @s ["",{"text":"[ All in ]","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger transfer_act set 7"}},{"text":"  ","color":"white"},{"text":"[ 歸零 ]","color":"gray","clickEvent":{"action":"run_command","value":"/trigger transfer_act set 8"}},{"text":"  ","color":"white"},{"text":"[ ❌ 取消轉帳 ]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger transfer_act set 9"}}]