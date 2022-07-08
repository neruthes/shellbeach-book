#!/bin/bash

# REPODIR="$(realpath ..)"
# REALPATH="$REPODIR/_dist/Shell_Beach_Book_2022.pdf"
# XELATEXARGS=""

### Preprocessors
### PP1: Pozhehao
sed -i "s|——|\\\\pozhehao{}|g" articles/*.tex

### Generate articles list
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
    echo "\\mybookpart{第二季度}"
    _printGroup $(ls $PWD/articles/{04,05,06}*.tex 2>/dev/null)
    echo "\\mybookpart{第三季度}"
    _printGroup $(ls $PWD/articles/{07,08,09}*.tex 2>/dev/null)
    # echo "\\mybookpart{第四季度}"
    _printGroup $(ls $PWD/articles/{10,11,12}*.tex 2>/dev/null)
}
_getlist > articles-list.tex

