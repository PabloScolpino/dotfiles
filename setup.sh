#!/usr/bin/env bash

echo "This is intended to be run by gitpod preconfigurator"
sudo apt-get install -y --no-install-recommends ansible
cd ~/.dotfiles/setup
ansible-playbook gitpod.yml -i inventory
