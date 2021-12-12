#!/bin/bash

set -e

sudo apt install -y unzip

wget https://releases.hashicorp.com/consul/1.10.4/consul_1.10.4_linux_amd64.zip
unzip consul_1.10.4_linux_amd64.zip
sudo mv consul /usr/local/bin

sudo mkdir -p /usr/local/etc/consul
sudo mv /home/ubuntu/server_agent.json /usr/local/etc/consul/
