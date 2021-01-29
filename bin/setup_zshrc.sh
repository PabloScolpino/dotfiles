# https://github.com/sorin-ionescu/prezto

# TODO: check if running zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

echo ". \$HOME/.dotfiles/.config/source_this.zshenv" >> $HOME/.zshenv
echo ". \$HOME/.dotfiles/.config/source_this.zshrc" >> $HOME/.zshrc
