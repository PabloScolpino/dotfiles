set -o vi
set editing-mode vi

if [ -n "$(command -v bindkey)" ]; then
  bindkey -M vicmd v edit-command-line
fi

export EDITOR=vim
export VISUAL=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

platform=$(uname)
if [ "$platform" = 'Darwin' ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
