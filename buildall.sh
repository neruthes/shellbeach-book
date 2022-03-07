#!/bin/bash

REPODIR=$PWD


function _buildYear() {
    cd $YEAR
    ./build.sh
    # if [[ "$@" != "" ]]; then
    #     ### If any argument is given, make a clean prebuild before main build
    #     ./build.sh
    # fi
    # # ./build.sh $@
    cd $REPODIR
}


YEARS="2022"
for YEAR in $YEARS; do
    _buildYear $YEAR
    ntex "$YEAR/Shell_Beach_Book_$YEAR.tex" $@
done


# pushgithubdistweb
