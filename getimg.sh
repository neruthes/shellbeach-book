#!/bin/bash



if [[ -z "$2" ]]; then
    echo "Usage:    ./getimg.sh  1231-1  'https://...'"
    exit 0
fi

DATEMARK=$1
URL=$2

pwd
DEST=$PWD/img/aimg/2022-$DATEMARK.jpg
echo "DEST=$DEST"


curl "$URL" -o $DEST

