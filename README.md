# Pablo's Terminal configuration
This is my own terminal profile configuration, here to make it easier to reinstall my pcs :)

# How to clone a repo into an existing directory

```Bash
git init
git remote add origin https://github.com/PabloScolpino/terminalrc.git
git fetch
git checkout -t origin/master
```
[Source](http://stackoverflow.com/questions/2411031/how-do-i-clone-into-a-non-empty-directory)

# How to install vim Plug
```Bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
[VimPlug](https://github.com/junegunn/vim-plug)
