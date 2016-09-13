# Pablo's Terminal configuration
This is my own terminal profile configuration, here to make it easier to reinstall my pcs :)

# Setup

```Bash
cd 

git init
git remote add origin https://github.com/PabloScolpino/terminalrc.git
git fetch
git checkout -t origin/master

echo ". \$HOME/.config/source_this.sh" >> $HOME/.bashrc

. ./.bashrc

git submodule init && git submodule update

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```



# Refernces
* [how to clone a repo into an existing directory](http://stackoverflow.com/questions/2411031/how-do-i-clone-into-a-non-empty-directory)
* [VimPlug](https://github.com/junegunn/vim-plug)
