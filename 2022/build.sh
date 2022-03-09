#!/bin/bash

REPODIR="$(realpath ..)"
REALPATH="$REPODIR/_dist/Shell_Beach_Book_2022.pdf"
XELATEXARGS=""
#####################################################################
### Parse arguments. Magic; do not touch.
POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --png)
        TOIMG="png"
        shift # past argument
        ;;
    --jpg)
        TOIMG="jpg"
        shift # past argument
        ;;
    --oss)
        TONASOOS="y"
        shift # past argument
        ;;
    --range=*)
        PAGES_RANGE="${1/--range=/}"
        shift # past argument
        ;;
    -*|--*)
        echo "Unknown option $1"
        exit 1
        ;;
    *)
        POSITIONAL_ARGS+=("$1") # save positional arg
        shift # past argument
        ;;
  esac
done
set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters
#####################################################################

### Preprocessors
### PP1: Pozhehao
sed -i "s|——|\\\\pozhehao{}|g" articles/*.tex

### Generate articles list
# ./getlist.sh > articles-list.tex
function _printGroup() {
    echo ""
    for FN in $@; do
        FNPATH=$(realpath "$FN")
        echo "\input{$FNPATH}"
    done
    echo ""
}
function _getlist() {
    echo "\\mybookpart{第一季度}"
    _printGroup $(ls $PWD/articles/{01,02,03}*.tex 2>/dev/null)
}
_getlist > articles-list.tex

