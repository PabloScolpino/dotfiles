# Pablo's Terminal configuration
This is my own terminal profile configuration, here to make it easier to have a sane terminal wherever I go

# Requirements
## Linux
    sudp apt update && sudo apt upgrade
    sudo apt install --no-install-recommends git curl vim-nox

    # Optional Packages
    sudo apt install --no-install-recommends exa

## Macos
    brew update && brew upgrade
    brew install git curl macvim

    # Optional Packages
    brew install exa the_silver_searcher fzf
    brew tap jakehilborn/jakehilborn && brew install displayplacer

# Setup

    curl https://raw.githubusercontent.com/PabloScolpino/terminalrc/master/bin/setup_terminalrc.sh | bash

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

# References
* [how to clone a repo into an existing directory](http://stackoverflow.com/questions/2411031/how-do-i-clone-into-a-non-empty-directory)
* [VimPlug](https://github.com/junegunn/vim-plug)
* [How to install several kubernetes-cli versions with brew] (https://gist.github.com/rdump/b79a63084b47f99a41514432132bd408)
