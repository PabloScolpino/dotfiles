#!/usr/bin/env bash

platform=$(uname)
if [ "$platform" == 'Linux' ]; then
  sudo apt-get update
  sudo apt-get install -y --no-install-recommends curl
elif [ "$platform" == 'Darwin' ]; then
  brew update
  brew install curl
fi

curl https://raw.githubusercontent.com/PabloScolpino/dotfiles/master/setup/terminal_setup.sh | bash
