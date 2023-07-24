# 【演習-07】Advanced

## StepA-1

- 1から100の内、2と3の倍数の数値を以下の形式で出力するスクリプト(lesson_07_a1.sh)を`artifacts`に作成してみましょう。
    - 「"6" は2または3の倍数です。」"6"の部分は2もしくは3の倍数となっている数値が展開されることとします。

<details>
<summary>解答例</summary>
<div>

```bash
#!/bin/bash

for i in {1..100}
do
  result_2=$((i % 2))
  result_3=$((i % 3))
  if [ ${result_2} -eq 0 -o ${result_3} -eq 0 ];
  then
    echo "\"${i}\"は2または3の倍数です。"
  fi
done
```

- `%`を用いることで剰余算の結果となります。
- 2で割った時に0となる。もしくは3で割った時に0となる時にecho出力されます。

</div>
</details>

以上。

---

[演習-08のページへ](../08/basic.md)