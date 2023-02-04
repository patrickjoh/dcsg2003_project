#!/bin/bash
nano /etc/docker/daemon.json
{ "insecure-registries" : ["192.168.128.23:5000"] }
service docker restart
mkdir static_webserver
git clone https://github.com/hioa-cs/bookface.git
cd bookface
cp code/ ../static_webserver/code
cp config.php ../static_webserver/config.php
cd ../static_webserver
dockerd &
docker build -t bfsite:v1 .
docker run -d -P -p 32775:80 --name  web1 --restart unless-stopped bfsite:v1
docker run -d -P -p 32775:80 --name  web1 --restart unless-stopped bfsite:v1