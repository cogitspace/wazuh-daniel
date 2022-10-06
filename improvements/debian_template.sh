#!/bin/bash -x

apt update && sudo apt upgrade -y && \
apt install curl -y && \
apt install gpg && \
curl -so wazuh-agent-4.3.8.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.3.8-1_amd64.deb && \ 
sudo WAZUH_MANAGER='<replace>' dpkg -i ./wazuh-agent-4.3.8.deb && \
systemctl daemon-reload && \
systemctl enable wazuh-agent && \
systemctl start wazuh-agent
