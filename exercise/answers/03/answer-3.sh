#!/bin/bash

#########
# answer-3.sh check directory usage diff
# Input:
#   - $1 : directory name
#   - $2 : output_dir
# Output:
#   - Usage diff info
#########

function output_usage () {
    usage=$1
    output_filename=$2
    now=`date +%s`
    echo ${now},${usage} 2> /dev/null >> ${output_filename}
    if [ $? -ne 0 ];then
        echo 'Failed, cannot write output file'
        exit 1
    fi
}

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory name> <output directory name>"
    exit 1
fi

TARGET_DIR=$1
OUTPUT_DIR=$2

if [ ! -e ${TARGET_DIR} -o ! -e ${OUTPUT_DIR} ]; then
    echo 'Failed, not exist directory.'
    exit 1
fi

usage=`df -h ${TARGET_DIR} | awk '{print $5}' | grep -v 'Use'`

converted_name=${TARGET_DIR//\ /}
converted_name=${converted_name//\//_}
output_filename=${OUTPUT_DIR}/usage_${converted_name}.csv

last_check_data=`tail -1 ${output_filename} 2> /dev/null`
if [ $? -ne 0 -o ${#last_check_data} -eq 0 ];then
    echo Usage ${TARGET_DIR} diff: unknown
    output_usage $usage $output_filename
    exit 1
fi
echo ${last_check_data}
IFS=','
set -- ${last_check_data}
before_timestamp=$1
before_percent=$2

before_only_percent_num=${before_percent//%}
now_only_percent_num=${usage//%}

before_time=`date -d@${before_timestamp} +"%Y/%m/%d %H:%M:%S"`
usage_diff=$((now_only_percent_num - before_only_percent_num))

echo Usage ${TARGET_DIR} diff [from ${before_time}]: $usage_diff %

output_usage ${usage} ${output_filename}
