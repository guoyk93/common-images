#!/bin/bash

set -eu

cd $(dirname $0)

REPOS=(
    common-ubuntu \
    common-jdk
)

for REPO in $REPOS; do
    for TAG in $REPO/*; do
        echo $REPO:$TAG
        docker build -t guoyk/$REPO:$TAG $REPO/$TAG
        docker push guoyk/$REPO:$TAG
    done
done
