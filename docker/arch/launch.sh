#!/bin/bash

IMAGE_NAME=arch
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMAGE=$USER/$IMAGE_NAME
TAG=latest
NAME="${USER}_${IMAGE_NAME}"

docker run -it \
    --net=host \
    --name ${NAME} \
    -v ${HOME}:/home/${USER}\
    ${IMAGE}:${TAG}
