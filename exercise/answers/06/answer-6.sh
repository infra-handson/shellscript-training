#!/bin/bash

#########
# answer-6.sh cleaning data
# Input:
#   - $1 : target file name
#   - $2 : delete target (hour)
# Output:
#   - Deleted line count number
#########

now=`date +%s`

if [ $# -lt 1 ]; then
    echo "Usage: $0 <target file name> (<delete target time range(default: 24)>)"
    exit 1
fi

TARGET_FILE=$1
DELETE_RANGE=${2:-24}

if [ ! -e ${TARGET_FILE} ]; then
    echo 'Failed, not exist file.'
    exit 1
fi

expr "${DELETE_RANGE}" + 1 > /dev/null 2>&1
if [ $? -ne 0 ];then
    echo 'Failed, invalid delete time range value.'
    exit 1
fi

delete_end_timestamp=$(( now - DELETE_RANGE * 3600 ))

count=0
while IFS=, read timestamp usage
do
    if [ ${timestamp} -le ${delete_end_timestamp} ];then
        ((count++))
    else
        break;
    fi
done < ${TARGET_FILE}

delete_rule="1,${count}d"
sed -e $delete_rule ${TARGET_FILE} -i
if [ $? -eq 0 ];then
    echo -e "Deleted old data [${TARGET_FILE}]\t:\t$count lines"
else
    echo "Failed, delete data."
fi
