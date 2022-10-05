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
docker-compose up -d && \
echo "Do you want to generate the debian/ubuntu agent setup file? (y/n)"
read answer
if [ $answer == "y" ]
then
ip_a=$(ip a show eth0 | grep brd  | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}')
sed "s/<replace>/$ip_a/g" ./templates/debian_template.sh > ./debian_agent.sh
chmod u+x ./debian_agent.sh
else
echo "no"
fi
