# 【演習-02】シェルの状態を確認

## 目的

- 演習環境で利用しているシェルの種別やログイン先シェルの設定を知る

## Step1

- 以下の作業は全て`~/shellscript-training/lesson/02`配下にて実施します。対象ディレクトリに移動します。

```bash
cd ~/shellscript-training/lesson/02
```

- どのユーザでログインしているかを確認してみましょう。

```bash
whoami
```

- `/etc/passwd`ファイルを確認して、上記ユーザのログインシェルの種別を確認しましょう。

```bash
cat /etc/passwd
```

<details>
<summary>出力例</summary>
<div>

```bash
cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
・・・省略
```

上記rootユーザに関する行のコロン区切りの最後の領域の情報を確認します。

</div>
</details>


- 以下コマンドを実行して実際にどのシェル上にいるかを確認しましょう。

```bash
su -l root
# 上記コマンド実行によりrootユーザでログインシェルを実行
echo $SHELL
```

## Step2

- ホームディレクトリ直下の`.bashrc`ファイルの中身を見てみましょう。

```bash
cat ~/.bashrc
```

- ホームディレクトリ直下の`.bash_profile`ファイルの中身を見てみましょう。

```bash
cat ~/.bash_profile
```

以上。

## Advanced

- 時間の余裕があれば以下の情報も確認してみましょう。
- [Advanced](./advanced.md)

---

[演習-03のページへ](../03/basic.md)

