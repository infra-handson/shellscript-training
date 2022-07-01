#!/bin/bash

#########
# answer-1.sh check directory usage
# Input:
#   - $1 : directory name
# Output:
#   - usage %
#########

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory name>"
    exit 1
fi

TARGET_DIR=$1
if [ ! -e ${TARGET_DIR} ]; then
    echo 'Failed, not exist directory.'
    exit 1
fi

usage=`df -h ${TARGET_DIR} | awk '{print $5}'`

echo ${usage}
