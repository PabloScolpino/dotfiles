#!/usr/bin/env bash

set -ex

echo "This is intended to be run by gitpod preconfigurator"

pyenv global 3.12.4
pip install ansible

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ansible-playbook $current_dir/setup/gitpod.yml -i $current_dir/setup/inventory & disown
