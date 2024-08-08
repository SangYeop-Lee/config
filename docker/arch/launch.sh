#!/bin/bash

MAINTAINER=sangyeop-lee
IMAGE_NAME=arch
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMAGE=$MAINTAINER/$IMAGE_NAME
TAG=latest
NAME="${MAINTAINER}_${IMAGE_NAME}"

docker run -it \
    --net=host \
    --name ${NAME} \
    -v ${HOME}:/home/${MAINTAINER}\
    ${IMAGE}:${TAG} bash
