# 【演習-01】環境ログインとコマンド実行・結果確認基礎

## 目的

- 演習で利用する環境にアクセスし、どのような環境であるかを確認
- シェルスクリプトの元になる各種コマンドの実行の仕方、結果の確認方法を知る

## Step1

- 各自割り当てられた環境にブラウザでアクセスします。
    - パスワード入力しログインします。
- 左上部のメニュー -> 「表示」 -> 「ターミナル」を実行し、画面下部にターミナルコンソールを開きます。
- 以下の作業は全て`~/shellscript-training/lesson/01`配下にて実施します。対象ディレクトリに移動します。

```bash
cd ~/shellscript-training/lesson/01
```

- 移動した先のディレクトリ内で以下のコマンドを実行し、事前に配置されたディレクトリおよびファイルの一覧が見れるかを確認します。

```bash
ls -la ./
```

<details>
<summary>出力例</summary>
<div>

```bash
[root@ip-10-0-21-215 ~/shellscript-training/lesson/01]$ ls -la
total 8
drwxr-xr-x 3 root root   60 Jun 27 19:21 .
drwxr-xr-x 5 root root   74 Jun 27 19:16 ..
-rw-r--r-- 1 root root    0 Jun 27 19:21 advanced.md
-rw-r--r-- 1 root root 4893 Jun 27 19:18 basic.md
drwxr-xr-x 2 root root   21 Jun 27 19:19 share_files
```
</div>
</details>

## Step2

- 以下のコマンドを実行してみましょう。

```bash
echo "Hello World"
```

- `man`コマンドで`echo`コマンドの仕様を確認してみましょう。

```bash
man echo
```

- 表示されたらスペースキーで末尾まで確認してみましょう。
- 末尾まで表示されたらqをクリックしてman表示を終了しましょう。

## Step3

- 以下のコマンドを実行して、ファイルの共有ができているかを確認してみましょう。
- share_filesフォルダ内に<自分の社員番号>.txtという名前のファイルを作成します。
- ファイルの作成にはtouchコマンド等を用います。

```bash
touch ./share_files/tieXXXXXX.txt
```

- チームメンバー全員が上記完了後、上記フォルダ内のファイル一覧を確認します。

```bash
ls -la ./share_files/
```

- チームメンバーの各ファイルが表示されていることを確認します。
- また、ブラウザの左のエクスプローラー上でも該当のファイルが見れることを確認します。
- ファイルを編集し、編集内容も互いに確認できるかをチェックします。

以上。

## Advanced

- 時間の余裕があれば以下の情報も確認してみましょう。
- [Advanced](./advanced.md)

---

[演習-02のページへ](../02/basic.md)

