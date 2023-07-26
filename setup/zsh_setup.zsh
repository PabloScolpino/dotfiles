#!/usr/bin/env zsh

# https://github.com/sorin-ionescu/prezto

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${HOME}/.${rcfile:t}"
done

echo ". \$HOME/.dotfiles/config/source_this.zshenv" >> ${HOME}/.zshenv
echo ". \$HOME/.dotfiles/config/source_this.zshrc" >> ${HOME}/.zshrc
