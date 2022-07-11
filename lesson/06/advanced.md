# 【演習-06】Advanced

## StepA-1

- 標準入力から文字入力を受け取り、以下の文言を標準出力およびoutput.logファイルに出力するスクリプト(lesson_06_a1.sh)を`artifacts`に作成してみましょう。
    - 「あなたが入力した文字は"入力した文字"です。」"入力した文字"の部分は実際に標準入力した値が展開されることとします。

<details>
<summary>回答例</summary>
<div>

```bash
#!/bin/bash
DIRECTORY=~/shellscript-training/lesson/06/artifacts
echo "文字を入力してください。"
read input

if [ -z $input  ] ; then
  echo "文字を入力してください"
  read input
  if [ -z $input ] ; then
    echo "文字入力がなかったため終了します。"
    exit 1
  fi
else
  echo "あなたが入力した文字は\"${input}\"です。"
  echo "あなたが入力した文字は\"${input}\"です。" >> ${DIRECTORY}/output.log
fi
```

- 入力された変数の値をinputに格納し、echoでその文字列を展開して出力します。
- "ダブルコーテーションで囲むことで${}で記載した変数の内容が展開されます。
- 表示する文字列中にダブルクォーテーションを含めたいため、バックスラッシュでエスケープしています。
- 標準出力とファイル出力が求められているため、両方の出力を記載しています。

- また、標準出力にも出しつつ、ファイル出力もしたい場合には`tee`コマンドが活用できます。
- teeコマンドを活用すると以下のようにも書くことができます。
```bash
#!/bin/bash
DIRECTORY=~/shellscript-training/lesson/06/artifacts
echo "文字を入力してください。"
read input

if [ -z $input  ] ; then
  echo "文字を入力してください"
  read input
  if [ -z $input ] ; then
    echo "文字入力がなかったため終了します。"
    exit 1
  fi
else
  echo "あなたが入力した文字は\"${input}\"です。" | tee -a ${DIRECTORY}/output.log
fi
```

- teeコマンドは標準入力された内容を指定のファイルに書き出すという処理を行います。
- -aオプションをつけて実行することで追記型で書き込むことができます。

</div>
</details>

以上。

---

[演習-07のページへ](../07/basic.md)