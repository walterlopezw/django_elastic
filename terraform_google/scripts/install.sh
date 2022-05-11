#!/bin/bash -xe

RESOURCE_INDEX=$1
apt-get -y update
apt-get -y install curl git htop ca-certificates gnupg  lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
docker run -it -d -p 0.0.0.0:80:8000  walterleonardo/quantumtourism:latest

IP=$(curl -s -H "Metadata-Flavor:Google" http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip)
echo "DONE"
echo "Welcome to Resource ${RESOURCE_INDEX} - ${HOSTNAME} (${IP})"
