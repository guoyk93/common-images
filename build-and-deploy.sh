#!/bin/bash

set -eu

cd $(dirname $0)

source ./manifest.sh

for REPO in ${REPOS[@]}; do
    docker build -t guoyk/common-$REPO $REPO
    docker tag guoyk/common-$REPO docker.pkg.github.com/guoyk93/common-images/$REPO
done

for REPO in ${REPOS[@]}; do
    docker push docker.pkg.github.com/guoyk93/common-images/$REPO
done

for REPO in ${REPOS[@]}; do
    docker push guoyk/common-$REPO
done
