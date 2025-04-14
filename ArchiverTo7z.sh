#!/bin/bash

# 1. 輸入要壓縮的檔案/資料夾路徑
read -p "📁 請輸入要壓縮的檔案或資料夾完整路徑：" source_path

# 確認來源存在
while [ ! -e "$source_path" ]; do
    echo "❌ 路徑不存在，請重新輸入"
    read -p "📁 請輸入要壓縮的檔案或資料夾完整路徑：" source_path
done

# 2. 輸入輸出壓縮檔名稱（不含副檔名）
read -p "💾 請輸入壓縮檔名稱（不含副檔名）：" output_name

# 3. 指定桌面作為輸出路徑
desktop_path="$HOME/Desktop"
output_file="$desktop_path/${output_name}.7z"

# 4. 自動產生密碼為今天日期（yyyyMMdd）
password=$(date +"%Y%m%d")

# 5. 執行壓縮
echo "🚀 正在壓縮..."
7z a -t7z "$output_file" "$source_path" -p"$password" -mhe=on

# 6. 壓縮完成提示
if [ $? -eq 0 ]; then
    echo "✅ 壓縮完成！"
    echo "📦 輸出檔案：$output_file"
    echo "🔐 壓縮密碼：$password"
else
    echo "❌ 壓縮失敗！"
fi

# 7. 等待按任意鍵結束
echo ""
read -n 1 -s -r -p "🟢 執行完畢，請按任意鍵離開..."
echo ""
