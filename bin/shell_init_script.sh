cd
git init
git remote add origin https://github.com/PabloScolpino/terminalrc.git
git fetch
git checkout -t origin/master

platform=$(uname)
if [ "$platform" == 'Linux' ]; then
  sudo apt-get install fonts-powerline
elif [ "$platform" == 'Darwin' ]; then
  brew install homebrew/cask-fonts/font-powerline-symbols
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# TODO: decide if zsh or bash and continue accordingly
