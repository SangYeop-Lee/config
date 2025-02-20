#!/bin/bash

MAINTAINER=$USER
IMAGE_NAME="ubuntu-server"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMAGE=$MAINTAINER/$IMAGE_NAME
TAG=latest
NAME="${MAINTAINER}_${IMAGE_NAME}"

docker run -it \
    --net=host \
    --gpus all \
    --shm-size=128g \
    --name ${NAME} \
    -v /home/${USER}/workspace:/home/${USER}/workspace \
    -v /home/${USER}/.cache:/home/${USER}/.cache \
    -v /home/${USER}/.ssh:/home/${USER}/.ssh \
    -v /home/${USER}/data:/data \
    -v /mnt:/mnt \
    ${IMAGE}:${TAG} bash
