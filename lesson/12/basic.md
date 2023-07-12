# 【演習-12】読みやすい・理解しやすいコードを書いてみる

## 目的

- これまでの情報を駆使して、複雑な処理を実装できるようにする。
- より管理しやすい、可読性の高いコードの書き方を知る。

## Step1

- 以下の作業は全て`~/shellscript-training/lesson/12`配下にて実施します。対象ディレクトリに移動します。

```bash
cd ~/shellscript-training/lesson/12
```

- 作業用ディレクトリを`artifacts`に作成します。ディレクトリ名は各自フルネームローマ字で作成します。
    - ヤマダタロウさんの例

```bash
mkdir artifacts/taro_yamada
```

- `artifacts/original`ディレクトリ配下に`lesson_12_1.sh`というスクリプトがあります。
- このスクリプトは、指定したファイル内の文字の出現行数、出現件数を分析し結果を返すというスクリプトです。
- このスクリプトは以下のように実行します。

```bash
bash ./artifacts/original/lesson_12_1.sh ./artifacts/original/sample.log
```

- 実行結果としては以下のような出力が返ってきます。

```bash
ERRORキーワードが含まれる行数は4 ERRORキーワードの件数は6
WARNINGキーワードが含まれる行数は3 WARNINGキーワードの件数は3
INFOキーワードが含まれる行数は1 INFOキーワードの件数は1
処理が完了しました。
```

- このように処理を実現するスクリプトはすでに完成していますが、コードの書き方や内部の実行処理上効率の良いコードにはなっていません。
- このスクリプトを各自の作業用ディレクトリに複製し、同様の各キーワード毎の分析結果が出力される状態で、スクリプト内の記述方法を改良してください。(リファクタリング)

```bash
cp ./artifacts/original/lesson_12_1.sh ./artifacts/taro_yamada/
```

- また、追加要件として、以下の2点の改善を行ってください。
    1. keyword-checkerの処理に時間がかかるため、並列実行させることで処理時間の改善を図ってください。
        - ※ただし、`utils`ディレクトリ配下にある`keyword-checker`そのものは変更してはいけないものとします。
    2. 評価する対象のキーワード(ERROR,WARNING,INFO)がスクリプト内で固定になっていて変更し辛いため、設定ファイルに切り出し変更しやすくしてください。

- 出来上がったスクリプトは以下のように実行し、元の結果と同等の内容になるようにしてください。

```bash
bash ./artifacts/taro_yamada/lesson_12_1.sh ../original/sample.log
```

<details>
<summary>ヒント</summary>
<div>

- 並列実行のためにはバックグランド処理を活用します。
- 処理完了を待つには`wait`を活用します。
- 設定ファイルに切り出し読み込むには`source`コマンドを活用します。
- 共通的な処理は極力1回の記述に済むように関数化するなど検討します。

</div>
</details>

## Step2

- 各自作成が完了したらチームメンバー同士でコード内容を共有しましょう。共有の際は、どういった点を考慮して改善を行ったのか、どの点が考えきれなかったのか・わからなかったのかなども併せて記載しましょう。
- 全員で情報を共有したら、書き方として自身のコードに取り込みたい点やその他改善できそうな点などを検討しましょう。

### 改修例・解説

<details>
<summary>改修例・解説</summary>
<div>

- 書き方等は幅広く可能なため、他の書き方もありますが、一例として改修例を紹介します。
- メインの処理のコード(lesson_12_1.sh)はたとえば以下のような形にします。

```bash
#!/bin/bash

UTIL_COMMAND=~/shellscript-training/lesson/12/utils/keyword-checker
source ./parameters.config

function usage() {
  echo "使い方: スクリプト名 ログファイルパス"
  echo "例: lesson_12_1.sh ./sample.log"
  exit 1
}

function check_params() {
  if [ $# != 1 ]; then
    echo "引数の数が誤っています。"
    usage
  fi
  if [ ! -f $1 ]; then
    echo "指定されたファイルが見つかりません。"
    usage
  fi
}

function check_keyword() {
  FILEPATH=$1
  KEYWORD=$2
  result=`${UTIL_COMMAND} ${FILEPATH} ${KEYWORD}`
  if [ $? -eq 0 ]; then
    hit_rows=`echo $result | cut -d ' ' -f 2`
    hit_count=`echo $result | cut -d ' ' -f 4`
    echo "${KEYWORD}キーワードが含まれる行数は${hit_rows} ${KEYWORD}キーワードの件数は${hit_count}"
  else
    exit 1
  fi
}

function main() {
  for key in ${KEYWORDS:="ERROR WARNING INFO"}
  do
    # keyword-checkerの処理は時間がかかるため、バックグランドで並列実行させる
    check_keyword $1 $key &
  done
  # すべてのバックグラウンドプロセスが完了したことを待って完了メッセージを出力する
  wait
  echo "処理が完了しました。"
}

check_params "$@"
main $1
```

- 追加要件2で示された設定ファイルの読み込みは以下のようなファイル(`parameters.config`)を同一ディレクトリ直下に作成して読み込むようにします。

```txt
KEYWORDS="ERROR WARNING INFO"
```

- パラメータのチェックや、パラメータチェックに失敗した時の使用方法の表示、keyword-checkerの呼び出しおよびその結果の加工処理については一定の意味のある塊での処理のため、関数として切り出しています。
- また、追加要件1の並列処理は&実行させることで実現しています。
- 単純に&実行するだけだと、処理が終わり切る前にスクリプトの処理が完了してしまうため、waitを設定しバックグラウンド処理完了まで待ってから完了メッセージを出すようにしています。
- バックグラウンド処理化している部分やその待ち合わせをしている箇所など、一見コードを見るだけでは意図がくみ取り辛い部分にはコメントを補記し、意図が伝わるようにしています。
- 設定ファイルにキーワード指定を切り出した点については、万が一設定ファイルに対象の変数設定が存在しない場合を考慮し、変数設定がなかった場合のデフォルト値を何にするかを定義しています。

</div>
</details>

以上。
