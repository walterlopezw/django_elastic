#!/bin/bash -xe

RESOURCE_INDEX=$1



ESOURCE_INDEX=$1
apt-get -y update
apt-get -y install curl git htop ca-certificates gnupg  lsb-release 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose

curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose

systemctl enable docker
systemctl restart docker
git clone https://github.com/walterlopezw/django_elastic.git

cd django_elastic/mysite
docker-compose up -d
# apt-get -y update
# apt-get -y install nginx
IP=$(curl -s -H "Metadata-Flavor:Google" http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip)
echo "Welcome to Resource ${RESOURCE_INDEX} - ${HOSTNAME} (${IP})" > /usr/share/nginx/html/index.html
# service nginx start
