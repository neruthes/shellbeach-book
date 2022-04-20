#!/bin/bash

REPODIR=$PWD
YEAR="$1"


function _buildYear() {
    cd $YEAR
    ./build.sh $@
    cd $REPODIR
}


_buildYear $YEAR
ntex "$YEAR/Shell_Beach_Book_$YEAR.tex" $@
