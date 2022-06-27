# 【演習-02】Advanced

## StepA-1

- ログインした時にどのユーザであっても最初に「Hello!」と表示するように設定してみましょう。
    - 全ユーザに共通でログインする時に読み込まれる設定ファイルの1つに/etc/profileがあります。
    - 別ユーザでログインする際には、`su -l ユーザ名`でログインします。
        - デフォルトでroot以外に、ec2-userというユーザが登録されています。

<details>
<summary>設定例</summary>
<div>

```bash
echo 'echo "Hello!"' >> /etc/profile
su -l root
su -l ec2-user
```

</div>
</details>

## StepA-2

- rootユーザでログインした時のみ「WARNING: This is root user!」と表示するように設定してみましょう。
    - rootユーザがログインする時に読み込まれる設定ファイルの1つに~/.bashrcがあります。

<details>
<summary>設定例</summary>
<div>

```bash
echo 'echo "WARNING: This is root user!"' >> ~/.bashrc
su -l root
su -l ec2-user
```

以上。

---

[演習-03のページへ](../03/basic.md)
