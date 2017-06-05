#!/usr/bin/env bash

set -o errexit

for D in $(< rmq-deps.txt)
do
    if [[ $D == https* ]]
    then
        DIR=${D#*/*/*/}
    else
        DIR=${D#*:}
    fi
    (cd $DIR && git fetch --all --prune --force) &
done
wait
echo DONE
