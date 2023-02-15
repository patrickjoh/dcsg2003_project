#!/bin/bash
sudo su
apt-get update
apt-get -y install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
# Build images and create instances
cd /home/ubuntu/
git clone https://github.com/patrickjoh/dcsg2003_project.git
git clone https://github.com/hioa-cs/bookface.git
cd bookface
cp -rf code/ ../dcsg2003_project/static_webserver/code
mv /home/ubuntu/Dockerfile /home/ubuntu/static_webserver/Dockerfile
cd ../dcsg2003_project/static_webserver
git 
dockerd &
wait
docker build -t bfsite:v1 .
wait
docker run -d -P -p 32775:80 --name  web1 --restart unless-stopped bfsite:v1
wait
docker run -d -P -p 32776:80 --name  web2 --restart unless-stopped bfsite:v1
