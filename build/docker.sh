#!/bin/bash

# scripts from https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
cd $(dirname ${BASH_SOURCE[0]})/..
source util.sh

# removed preinstalled packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc
	do apt-get remove $pkg
done

# Add Docker's official GPG key:
run_sudo apt-get update
run_sudo apt-get install ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

# install
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# verify
docker run hello-world

