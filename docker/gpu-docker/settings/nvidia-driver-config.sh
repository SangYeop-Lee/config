#!/bin/bash

# check your appropriate driver version here. https://www.nvidia.com/Download/index.aspx?lang=en-us
BASE_URL=https://us.download.nvidia.com/tesla
DRIVER_VERSION=

curl -fSsl -O $BASE_URL/$DRIVER_VERSION/NVIDIA-Linux-x86_64-$DRIVER_VERSION.run

sudo sh NVIDIA-Linux-x86_64-$DRIVER_VERSION.run
