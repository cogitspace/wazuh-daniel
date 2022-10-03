#!/bin/bash

apt update && apt upgrade -y && \
apt install curl -y && \
apt install git -y && \
apt install ssh -y && \
apt install docker.io -y && \
apt install docker-compose -y && \
systemctl start docker && \
systemctl enable docker && \
sysctl -w vm.max_map_count=262144 && \
git clone https://github.com/cogitspace/wazuh-docker.git -b v4.3.8 --depth=1 && \
cd ./wazuh-docker/single-node/ && \
docker-compose -f generate-indexer-certs.yml run --rm generator && \
docker-compose up -d
