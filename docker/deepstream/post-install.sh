#!/bin/bash

cd $(dirname "$0")
source run_as_root.sh
cd docker/deepstream

run_as_root apt-get install --reinstall libflac8 libmp3lame0 libxvidcore4 ffmpeg
run_as_root /opt/nvidia/deepstream/deepstream/user_additional_install.sh

