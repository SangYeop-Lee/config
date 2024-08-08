#!/bin/bash

# scripts from https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
cd $(dirname ${BASH_SOURCE[0]})/..
source util.sh

# removed preinstalled packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc
	do run_sudo apt-get remove $pkg
done

# Add Docker's official GPG key:
run_sudo apt-get update
run_sudo apt-get install ca-certificates curl gnupg
run_sudo install -m 0755 -d /etc/apt/keyrings
run_sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
run_sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  run_sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
run_sudo apt-get update

# install
run_sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# verify
run_sudo docker run hello-world

run_sudo groupadd -f docker
run_sudo usermod -aG docker $USER
run_sudo chown root:docker /var/run/docker.sock
