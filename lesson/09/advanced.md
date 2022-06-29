# 【演習-09】Advanced

## StepA-1

- basicで実施したシェルスクリプトを複製し、lesson_09_a1.shを作成します。
- basicでは、見つかったファイルに対して1行でまとめて結果表示を行いましたが、見つかったファイル名に対し、それぞれ以下のように1行ずつechoにより文字列を追加して表示できるように改修します。

```text
file_20220725.txt が見つかりました。
file_xxxxx.txt が見つかりました。
・・・その他ファイルがあれば繰り返し
```

<details>
<summary>ヒント</summary>
<div>

- 見つかった結果に対して、forループを用いて1ファイル名ずつ処理を繰り返すように記述します。
- `for xx in 変数名`の記法を検討してみましょう。

</div>
</details>

<details>
<summary>回答例</summary>
<div>

```bash
#!/bin/bash

filename=`ls ~/shellscript-training/lesson/09/artifacts | grep file_`
if [ -z "${filename}"  ] ; then
  echo "対象ファイルが存在しません"
  exit 1
else
  for file in $filename;
  do
    echo "${file} が見つかりました"
  done
fi
```

</div>
</details>

以上。

---

[演習-10のページへ](../10/basic.md)