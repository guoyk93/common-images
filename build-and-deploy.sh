#!/bin/bash

set -eu

cd $(dirname $0)

source ./manifest.sh

for REPO in ${REPOS[@]}; do
    echo $REPO
    docker build -t guoyk/$REPO $REPO
    docker push guoyk/$REPO
done
