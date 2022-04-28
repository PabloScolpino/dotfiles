if [ -n ${HOMEBREW_PREFIX} ]
then
  export PATH="$HOMEBREW_PREFIX/bin:$PATH"
fi

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
