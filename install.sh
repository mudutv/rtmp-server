#!/usr/bin/env bash

echo "================================================="
echo "rtmp server installtion script"
echo "================================================="

read -p "Press Enter to continue,press Ctrl+C to cancel"

# quit if user isn't a root user
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script!"
    exit 1
fi

apt-get -y update
curl -fsSL https://get.docker.com/| sh
echo "DOCKER_OPTS=\"\$DOCKER_OPTS --registry-mirror=https://99e392na.mirror.aliyuncs.com\"" | sudo tee -a /etc/default/docker
service docker restart
mkdir data && mkdir data/record && mkdir data/logs && chmod -R 777 data
docker run -idt --restart=always --name rtmpserver -p 80:80 -p 1935:1935 -v ~/data:/data registry.aliyuncs.com/mudu/nginx-rtmp
