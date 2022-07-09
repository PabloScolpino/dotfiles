set -o vi
set editing-mode vi

if [ -n "$(command -v bindkey)" ]; then
  bindkey -M vicmd v edit-command-line
  bindkey -v
  bindkey '^R' history-incremental-search-backward
fi

export EDITOR=vim
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export VISUAL=vim

platform=$(uname)
if [ "$platform" = 'Darwin' ]; then
  if [ -f '/opt/local/bin/brew' ]; then
    eval "$(/opt/local/bin/brew shellenv)"
  elif [ -f '/opt/homebrew/bin/brew' ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

export GPG_TTY=$(tty)
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
