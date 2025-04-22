#!/bin/bash

MAINTAINER=$USER
IMAGE_NAME="ubuntu-server"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMAGE=$MAINTAINER/$IMAGE_NAME
TAG=latest
NAME="${MAINTAINER}_${IMAGE_NAME}"

docker run -it \
	--privileged \
    --net host \
    --gpus all \
    --shm-size=200g \
    --name ${NAME} \
    -v ${HOME}/workspace:${HOME}/workspace \
    -v ${HOME}/.cache:${HOME}/.cache \
    -v ${HOME}/.ssh:${HOME}/.ssh \
    -v /mnt:/mnt \
    ${IMAGE}:${TAG} bash
