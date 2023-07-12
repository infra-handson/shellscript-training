# 【演習-04】変数によって出力を変えるスクリプト作成

## 目的

- 変数の挙動・活用の仕方について知る
- 変数による処理の切り替えのイメージをつける
- 以下のコマンドの使い方を理解する。
    - if
    - test
        - 略式test([])
    - cat
  - 終了ステータスについて理解する。

## Step1

- 以下の作業は全て`~/shellscript-training/lesson/04`配下にて実施します。対象ディレクトリに移動します。

```bash
cd ~/shellscript-training/lesson/04
```

- 以下の内容を実現するシェルスクリプト(スクリプト名はlesson_04_1.sh)を`artifact`ディレクトリに作成します。
  - シェル変数 "VAR"を設定し、値として0か1を与えます。 
  - if文とtestコマンドを用いて変数"VAR"が0か1かを判定し、結果に応じてターミナル上に文字を表示します。
    - 判定結果により表示する文字は以下の通りとします。
      - "VAR"が0の場合…"OK"。
      - "VAR"が1の場合…"NG"。
- スクリプトを実行し、正しく結果が出力されるかを確認します。

<details>
<summary>ヒント</summary>
<div>

- シェル変数の指定は以下のように記載します。

```
VAR=0
```

- testコマンドの条件指定には`数値1 -eq 数値2`が活用できます。

</div></details>


### 回答・解説

<details>
<summary>回答・解説</summary>
<div>

- 以下の内容でlesson_04_1.shを作成します。

```bash
#!/bin/bash
VAR=0

if [ $VAR -eq 0 ]; then
  echo "OK"
else
  echo "NG"
fi
```

- `VAR=0` …シェル変数VARに値0を代入します。
- `if 条件式 ;then else fi` …条件分岐。ifの後の条件式が真の場合thenの後に記載された処理が、偽の場合elseの後に記載された処理が実行されます。
- `[ $VAR -eq 0 ]`…条件指定で、$VARの内容が0とイコールであれば真となります。

- 実行は以下ように行います。

```bash
bash ./artifacts/lesson_04_1.sh
```

- 以下の内容がターミナル上に表示されていることを確認。  

```
OK
```

- `./artifacts/lesson_04_1.sh`内の`VAR=0`を`VAR=1`に書き換えます。 
- 書き換え後、スクリプトを実行し、NGがターミナル上に表示されていることを確認します。

</div>
</details>

## Step2

- 次に、以下の内容を実現するシェルスクリプトのファイル(lesson_04_2.sh)を`artifacts`ディレクトリに作成します。
  - catコマンドを用いて、"hoge.txt"の内容を表示する処理が実行される。
    - ※hoge.txtはシェルスクリプトと同じディレクトリ(`artifacts`)上に作成します。ファイルの存在確認の用途で利用するため"hoge.txt"の中身は空で構いません。
  - if文とtestコマンドを用いて、catコマンドの終了ステータスを判定し、結果に応じてターミナル上に文字を表示します。
    - 判定結果により表示する文字は以下の通りとします。
      - catコマンドが正常に実行された(="hoge.txt"が存在する)場合…"OK"。
      - catコマンドが正常に実行されなかった(="hoge.txt"が存在しない)場合…"NG"。
- hoge.txtの存在有無により出力結果が変わることを確認します。

<details>
<summary>ヒント</summary>
<div>

- catコマンドの終了ステータスを取得するためには特殊変数`$?`を使用できます。
- 特殊変数`$?`の値が0、つまり成功かそれ以外を判定するために`数値1 - eq 数値2`を使用できます。

</div>
</details>

### 回答・解説

<details>
<summary>回答・解説</summary>
<div>

- 以下のようなスクリプトを作成します。(lesson_04_2.sh)

```　sh
#!/bin/bash
cat hoge.txt

if [ $? -eq 0 ]; then
  echo "OK"
else
  echo "NG"
fi
```

- `[ $? -eq 0 ]`…条件指定。`$?`は特殊変数で、直前のコマンドが成功している場合は値が0となります。その他の値の場合は失敗を示します。
- 空ファイルを作成するtouchコマンドを実行して、hoge.txtを作成します。(エディタから直接からファイルを作成しても良い)

```
touch ./artifacts/hoge.txt
```

- bashコマンドで`lesson_04_2.sh`を実行します。  

```
bash lesson_04_2.sh
```

- 以下の内容がターミナル上に表示されていることを確認します。  

```
OK
```

- ファイルを削除するrmコマンドを実行して、hoge.txtを削除します。

```bash
rm hoge.txt
```

- bashコマンドでlesson_04_2.shを再度実行します。  

```
bash lesson_04_2.sh
```

- 以下の内容がターミナル上に表示されていることを確認します。  

```
cat: hoge.txt: No such file or directory
NG
```

</div>
</details>

以上。

---

## Advanced

- 時間の余裕があれば以下の情報も確認してみましょう。
- [Advanced](./advanced.md)

---

[演習-05のページへ](../05/basic.md)

