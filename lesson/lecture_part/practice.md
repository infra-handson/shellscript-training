# 実践編パート

## 事前実行

- 以下の作業は全て`~/shellscript-training/exercise`配下にて実施します。対象フォルダに移動します。

```bash
cd ~/shellscript-training/exercise
```

## 講義資料p.60

- `func1`関数が定義された`func1.sh`を実行し結果を出力してみましょう。

```bash
bash ./func1.sh
```


## 講義資料p.65

- 配列を定義してみましょう。

```bash
sample=("a" "b" "c")
```

- 配列の要素の個数を参照してみましょう。

```bash
echo ${#sample[@]}
```

- 配列の要素の中身全てを出力してみましょう。

```bash
echo ${sample[@]}
```

## 講義資料p.69

- `sed`コマンドを試してみましょう。

```bash
cat ./original.txt
```

```bash
sed -e "s/Hello/GoodBy/g" ./original.txt > converted.txt
```

```bash
cat converted.txt
```


- `awk`コマンドを試してみましょう。

```bash
echo "192.168.1.25" | awk -F '.' '{printf "%s.%s\n", $1, $2}'
```

## 講義資料p.70

- `seq`コマンドを試してみましょう。

```bash
seq 1 2 10
```

- sortコマンドを試してみましょう。

```bash
echo -e "ccc\nbbb\naaa"
```

```bash
echo -e "ccc\nbbb\naaa" | sort
```

## 講義資料p.71

- `date`コマンドで1週間前の日付を出力してみましょう。
    - `TZ`環境変数でタイムゾーンを指定して実行する例

```bash
TZ=Asia/Tokyo date +"%Y-%m-%d %H:%M:%S" --date "1 week ago"
```

- `find`コマンドでカレントディレクトリ以下の`.txt`のファイルのみを検索してみましょう。

```bash
find ./ -name "*.txt"
```

## 講義資料p.72

- `grep`コマンドで`~/shellscript-training/exercise`フォルダ配下のファイルの内、`txt`というキーワードを含まないものを出力してみましょう。


```bash
ls -l ~/shellscript-training/exercise | grep -v txt
```

- `curl`コマンドで`example.com`のトップページの`html`を出力してみましょう。

```bash
curl -XGET http://example.com
```

## 講義資料p.74

- `cron`の定義を確認してみましょう。(現在ログインしているユーザ(root)のcron定義)

```bash
crontab -l
```

```bash
cat /var/spool/cron/root
```

- `cron`の定義を実施してみましょう。(5分置きに`echo`コマンドを実行する定義)

```bash
crontab -e
```

```bash
*/5 * * * * echo "TEST"
```

上記内容を記入(iコマンドで編集モードに変更後、上記内容を貼り付け)、エスケープでモード変更後、:wqで書き込み。

- 設定された`cron`定義を確認してみましょう。

```bash
crontab -l
```

```bash
cat /var/spool/cron/root
```

- `cron`の共通の定義を確認してみましょう。

```bash
cat /etc/crontab
```

## 講義資料p.77

- `var_echo.sh`を各種フラグをつけて実行してみましょう。

```bash
bash -u ./var_echo.sh
```

```bash
bash -v ./var_echo.sh
```

```bash
bash -x ./var_echo.sh
```


実践編の講義部分は以上で終了です。お疲れさまでした。

---

[基礎編のページへ](basic.md)
