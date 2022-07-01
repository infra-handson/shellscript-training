# 【演習-01】Advanced

## StepA-1

- サーバ内に設定されている時刻情報を確認してみましょう

```bash
date
```

- サーバの時刻設定はどこのタイムゾーンに合わせられているかを確認してみてください。

<details>
<summary>確認例</summary>

```bash
date
Fri Jul  1 17:28:23 JST 2022
```

- JST(日本時間)となっていることがわかります。
- この表示の設定は以下の環境変数(TZ)にて指定されている影響でdateコマンドの結果を日本時間表記になっています。

```bash
echo $TZ
Asia/Tokyo
```

</div>
</details>

## StepA-2

- OSのカーネルバージョンおよびアーキテクチャを確認してみましょう
    - unameコマンドを活用してみましょう

<details>
<summary>確認例</summary>
<div>

```bash
uname -a
Linux ip-10-0-21-49 5.10.118-111.515.amzn2.x86_64 #1 SMP Wed May 25 22:12:19 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
```

- x86_64アーキテクチャ kernel 5.10.118-111.515のバージョンのカーネルで稼働していることがわかります。

</div>
</details>

以上。

---

[演習-02のページへ](../02/basic.md)
