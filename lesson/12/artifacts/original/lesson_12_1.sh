#!/bin/bash

UTIL_COMMAND=~/shellscript-training/lesson/12/utils/keyword-checker

if [ $# != 1 ]; then
  echo "引数の数が誤っています。"
  echo "使い方: スクリプト名 ログファイルパス"
  echo "例: lesson_12_1.sh ./sample.log"
  exit 1
fi

if [ ! -f $1 ]; then
  echo "指定されたファイルが見つかりません。"
  echo "使い方: スクリプト名 ログファイルパス"
  echo "例: lesson_12_1.sh ./sample.log"
  exit 1
fi

KEYWORD="ERROR"
result=`${UTIL_COMMAND} $1 ${KEYWORD}`
if [ $? -eq 0 ]; then
  hit_rows=`echo $result | cut -d ' ' -f 2`
  hit_count=`echo $result | cut -d ' ' -f 4`
  echo "ERRORキーワードが含まれる行数は${hit_rows} ERRORキーワードの件数は${hit_count}"
fi

KEYWORD="WARNING"
result=`${UTIL_COMMAND} $1 ${KEYWORD}`
if [ $? -eq 0 ]; then
  hit_rows=`echo $result | cut -d ' ' -f 2`
  hit_count=`echo $result | cut -d ' ' -f 4`
  echo "WARNINGキーワードが含まれる行数は${hit_rows} WARNINGキーワードの件数は${hit_count}"
fi

KEYWORD="INFO"
result=`${UTIL_COMMAND} $1 ${KEYWORD}`
if [ $? -eq 0 ]; then
  hit_rows=`echo $result | cut -d ' ' -f 2`
  hit_count=`echo $result | cut -d ' ' -f 4`
  echo "INFOキーワードが含まれる行数は${hit_rows} INFOキーワードの件数は${hit_count}"
fi

echo "処理が完了しました。"