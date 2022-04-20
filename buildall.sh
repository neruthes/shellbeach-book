#!/bin/bash

YEARS="2022"
for YEAR in $YEARS; do
    ./singleyear.sh $YEAR
done

pushgithubdistweb --wait
