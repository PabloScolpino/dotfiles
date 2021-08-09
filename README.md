# Pablo's Terminal configuration
This is my own terminal profile configuration, here to make it easier to have a sane terminal wherever I go

# Setup

## Using [Mac Dev Playbook](https://github.com/geerlingguy/mac-dev-playbook)

1. follow the instructions of **mac dev playbook** up to (and before) executing the install playbook
1. copy the `setup/mac_dev_playbook_config.yml` into the clone repository above
1. continue with **mac dev playbook**'s instructions

## Using ansible

    # Clone this repo
    git clone https://github.com/PabloScolpino/dotfiles.git ~/temporary_dotfile_folder
    cd ~/temporary_dotfile_folder/setup
    ansible-galaxy install -r requirements.yml
    ansible-playbook main.yml

## Using shellscript

    platform=$(uname)
    if [ "$platform" == 'Linux' ]; then
      sudo apt-get update
      sudo apt-get install -y --no-install-recommends curl
    elif [ "$platform" == 'Darwin' ]; then
      brew update
      brew install curl
    fi

    curl https://raw.githubusercontent.com/PabloScolpino/dotfiles/master/setup/terminal_setup.sh | bash

# Binding Cheatsheet

## Interface

|Key||Effect|
|-|-|-|
|`<Backspace><Backspace>`||Delete trailing whitespaces across the file|
|`<F9>`||Execute current file|
|`<Leader>c`|`<Leader>C`|remove line number and git status column from current buffer|
|`<Leader>f`||Fuzzy **file** search and open in buffer|
|`<Leader>b`||Fuzzy **buffer** search and jump to buffer|

## Git

|Key||Effect|
|-|-|-|
|`ggh`|`ggH`|Hightlight unstaged changes|
|`ggf`||Toggle folding unchanged blocks|
|`<Leader>gd`||Git diff vertical split|
|`gdh`||In `:Git mergetool`, fetch changes from the left pannel|
|`gdl`||In `:Git mergetool`, fetch changes from the right pannel|
|`<Leader>hs`||gitgutter stage chunk|
|`<Leader>hu`||gitgutter undo chunk|

# Inspiration & guide
* [Jeff Geerling's awesome mac install automation](https://github.com/geerlingguy/mac-dev-playbook)

# References
* [how to clone a repo into an existing directory](http://stackoverflow.com/questions/2411031/how-do-i-clone-into-a-non-empty-directory)
* [VimPlug](https://github.com/junegunn/vim-plug)
* [How to install several kubernetes-cli versions with brew] (https://gist.github.com/rdump/b79a63084b47f99a41514432132bd408)
