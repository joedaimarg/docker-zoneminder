#!/bin/bash
# NOTE: make sure to chmod a+x install-docker.sh

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Update the apt package index and install packages
# to allow apt to use a repository over HTTPS
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify key
sudo apt-key fingerprint 0EBFCD88

# Setup repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install docker
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Verify docker installation with
# sudo docker run hello-world