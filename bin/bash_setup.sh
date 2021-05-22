cd $HOME/.dotfiles

git submodule init && git submodule update

echo ". \$HOME/.dotfiles/config/source_this.bash" >> $HOME/.bashrc
. $HOME/.bashrc
