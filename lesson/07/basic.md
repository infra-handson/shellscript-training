# 【演習-07】四則演算を行うスクリプト作成

## 目的

- 四則演算の書き方を知る。
- 複数の書き方パターンがあることを知り記載内容を理解できるようになる。
- 以下のコマンドの使い方を理解する。
    - export
    - printenv

## Step1

- 以下の作業は全て`~/shellscript-training/lesson/07`配下にて実施します。対象ディレクトリに移動します。

```bash
cd ~/shellscript-training/lesson/07
```

- 以下の計算処理を行うシェルスクリプトのファイル(lesson_07_1.sh)を`artifacts`に作成します。
  - ２つのシェル変数VAR1,VAR2を設定し、任意の整数を与えます。(ただしVAR2には0以外の整数を与えること ※1)
  - VAR1,VAR2を用いて以下の計算を行い、結果をターミナル上に表示します。
    - VAR1 + VAR2
    - VAR1 - VAR2
    - VAR1 * VAR2　(※2)
    - VAR1 / VAR2

※1. VAR2に0を入れるとゼロ除算によるエラーが発生するため。  
※2. 除算では少数点以下の表示は不要。(興味のある人は調べてやってみると良い)

- 上記仕様に合わせて各計算の結果が正しいかどうかを確認します。

### 解答・解説

<details>
<summary>解答・解説</summary>
<div>

- 以下の内容でlesson_07_1.shを作成します。

```bash
#!/bin/bash
VAR1=5 #任意の整数
VAR2=3 #任意の整数

echo $VAR1 + $VAR2 = $(($VAR1 + $VAR2))
echo $VAR1 - $VAR2 = $(($VAR1 - $VAR2))
echo $VAR1 \* $VAR2 = $(($VAR1 * $VAR2))
echo $VAR1 / $VAR2 = $(($VAR1 / $VAR2))
# 小数点の計算を行いたい場合(例:awkを使用)
## echo $VAR1 / $VAR2 = `echo "$VAR1 $VAR2" | awk '{print $1 / $2}'`
# 小数点の計算を行いたい場合(例:bcを使用)
## echo $VAR1 / $VAR2 = `echo "scale=5; $VAR1 / $VAR2" | bc`
```

- `$(())`の形式で2つの変数の値の四則演算を行った結果を出力しています。

</div>
</details>

## Step2

- 以下の計算処理を行うシェルスクリプトのファイル(lesson_07_2.sh)を`artifacts`に作成します。  
  - 環境変数ENVVAR1を読み取って以下の計算を行い、結果をターミナル上に表示します。(環境変数ENVVAR1はターミナルでコマンドを実行して設定する。値は任意の整数とする。)
    - ENVVAR1に1～100までの数字を足す。(例：ENVVARが1の場合、答えは5051になる。)
- スクリプトを実行し、仕様通りの処理結果になっているかを確認します。

<details>
<summary>ヒント</summary>

- 1～100までの数字の足し合わせには、ループ処理を応用します。

</div>
</details>

### 解答・解説

<details>
<summary>解答・解説</summary>
<div>

- 以下の内容でlesson_07_2.shを作成します。

```bash
#!/bin/bash
res=$ENVVAR1

for ((i=1; i<101; i++))
do
  res=$((res + i))
done

echo result = $res
```

- 実行は以下のように環境変数を設定して行います。
- exportコマンドを実行して環境変数をターミナルから設定します。  

```
export ENVVAR1=1
```

- printenvコマンドを実行して環境変数が設定されたことを確認します。  

```
printenv
```  

- 上記コマンドを実行すると、設定されている環境変数が全て出力されます。  
    - 環境変数の中に以下の表示があることを確認します。

```
ENVVAR1=1
```

- 備考…後の演習に出てくるパイプラインを使用し、`grep`コマンドを使うことでENVVAR1だけを特定して表示することが出来る。  
    - その場合、下記のようなコマンドとなります。

```
printenv | grep ENVVAR1
```  

- スクリプトを実行します。

```bash
bash lesson_07_2.sh
```

- 結果は以下の内容が出力されます。(ENVVAR1が1の場合)

```
result = 5051
```

</div>
</details>

以上。

## Advanced

- 時間の余裕があれば以下の情報も確認してみましょう。
- [Advanced](./advanced.md)

---

[演習-08のページへ](../08/basic.md)
