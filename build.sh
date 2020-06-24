#!/bin/bash

set -eu

cd $(dirname $0)

source ./manifest.sh

for REPO in ${REPOS[@]}; do
    docker build -t guoyk/common-$REPO $REPO
done
