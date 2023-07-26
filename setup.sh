#!/usr/bin/env bash

echo "This is intended to be run by gitpod preconfigurator"
sudo apt install ansible
cd ~/.dotfiles/setup
ansible-playbook gitpod.yml -i inventory
