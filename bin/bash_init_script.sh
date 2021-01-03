echo ". \$HOME/.config/source_this.bash" >> $HOME/.bashrc
cd
git submodule init && git submodule update

. $HOME/.bashrc
