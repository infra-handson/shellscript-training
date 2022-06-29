# 【演習-10】Advanced

## StepA-1

- basicで実施したシェルスクリプトを複製し、lesson_10_a1.shを作成します。
- basicの内容では、万が一、filelist.txtに記載されている内容で作成できないファイル名の記載があった場合にスクリプトがエラーになってしまいます。
- そこで、以下のようなファイル名が記載された際でもシェルスクリプトがエラーを出すことなく、メッセージを標準出力し終了コード0で正常終了するように改修しましょう。
    - 下記リストは`advanced_filelist.txt`というファイル名で`artifacts`ディレクトリに事前配置済みです。

```txt
notexistdir/created_file4.txt
space test created_file5.txt
```

<details>
<summary>ヒント</summary>
<div>

- ファイル名にスペースが含まれている場合、複数のファイルをtouchで作成してまうことになるためスペースの存在有無を確認してメッセージ出力し、次の処理に移ります。
    - スペースが含まれるかどうかは`grep`コマンドを活用し、ファイル名をフィルタして確認する方法があります。
- /が含まれる1行目のファイルの場合、存在しないディレクトリ配下にファイルを作ろうとしてコマンドがエラー終了します。
    - この`touch`コマンドのエラーをハンドリングし、独自のメッセージを標準出力に表示して正常終了させます。
- 各処理後、後続のファイルの処理も行わせるため、`continue`を用います。

</div>
</details>

<details>
<summary>回答例</summary>
<div>

- lesson_10_a1.shを以下の内容で作成します。

```bash
#!/bin/bash
OUTPUT_DIRECTORY=~/shellscript-training/lesson/10/artifacts

if [ ! -f ${OUTPUT_DIRECTORY}/advanced_filelist.txt ];
then
  echo "リストの記載ファイルが見つかりません。"
  exit 1
fi

while read filename
do
  space_check=`echo "$filename" | grep " "`
  if [ -n "${space_check}" ]; then
    echo "ファイル名に空白スペースが含まれています。 ${filename}"
    continue
  fi
  touch ${OUTPUT_DIRECTORY}/$filename 2> /dev/null
  if [ $? -ne 0 ]; then
    echo "ファイル作成に失敗しました。 ${filename}"
    continue
  else
    echo $filenameを作成しました
  fi
done < ${OUTPUT_DIRECTORY}/advanced_filelist.txt
```

- space_checkという変数に、echoでファイル名を出力し、grepで空白でフィルタをかけた結果を格納しています。
    - ファイル名に空白が含まれている場合、space_checkにファイル名が格納されます。
    - 含まれていない場合は空文字が設定されることになります。
- testコマンドの-n条件を用いて、該当の変数の展開結果の長さがゼロでないことを確認しています。
    - ゼロではない場合(=空白が含まれている)ため、メッセージを出力します。
    - continueで次のファイル名の処理に移ります。
- touchコマンド実行時、ファイルの作成ができないファイル名だった場合標準エラー出力が表示されるので、その内容を/dev/nullにリダイレクトし、出力を抑制しています。
- touchコマンドの終了コードを評価し、0でない場合にファイル作成に失敗のメッセージを出力しています。

</div>
</details>

以上。

---

[演習-11のページへ](../11/basic.md)
