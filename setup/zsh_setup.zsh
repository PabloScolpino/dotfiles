#!/usr/bin/env zsh

# https://github.com/sorin-ionescu/prezto

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${HOME}/.${rcfile:t}"
done

DOTFILES_ROOT="${0:A:h:h}"
echo ". \${DOTFILES_ROOT}/config/source_this.zshenv" >> ${HOME}/.zshenv
echo ". \${DOTFILES_ROOT}/config/source_this.zshrc" >> ${HOME}/.zshrc
