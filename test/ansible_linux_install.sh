#!/usr/bin/env bash

# sudo apt-get -qq update && sudo apt-get -yq install -y --no-install-recommends git

# If you need to test from the repo, as IRL :-)
# git clone https://github.com/PabloScolpino/dotfiles.git ~/temporary_dotfile_folder

cd ~/temporary_dotfile_folder/setup
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml -i inventory
