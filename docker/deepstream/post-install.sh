#!/bin/bash

cd $(dirname "$0")
source util.sh
cd docker/deepstream

run_sudo apt-get install --reinstall libflac8 libmp3lame0 libxvidcore4 ffmpeg
run_sudo /opt/nvidia/deepstream/deepstream/user_additional_install.sh

