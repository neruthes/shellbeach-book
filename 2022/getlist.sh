#!/bin/bash

function printGroup() {
    echo ""
    for FN in $@; do
        FNPATH=$(realpath "$FN")
        echo "\input{$FNPATH}"
    done
    echo ""
}

echo "\\part{Season 1}"
printGroup $(ls $PWD/articles/{01,02,03}*.tex 2>/dev/null)
