#!/usr/bin/env bash

echo "This is intended to be run by gitpod preconfigurator"
sudo apt-get install -y --no-install-recommends python3-setuptools python3-pip python3-wheel
sudo pip3 install ansible
ansible-playbook setup/gitpod.yml -i setup/inventory
