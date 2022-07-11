# 【演習-04】Advanced

## StepA-1

- basicのStep2では、直前のコマンド実行の結果を元に分岐させる例でしたが、以下の条件を元に出力を切り替えるスクリプト(lesson_04_3.sh)を作成してみましょう。
    1. hoge.txtのファイルが存在していることを確認
    1. hoge.txtのファイルが空でないことを確認
    1. 1,2の両方が満たす場合のみ、'OK'と表示されること。その他は'NG'と表示されるよう実装しましょう。

<details>
<summary>回答例</summary>
<div>

```bash
#!/bin/bash

TARGET_FILE=~/shellscript-training/lesson/04/artifacts/hoge.txt

if [ -e ${TARGET_FILE} -a -s ${TARGET_FILE} ]; then
  echo "OK"
else
  echo "NG"
fi
```

- 条件式で複数回指定する必要があるファイルパスについてはシェル変数に格納し使いまわししやすい形で記述します。
- 複数の条件の論理積(AND)については-aを用います。
- また動作確認の際は起こりうる条件パターンを考慮し、以下のケースで想定通りの動きになるかを確認すると良いでしょう。
    - hoge.txtのファイルが存在しなかった場合 ... NG
    - hoge.txtのファイルは存在するが空の場合 ... NG
    - hoge.txtのファイルが存在し、1以上の文字が記入されている場合 ... OK
    - hoge.txtのファイルが存在するが、読み込みの権限が付与されていない場合 ...NG

</div>
</details>

以上。

---

[演習-05のページへ](../05/basic.md)
