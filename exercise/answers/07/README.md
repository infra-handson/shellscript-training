# 課題7. 解説

## 課題テーマ

- 【ファイル探索・cron実行】ハウスキーピング処理を日次自動実行する

## 解答サンプル

- [解答サンプルスクリプト](./answer-7.sh)

## 解説

- findコマンドを用いてusageから始まって.csvで終わるファイル、alertから始まって.csvで終わるファイルのリストを探索し、該当のファイルに対して課題6のスクリプトを実行
- cronの設定例は以下。

```
crontab -e
* 9 * * * ./answer-7.sh /output 24
```

以上。
