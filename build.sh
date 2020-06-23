#!/bin/bash

set -eu

cd $(dirname $0)

REPOS=(
    common-ubuntu:20.04
    common-jdk:11
)

for REPO in ${REPOS[@]}; do
    echo $REPO
    docker build -t guoyk/$REPO $REPO
    docker push guoyk/$REPO
done
