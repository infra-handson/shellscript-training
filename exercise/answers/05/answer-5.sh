#!/bin/bash

#########
# answer-5.sh disk usage diff alert check
# Input:
#   - $1 : directory name
#   - $2 : output_dir
#   - $3 : threshold_value
# Output:
#   - Usage diff info
#########

now=`date +%s`

function output_usage () {
    usage=$1
    output_filename=$2
    echo ${now},${usage} 2> /dev/null >> ${output_filename}
    if [ $? -ne 0 ];then
        echo 'Failed, cannot write output file'
        exit 1
    fi
}

if [ $# -ne 3 ]; then
    echo "Usage: $0 <directory name> <output directory name> <threshold value(0-100)>"
    exit 1
fi

TARGET_DIR=$1
OUTPUT_DIR=$2
THRESHOLD=$3

if [ ! -e ${TARGET_DIR} -o ! -e ${OUTPUT_DIR} ]; then
    echo 'Failed, not exist directory.'
    exit 1
fi

expr "${THRESHOLD}" + 1 > /dev/null 2>&1
if [ $? -ne 0 ];then
    echo 'Failed, invalid threshold value.'
    exit 1
fi
if [ ${THRESHOLD} -lt 0 -o ${THRESHOLD} -gt 100 ]; then
    echo 'Failed, invalid threshold value.'
    exit
fi

converted_name=${TARGET_DIR//\ /}
converted_name=${converted_name//\//_}
output_filename=${OUTPUT_DIR}/usage_${converted_name}.csv

function check_process () {
    usage=`df -h ${TARGET_DIR} | awk '{print $5}' | grep -v 'Use'`

    last_check_data=`tail -1 ${output_filename} 2> /dev/null`
    if [ $? -ne 0 -o ${#last_check_data} -eq 0 ];then
        echo Usage ${TARGET_DIR} diff: unknown
        output_usage $usage $output_filename
        return
    fi

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
    if [ ${usage_diff} -ge ${THRESHOLD} ];then
        echo ${now},${usage_diff} 2> /dev/null >> ${OUTPUT_DIR}/alert_${converted_name}.csv
        if [ $? -ne 0 ];then
            echo 'Failed, cannot write output file.'
            exit 1
        fi
    fi
}

while :
do
    check_process
    sleep 3600
done
