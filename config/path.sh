if [ -n "${HOMEBREW_PREFIX}" ] && [ -d "${HOMEBREW_PREFIX}/bin" ]; then
    export PATH="${HOMEBREW_PREFIX}/bin:$PATH"
fi

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.dotfiles/bin" ]; then
    export PATH="$HOME/.dotfiles/bin:$PATH"
fi

if [ -d "$HOME/.asdf/bin" ]; then
    export PATH="$HOME/.asdf/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "/opt/homebrew/opt/libpq/bin" ]; then
    export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
fi

if [ -d "$HOME/.krew/bin" ]; then
    export PATH="$HOME/.krew/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi
