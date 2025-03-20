#!/usr/bin/env bash

set -ex

echo "This is intended to be run by gitpod preconfigurator"

echo "this is being run by: $(whoami)"

################################################################################
# Ensure .bashrc is run on every new term
touch ~/.bash_profile
sudo chown gitpod ~/.bash_profile
echo -e "\nif [ -f ~/.bashrc ]; then\n    source ~/.bashrc\nfi" >> ~/.bash_profile

################################################################################
# Add itallics support to the terminal
cat << EOF > xterm-256color-italic.terminfo
xterm-256color-italic|xterm with 256 colors and italic,
    sitm=\E[3m, ritm=\E[23m, use=xterm-256color,
EOF

tic xterm-256color-italic.terminfo

echo 'export TERM=xterm-256color-italic' >> ~/.bashrc

################################################################################
# Configure pyenv and global python version
unset LANG
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

pyenv global $(pyenv versions --bare | grep -v "/" | grep -E "^[0-9]+\.[0-9]+\.[0-9]+$" | sort -V | tail -1)
pip install ansible

cd setup
make install_in_cde
