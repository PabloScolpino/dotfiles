#!/usr/bin/env bash

dotfiles="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd ${dotfiles}

git submodule init && git submodule update

echo ". ${dotfiles}/config/source_this.bash" >> $HOME/.bashrc
