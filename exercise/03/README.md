# 課題3. 【ファイル読み込みと演算】ディレクトリ使用率の増加量を表示するスクリプトを書く

## 実施すること

- 課題2の結果の活用で、前回のチェック時からの使用率の増加量を出力しましょう
- 前回の記録がない場合はunknownを出力しましょう

## 実行例

```bash
./スクリプト名.sh /home /output
```

## 出力例

```text
Usage /home diff [from 2021-06-03 10:00:00]: 2 %
```

## 動作確認(テスト)観点

- 前回のチェック記録がある場合は差分が表示されること
- 前回のチェック記録がない場合は、unknownが表示されること
- unknownが表示された後、再度実行すると記録が残っていて差分表示ができること

## ヒント

<details>
<summary>実装のためのヒント</summary>
<div>

- $(())演算、dateコマンドを活用

</div>
</details>

以上。

---

[課題4のページへ](../04/README.md)