# 【演習-10】ここまでのテクニックを使った組み合わせ演習3

## 目的

- 繰り返し処理、入出力処理の組み合わせで複雑な処理実装する方法を知る。
- `read`文と`while`文を用いて、ファイルの中身を1行ずつ読みこむ方法を理解する。

## Step1

- 以下の作業は全て`~/shellscript-training/lesson/10`配下にて実施します。対象ディレクトリに移動します。

```bash
cd ~/shellscript-training/lesson/10
```

- 以下の処理を行うシェルスクリプトのファイル(`lesson_10_1.sh`)を`artifacts`に作成します。
    - `~/shellscript-training/lesson/10/artifacts`ディレクトリ内にある`filelist.txt`からファイル名を一行ずつ読み取り、読み取ったファイル名と一致するファイルを`artifacts`ディレクトリ配下に一括作成します。  
    - また、作成するたびに"<<ファイル名>>を作成しました"と表示します。(<<ファイル名>>には読み取ったファイル名が入る想定とします。)
    - filelist.txtの中身が空の場合には何も処理が行われずに終了するようにします。
    - filelist.txtのファイルが存在しない場合には「リストの記載ファイルが見つかりません。」と出力し、異常終了(終了コード1)します。
- 上記仕様に沿って正しく該当のファイルが出力されていることを確認します。
    - filelist.txtに複数行あった場合に正しく件数分ファイル作成がされること。
    - filelist.txtの中身の記述が空の場合に何も処理が行われないこと。
    - filelist.txtのファイルが見つからない場合、該当のエラーメッセージが出力され、終了コードが1で完了していること。

<details>
<summary>ヒント</summary>
<div>

- ファイルの読み込みには標準入力からの取り込みと`while`文、`read`コマンドを活用します。
- readコマンド
    - 標準入力から値を読み込み、引数で指定した名前の変数に結果を格納するコマンド
- whileコマンド
    - whileの後ろの条件式が真になっている間、繰り返し処理を実行する

</div>
</details>

### 回答・解説

<details>
<summary>回答・解説</summary>
<div>

- 以下の内容でlesson_10_1.shを作成します。

```bash
#!/bin/bash
OUTPUT_DIRECTORY=~/shellscript-training/lesson/10/artifacts

if [ ! -f ${OUTPUT_DIRECTORY}/filelist.txt ];
then
  echo "リストの記載ファイルが見つかりません。"
  exit 1
fi

while read filename
do
  touch ${OUTPUT_DIRECTORY}/$filename
  echo $filenameを作成しました
done < ${OUTPUT_DIRECTORY}/filelist.txt
```

- ファイル読み込みの前処理として、リストの記載ファイルの存在を確認しています。
    - -fはファイルが存在することを確認する条件指定で、その前に`!`を付与することで否定を評価します。(ファイルが存在しない場合に真になる)
- `while read 変数名 done < ファイル名` …　このように記載することで、ファイルから一行ずつ読み取って変数に値を格納することができます。
    - 今回の場合は`~/shellscript-training/lesson/10/artifacts/filelist.txt`を一行ずつ読み取って変数`filename`に格納しています。全ての行を読み取るとループは終了します。

- また、ファイルから一行ずつ読み込む書き方は以下のように`cat`コマンドを用いてファイル内容を出力し、パイプラインで標準入力として読ませることでも対応可能です。

```bash
#!/bin/bash
OUTPUT_DIRECTORY=~/shellscript-training/lesson/10/artifacts

if [ ! -f ${OUTPUT_DIRECTORY}/filelist.txt ];
then
  echo "リストの記載ファイルが見つかりません。"
  exit 1
fi

cat ${OUTPUT_DIRECTORY}/filelist.txt | while read filename
do
  touch ${OUTPUT_DIRECTORY}/$filename
  echo $filenameを作成しました
done
```

</div>
</details>

以上。

## Advanced

- 時間の余裕があれば以下の情報も確認してみましょう。
- [Advanced](./advanced.md)

---

[演習-11のページへ](../11/basic.md)
