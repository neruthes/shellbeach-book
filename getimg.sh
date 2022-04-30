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

if [[ -e "$DEST" ]]; then
    echo "[ERROR] Destination '$DEST' already exists."
    exit 1
fi

curl "$URL" -o $DEST

