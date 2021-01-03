echo ". \$HOME/.config/source_this.sh" >> $HOME/.bashrc

git submodule init && git submodule update

. ./.bashrc
