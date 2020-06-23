#!/bin/bash

set -eu

cd $(dirname $0)

for REPO in common-*; do
    cd $REPO
    for TAG in *; do
        echo $REPO:$TAG
        docker build -t guoyk/$REPO:$TAG $TAG
        docker push guoyk/$REPO:$TAG
    done
    cd ..
done
