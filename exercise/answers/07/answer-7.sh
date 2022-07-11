#!/bin/bash

#########
# answer-7.sh cleaning job
# Input:
#   - $1 : target files directory
#   - $2 : delete target (hour)
# Output:
#   - None
#########

if [ $# -lt 1 ]; then
    echo "Usage: $0 <target files directory> (<delete target time range(default: 24)>)"
    exit 1
fi

TARGET_DIR=$1
DELETE_RANGE=${2:-24}

if [ ! -e ${TARGET_DIR} ]; then
    echo 'Failed, not exist directory.'
    exit 1
fi

expr "${DELETE_RANGE}" + 1 > /dev/null 2>&1
if [ $? -ne 0 ];then
    echo 'Failed, invalid delete time range value.'
    exit 1
fi

# usage data files
find ${TARGET_DIR} -type f -name 'usage*.csv' -exec ../06/answer-6.sh '{}' ${DELETE_RANGE} \;

# alert data files
find ${TARGET_DIR} -type f -name 'alert*.csv' -exec ../06/answer-6.sh '{}' ${DELETE_RANGE} \;
