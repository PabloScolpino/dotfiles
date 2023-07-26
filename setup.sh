#!/usr/bin/env bash

echo "This is intended to be run by gitpod preconfigurator"

sudo apt-get install -y --no-install-recommends python3-setuptools python3-pip python3-wheel
sudo pip3 install ansible

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ansible-playbook $current_dir/setup/gitpod.yml -i $current_dir/setup/inventory
