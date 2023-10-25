#!/bin/bash

MAINTAINER=sylee
IMAGE_NAME=config_playground
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMAGE=$MAINTAINER/$IMAGE_NAME
TAG=latest
NAME="${MAINTAINER}_${IMAGE_NAME}"

docker run -it \
    --net=host \
    --name ${NAME} \
    -v ${SCRIPT_DIR}/..:/workspace \
    ${IMAGE}:${TAG} fish
