#!/usr/bin/env bash

# If you need to test from the repo, as IRL :-)
# git clone https://github.com/PabloScolpino/dotfiles.git ~/.dotfiles

cd ~/.dotfiles/
ansible-playbook setup/gitpod.yml -i setup/inventory
