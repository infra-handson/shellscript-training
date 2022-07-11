#!/bin/bash

#########
# answer-2.sh check directory usage and output file
# Input:
#   - $1 : directory name
#   - $2 : output_dir
# Output:
#   - None
#########

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

now=`date +%s`

converted_name=${TARGET_DIR//\ /}
converted_name=${converted_name//\//_}
output_filename=${OUTPUT_DIR}/usage_${converted_name}.csv


echo ${now},${usage} 2> /dev/null >> ${output_filename}
if [ $? -ne 0 ]; then
    echo 'Failed, cannot write output file'
    exit 1
fi
