#!/bin/sh
set -xe

# docker
sudo curl -sSL https://get.docker.com/ | sh
sudo groupadd docker
sudo usermod -aG docker $USER

# firewall
sudo apt install ufw
sudo ufw allow 22
sudo ufw allow 443
sudo ufw allow 80

# docker
docker network create traefik-network
docker network create homeassistant-network

docker compose up -d
