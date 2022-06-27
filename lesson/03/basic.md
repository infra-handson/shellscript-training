# 【演習-03】シェルスクリプトの作成を試す

## 目的

- 指示された内容のシェルスクリプトを実際に記載してみて動かす
- 実行の仕方、結果の確認の仕方を知る
- 以下のコマンドの使い方を理解する
    - `bash`
    - `touch`
    - `echo`
    - `chmod`

## Step1

- 以下の作業は全て`~/shellscript-training/lesson/03`配下にて実施します。対象ディレクトリに移動します。

```bash
cd ~/shellscript-training/lesson/03
```

- 開発者は、以下の内容を実現するシェルスクリプト(スクリプト名はlesson_03.sh)を`artifact`ディレクトリに作成します。
    - スクリプトを実行後、"Hello World"という文字列を出力して終了。
- レビュアーは、スクリプトを実行し、正しく結果が出力されるかを確認します。

<details>
<summary>ヒント</summary>
<div>

- echoコマンドを活用する
- シバンに/bin/bashを設定する

</div>
</details>

### 回答・解説

<details>
<summary>回答・解説</summary>
<div>

- 以下の内容でスクリプトを作成します。

```bash
#!/bin/bash

echo "Hello World"
```

- 以下のコマンドで実行します。

```bash
bash ./artifacts/lesson_03.sh
```

- bashコマンドの引数として作成したファイルの場所を指定することで、該当のシェルスクリプトの中身をbash上で実行した結果を返します。

</div>
</details>

## Step2

- 次に、bashコマンドを用いずに直接実行でスクリプトを実行してみましょう。
    - 直接実行とは、`./artifacts/lesson_03.sh`のようにコマンドライン上でファイル名のみを指定して実行する形式です。
    - 開発者が実行できるように調整し、レビュアーが直接実行をして確認しましょう。

<details>
<summary>ヒント</summary>
<div>

- 実行権限が付与されているかを確認しましょう。(ls -l等のコマンドで確認が可能です。)
- 実行権限の管理にはchmodコマンドを活用しましょう。

</div>
</details>

### 回答・解説

<details>
<summary>回答・解説</summary>
<div>

- 以下のコマンドで権限を確認します。

```bash
ls -l ./artifacts/lesson_03.sh
-rw-r--r-- 1 root root 32 Jun 27 22:25 artifacts/lesson_03.sh
```

- `-rw-r--r--`の部分からファイルの所有者には読み込み(r)と書き込み(w)の権限のみが付与されている状態であることがわかります。
- 実行するには実行権限(x)が必要になります。
- そのため、以下コマンドで権限を付与します。

```bash
chmod u+x ./artifacts/lesson_03.sh
ls -l ./artifacts/lesson_03.sh
```

- この状態で、以下直接実行します。

```bash
./artifacts/lesson_03.sh
```

</div>
</details>

## Step3

- 演習-02の作業ディレクトリ下にいる状態から今回作成したスクリプトを実行してみましょう。
- まずは以下コマンドを実行し、現在いるディレクトリを移動します。
- 開発者・レビュアー両者確認してみましょう。

```bash
cd ~/shellscript-training/lesson/02
```

### 回答・解説

<details>
<summary>回答・解説</summary>
<div>

- 以下のコマンドで別のディレクトリにあるファイルを指定して実行します。
    - ../を設定することで、現在いるディレクトリの1階層上の場所を指し示します。

```bash
../03/artifacts/lesson_03.sh
```

- もしくは、絶対パス指定で以下の実行方法でも可能です。

```bash
/root/shellscript-training/lesson/03/artifacts/lesson_03.sh
```
</div>
</details>

以上。

## Advanced

- 時間の余裕があれば以下の情報も確認してみましょう。
- [Advanced](./advanced.md)

---

[演習-04のページへ](../04/basic.md)
