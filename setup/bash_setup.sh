#!/usr/bin/env sh

cd $HOME/.dotfiles

git submodule init && git submodule update

echo ". \$HOME/.dotfiles/config/source_this.bash" >> $HOME/.bashrc
