#!/bin/bash

# REPODIR="$(realpath ..)"
# REALPATH="$REPODIR/_dist/Shell_Beach_Book_2022.pdf"
# XELATEXARGS=""

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

