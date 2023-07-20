# 【演習-03】Advanced

## StepA-1

- basicの内容では、rootユーザが実行できる状態でスクリプトを作成しました。
- ここでは、別ユーザである「ec2-user」でも作成されたスクリプトを直接実行できるようにしましょう。
- 先ほど作成したlesson_03.shのファイルを`/tmp`以下に複製して実行できるようにします。

<details>
<summary>解答例</summary>
<div>

```bash
cd ~/shellscript-training/lesson/03
cp artifacts/lesson_03.sh /tmp
chmod o+x /tmp/lesson_03.sh
```

- 実行確認はec2-userでログインして試してみます。

```bash
su -l ec2-user
/tmp/lesson_03.sh
```

</div>
</details>

以上。

---

[演習-04のページへ](../04/basic.md)
