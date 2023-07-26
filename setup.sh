#!/usr/bin/env bash

echo "This is intended to be run by gitpod preconfigurator"
sudo apt-get install -y --no-install-recommends ansible
ansible-playbook setup/gitpod.yml -i inventory
