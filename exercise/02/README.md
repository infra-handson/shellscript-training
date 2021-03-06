# 課題2. 【変数操作とファイル書き出し】ディレクトリ使用率をファイルに記録するスクリプトを書く

## 実施すること

- 課題1の応用で、チェックした日時と使用率の情報をcsv形式でファイルに書き出しましょう
- 対象にするディレクトリ毎に別ファイル(usage_ディレクトリ名.csvのような形式)で記録しましょう
- 出力先のディレクトリは引数で変更できるようにしましょう
- 実行の都度結果を追記できるようにしましょう

## 実行例

```bash
./スクリプト名.sh /home /output
```

## 出力例

- /output/usage__home.csv
    - ファイル内は、以下のような出力を行う(以下のサンプルは時刻をUnixtime形式で記録した例)

```text
1622720106,45%
```

## 動作確認(テスト)観点

- 引数の数が2個ではない場合、エラー処理結果が表示されること
- 存在するディレクトリを指定して正しく処理された場合、想定のファイルに記録がされること
- 繰り返し実行した場合、同一ファイルに順次結果が追記されること
- ファイルへの書き込み権限がない場所に実行した場合、エラー処理結果が表示されること
- 存在しないディレクトリを指定して出力実行した場合、エラー処理結果が表示されること

## ヒント

<details>
<summary>実装のためのヒント</summary>
<div>

- リダイレクト、変数展開を活用

</div>
</details>

以上。

---

[課題2のページへ](../03/README.md)