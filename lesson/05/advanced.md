# 【演習-05】Advanced

## StepA-1

- 1から100まで、2個置き(値と値の間の差が3ずつ増える)に数値を出力するスクリプト(lesson_05_a1.sh)を`artifacts`に作成してみましょう。
- 結果は以下のように出力されることを期待します。

```text
1
4
7
10
13
16
19
....省略
100
```

<details>
<summary>解答例</summary>
<div>

```bash
#!/bin/bash
count=0
for i in {1..100}
do
  if [ $count -eq 0 ]
  then
    echo $i
  fi
  count=$((++count))
  if [ $count -eq 3 ]
  then
    count=0
  fi
done
```

- `for i in {1..100}`の記法で1～100までを変数iに格納してループを回します。
- 2個置きのチェックのためにcount変数に初期値0を格納してループに入ります。
- count値が0ならechoで現在のループの番号を出力します。
- countを0,1,2とカウントアップし、3に達したら0にリセットします。
- この繰り返しで2個置きに出力が実現します。

- その他の書き方として、seqというコマンドを有効に活用することでシンプルに記載することができます。

```bash
#!/bin/bash
for i in `seq 1 3 100`
do
  echo $i
done
```

- seqコマンドは、引数として、「開始の値 増分の値 終了の値」を取り、引数に指定した条件に合う数の連続値を返します。

</div>
</details>

以上。

---

[演習-06のページへ](../06/basic.md)