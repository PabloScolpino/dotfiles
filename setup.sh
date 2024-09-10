#!/usr/bin/env bash

set -ex

echo "This is intended to be run by gitpod preconfigurator"

echo "this is being run by: $(whoami)"

sudo chown gitpod ~/.bash_profile
echo -e "\nif [ -f ~/.bashrc ]; then\n    source ~/.bashrc\nfi" >> ~/.bash_profile

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv global 3.12.4
pip install ansible

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ansible-playbook $current_dir/setup/gitpod.yml -i $current_dir/setup/inventory & disown
