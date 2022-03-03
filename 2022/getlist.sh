#!/bin/bash

function printGroup() {
    echo ""
    for FN in $@; do
        FNPATH=$(realpath "$FN")
        echo "\input{$FNPATH}"
    done
    echo ""
}
echo "\\mybookpart{第一季度}"
printGroup $(ls $PWD/articles/{01,02,03}*.tex 2>/dev/null)
