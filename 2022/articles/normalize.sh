#!/bin/bash

FILENAME="$1"
CONDITION="$2"
VERB="$3"

if [[ -z "$3" ]]; then
    echo "Usage:  ./normalize.sh  FILENAME  CONDITION  {find|replace}"
    exit 0
fi

function _replace() {
    case $1 in
        ":")
            printf "："
            ;;
        ",")
            printf "，"
            ;;
        ".")
            printf "。"
            ;;
        ";")
            printf "；"
            ;;
        "?")
            printf "？"
            ;;
        "!")
            printf "！"
            ;;
        "(")
            printf "（"
            ;;
        "(")
            printf "）"
            ;;
        '"')
            printf "<UNPAIRED DOUBLE QUOTATION>"
            ;;
    esac
}

case $VERB in
    f|find)
        if [[ $FILENAME == "." ]]; then
            grep "$2" *.tex
        else
            grep "$2" "$FILENAME"
        fi
        ;;
    r|replace)
        if [[ $FILENAME == "." ]]; then
            sed -i "s|$CONDITION|$(_replace "$CONDITION")|g" *.tex
        else
            sed -i "s|$CONDITION|$(_replace "$CONDITION")|g" "$FILENAME"
        fi
        ;;
esac


