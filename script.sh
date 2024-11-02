#!/bin/bash

# Finder項目で選択したCSVファイルのパスを取得
CSV_PATH="$1"

# ファイルが指定されていない場合の処理
if [ -z "$CSV_PATH" ]; then
    CSV_PATH=$(osascript -e 'try' -e 'tell application "Finder" to choose file with prompt "CSVファイルを選択してください。" of type {"public.comma-separated-values-text"}' -e 'POSIX path of result' -e 'end try' 2>/dev/null)
    
    # キャンセルされた場合はスクリプトを静かに終了
    if [ -z "$CSV_PATH" ]; then
        exit 0
    fi
fi

# CSVファイルが存在するかのチェック
if [ ! -f "$CSV_PATH" ]; then
    osascript -e 'display dialog "指定されたファイルが見つかりません。" buttons {"OK"} default button "OK"'
    exit 1
fi

# 1行ずつ読み込み
while IFS=, read -r name due_date body; do
    # AppleScriptでリマインダーを追加
    osascript -e "tell application \"Reminders\" to make new reminder with properties {name:\"$name\", due date:date \"$due_date\", body:\"$body\"}"
done < "$CSV_PATH"