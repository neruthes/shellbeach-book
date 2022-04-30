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

### Note: The 'ntex' script is available at <https://github.com/neruthes/NDevShellRC/blob/master/bin/ntex>
