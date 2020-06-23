#!/bin/bash

set -eu

cd $(dirname $0)

for REPO in common*; do
    echo $REPO
    docker build -t guoyk/$REPO $REPO
    docker push guoyk/$REPO
done
