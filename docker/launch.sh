#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
IMAGE=sylee/config_playground
TAG=latest
NAME=sylee_config_playground

#    -v ${SCRIPT_DIR}/..:~/ \

docker run -it \
    --net=host \
    --name ${NAME} \
    ${IMAGE}:${TAG} zsh
