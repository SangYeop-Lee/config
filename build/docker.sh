#!/bin/bash

# scripts from https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
cd $(dirname ${BASH_SOURCE[0]})
source $SETUP_ROOT/run_as_root.sh

# removed preinstalled packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc
	do run_as_root apt-get remove $pkg
done

# Add Docker's official GPG key:
run_as_root apt-get update
run_as_root apt-get install ca-certificates curl gnupg
run_as_root install -m 0755 -d /etc/apt/keyrings
run_as_root curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
run_as_root chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  run_as_root tee /etc/apt/sources.list.d/docker.list > /dev/null
run_as_root apt-get update

# install
run_as_root apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# verify
run_as_root docker run hello-world

run_as_root groupadd -f docker
run_as_root usermod -aG docker $USER
newgrp docker

run_as_root chown root:docker /var/run/docker.sock
