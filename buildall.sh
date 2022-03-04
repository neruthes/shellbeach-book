#!/bin/bash

REPODIR=$PWD

YEARS="2022"
for i in $YEARS; do
    cd $i
    ./build.sh $@
done


cd $REPODIR
pushgithubdistweb
