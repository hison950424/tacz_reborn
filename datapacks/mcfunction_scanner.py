import os

# ==========================================
# 參數設定區 (Configuration)
# 保持不寫死原則，方便未來更改路徑或檔名
# ==========================================
target_folder_path = "./"  # 預設掃描當前目錄，請將此腳本放在你的 tacz_reborn 資料夾下，或修改為絕對路徑
output_file_name = "mcfunction_full_report.txt"

def scan_mcfunction_files(folder_path):
    """
    掃描資料夾內所有的 .mcfunction 檔案，並擷取有效指令。
    使用字典 (Dictionary) 儲存，以便未來擴充其他查詢功能。
    """
    # 建立字典儲存資料，格式為 { "檔案路徑": ["指令1", "指令2", ...] }
    mcfunction_data_dict = {}

    # os.walk 會遞迴往下找遍所有的子資料夾
    for root, dirs, files in os.walk(folder_path):
        for file_name in files:
            # 判斷副檔名是否為 .mcfunction
            if file_name.endswith(".mcfunction"):
                # os.path.join 用來將資料夾路徑與檔名組合成完整路徑
                current_file_path = os.path.join(root, file_name)
                command_list = []

                # 嘗試讀取檔案，強制使用 utf-8 避免中文註解造成錯誤
                try:
                    with open(current_file_path, 'r', encoding='utf-8') as file_obj:
                        for line_content in file_obj:
                            # strip() 可消除字串前後的空白與換行符號
                            clean_command = line_content.strip()

                            # 邏輯判斷：如果該行不是空的，且不是以 # 開頭 (註解)，才存入列表
                            if clean_command and not clean_command.startswith("#"):
                                command_list.append(clean_command)
                    
                    # 將該檔案的指令列表存入字典
                    mcfunction_data_dict[current_file_path] = command_list

                except Exception as error_msg:
                    print(f"[警告] 讀取檔案失敗: {current_file_path}, 錯誤原因: {error_msg}")

    return mcfunction_data_dict

def generate_report(data_dict, output_path):
    """
    將擷取到的資料庫轉換為純文字報告，輸出成檔案。
    """
    try:
        with open(output_path, 'w', encoding='utf-8') as file_obj:
            file_obj.write("=== Minecraft Datapack 完整指令掃描報告 ===\n")
            file_obj.write(f"總計掃描檔案數: {len(data_dict)}\n")
            file_obj.write("==================================================\n\n")

            # 走訪字典中的每一筆資料
            for file_path, commands in data_dict.items():
                file_obj.write(f"檔案: {file_path} (有效指令數: {len(commands)})\n")
                file_obj.write("指令內容:\n")
                
                # 若該檔案沒有有效指令 (例如只有註解)，給予提示
                if len(commands) == 0:
                    file_obj.write("  (無有效指令)\n")
                else:
                    for cmd in commands:
                        file_obj.write(f"  - {cmd}\n")
                
                file_obj.write("\n" + "-"*50 + "\n\n")

        print(f"[系統] 掃描完成！報告已儲存至: {output_path}")

    except Exception as error_msg:
        print(f"[錯誤] 產生報告失敗: {error_msg}")

# 主程式進入點
if __name__ == "__main__":
    print("[系統] 開始掃描 mcfunction 檔案...")
    extracted_data = scan_mcfunction_files(target_folder_path)
    generate_report(extracted_data, output_file_name)