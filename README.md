# GTDトリガーリスト管理アシスタント

このプロジェクトは、[マイGPT](https://chatgpt.com/g/g-NkY70Mxth-gtd-torikaasisutanto)を利用して、GTDのトリガーリストを管理するためのAutomatorアプリです。  
マイGPTで生成したトリガーリストをCSV形式に出力し、さらにAppleのリマインダーアプリに自動的に登録します。

## 特徴

- **マイGPT連携**：[マイGPT](https://chatgpt.com/g/g-NkY70Mxth-gtd-torikaasisutanto)を使用して、GTDトリガーリストのリアリング（見直し）やタスクの生成が可能です。
- **CSVからリマインダーへの自動登録**：マイGPTで生成されたトリガーリストをCSV形式に出力し、リマインダーにタスクを追加します。
- **ファイル選択ダイアログ**：CSVファイルが指定されていない場合、アプリケーション実行時にFinderでCSVファイルを選択するよう促します。
- **エラーハンドリング**：ファイルが選択されていない場合や存在しない場合、適切なエラーメッセージを表示して処理を終了します。

## 必要な環境

- macOS
- Appleのリマインダーアプリ
- Automator
- [マイGPTのGTDトリガーリストアシスタント](https://chatgpt.com/g/g-NkY70Mxth-gtd-torikaasisutanto)

## インストール方法

1. このリポジトリをクローン、またはZIPファイルとしてダウンロードして展開します。
2. [script.sh](script.sh)ファイルをAutomatorにインポートし、アプリケーションとして保存します。

## 使用方法

1. [マイGPTのGTDトリガーリストアシスタント](https://chatgpt.com/g/g-NkY70Mxth-gtd-torikaasisutanto)を利用して、トリガーリストを生成します。
2. GPTがヒアリングをしますので、それに回答することで、CSVが出力されます。
　（サンプルファイル：[sample_reminders.csv](sample_reminders.csv)）。
3. このAutomatorアプリを実行します。
   - CSVファイルが指定されていない場合、Finderのファイル選択ダイアログが表示されるので、CSVファイルを選択してください。
   - 選択されたCSVファイルの各行に基づいて、リマインダーが自動的に作成されます。

## CSVフォーマット

GTDトリガーリストを次のようなフォーマットでCSVファイルに保存してください：

```csv
リマインダー名,期限,メモ
買い物リスト,2024-11-10 15:00:00,卵と牛乳を買う
会議準備,2024-11-11 09:00:00,必要な資料を印刷する
```

- **1列目**：リマインダーのタイトル
- **2列目**：期限（フォーマット：`YYYY-MM-DD HH:MM:SS`）
- **3列目**：メモ

サンプルファイルは [sample_reminders.csv](sample_reminders.csv) にも含まれていますので、ご活用ください。

## エラーハンドリング

- **CSVファイルが指定されていない場合**：Finderでファイル選択ダイアログが表示されます。
- **ファイル選択がキャンセルされた場合**：アプリケーションはエラーメッセージを表示せず静かに終了します。
- **ファイルが存在しない場合**：エラーメッセージを表示し、アプリケーションは終了します。

## スクリプトファイル

スクリプトの詳細については、[script.sh](script.sh)ファイルを参照してください。

## 注意事項

- **日付フォーマット**が適切でない場合、リマインダーの追加に失敗する可能性があります。`YYYY-MM-DD HH:MM:SS`の形式で指定してください。
- **アクセス許可**：アプリケーションの初回実行時に、リマインダーへのアクセス許可が求められることがあります。

## ライセンス

このプロジェクトはMITライセンスのもとで公開されています。詳しくは、[LICENSE](LICENSE)ファイルを参照してください。