#!/usr/bin/env bash

dotfiles=${HOME}/.dotfiles

cd ${dotfiles}

git submodule init && git submodule update

echo ". ${dotfiles}/config/source_this.bash" >> $HOME/.bashrc
