cd ${HOME}

# Prerequisites
platform=$(uname)
if [ "$platform" == 'Linux' ]; then
  sudo apt-get install -y --no-install-recommends git vim-nox fonts-powerline
  sudo apt-get install -y --no-install-recommends exa
elif [ "$platform" == 'Darwin' ]; then
  brew install git macvim homebrew/cask-fonts/font-powerline-symbols
  brew install exa the_silver_searcher fzf
  brew tap jakehilborn/jakehilborn && brew install displayplacer
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

dotfiles=${HOME}/.dotfiles

git clone https://github.com/PabloScolpino/dotfiles.git ${dotfiles}

shell=`getent passwd | awk -F: -v user="\`whoami\`" '$1 == user {print $NF}'`
if echo $shell | grep -q "bash"; then
  echo "Configuring bash"
  ${dotfiles}/setup/bash_setup.sh
else
  if echo $shell | grep -q "zsh"; then
    echo "Configuring zsh"
    ${dotfiles}/setup/zsh_setup.zsh
  fi
fi

ln -s ${dotfiles}/.editrc  $HOME/.editrc
ln -s ${dotfiles}/.inputrc $HOME/.inputrc
ln -s ${dotfiles}/.vimrc   $HOME/.vimrc
ln -s ${dotfiles}/.gemrc   $HOME/.gemrc
