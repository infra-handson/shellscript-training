# 【演習-06】標準出力、エラー出力、標準入力を行うスクリプト作成

## 目的

- 入出力の扱い方を知る。
- 入出力の組み合わせの効果的な使い方のイメージをつける。

## Step1

- 以下の作業は全て`~/shellscript-training/lesson/06`配下にて実施します。対象ディレクトリに移動します。

```bash
cd ~/shellscript-training/lesson/06
```

- 開発者は、以下のシェルスクリプトのファイル(lesson_06_1.sh)を`artifacts`に作成します。  

``` sh
#!/bin/bash
cat hoge.txt

if [ $? -eq 0 ]; then
  echo "OK"
else
  echo "NG"
fi
```

- 上記スクリプトに対して開発者は変更を加え、以下を実現できるようにします。
  - "hoge.txt"が存在しない場合、`cat hoge.txt`の結果をerror.txtに出力します。
  - `echo "OK"`　または `echo "NG"`の結果を result.txtに出力します。
- レビュアーは以下の条件下でスクリプトを実行し条件に該当する出力がされているかを確認します。
    - hoge.txtが存在しない状態で実行し、error.txtにエラーメッセージが記載されていること。また、result.txtにNGが記載されていること。
    - hoge.txtを`artifacts`配下に作成後に実行し、error.txtにメッセージが追記されていないこと。また、result.txtにOKが追記されていること。

### 回答・解説

<details>
<summary>回答・解説</summary>
<div>

- 以下の内容でlesson_06_1.shを作成します。

```bash
#!/bin/bash
DIRECTORY=~/shellscript-training/lesson/06/artifacts
cat ${DIRECTORY}/hoge.txt 2>> ${DIRECTORY}/error.txt

if [ $? -eq 0 ]; then
  echo "OK" >> ${DIRECTORY}/result.txt
else
  echo "NG" >> ${DIRECTORY}/result.txt
fi
```

- `2>>　ファイル名`　…　標準エラー出力。エラー情報をファイルに追記型で出力します。
- `>>　ファイル名`　…　標準出力。コマンドの実行結果などをファイルに追記型で出力します。
- `>>`の部分を`>`にすると都度新規書き込みになるため、前回までの記載内容がリセットされた上で出力されます。

</div>
</details>

## Step2

- 開発者は、以下の処理を行うシェルスクリプトのファイル(lesson_06_2.sh)を`artifacts`に作成します。  
  - シェルスクリプト実行時に"1文字以上入力してください"とターミナル上に表示します。
  - 入力された文字に応じて、以下の通り処理を分岐します。
    - 1文字以上を入力してエンターを押した場合…"適切な文字数です"とターミナル上に表示します。
    - 文字を入力せずエンターを押した場合…"文字を入力してください"とターミナル上に表示します。
- レビュアーはスクリプトを実行し、文字入力をした場合と、しなかった場合で表示が変わるかを確認します。

<details>
<summary>ヒント</summary>
<div>

- 標準入力の受信には`read`コマンドを利用します。
- 文字数の判定を行うには、`-z 文字列`または`-n 文字列`を使用します。

</div>
</details>

### 回答・解説

<details>
<summary>回答・解説</summary>
<div>

- 以下の内容でlesson_06_2.shを作成します。

```bash
#!/bin/bash
echo "1文字以上入力してください"
read input

if [ -z $input  ] ; then
  echo "文字を入力してください"
else
  echo "適切な文字数です"
fi
```

- `read`… 標準入力から受け取った内容を変数にいれるコマンド。ここでは入力された値を変数`input`に格納しています。
- `[ -z $input  ]` …　文字列の判定を行う条件。指定した変数の文字列の長さがゼロであれば真を返します。なお、`-n 文字列`を使っても構いません。その場合、文字列の長さがゼロでないなら真を返すため、ifとelseの処理の中身が逆になることに注意してください。

</div>
</details>

以上。

## Advanced

- 時間の余裕があれば以下の情報も確認してみましょう。
- [Advanced](./advanced.md)

---

[演習-07のページへ](../07/basic.md)