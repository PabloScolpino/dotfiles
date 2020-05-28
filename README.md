# Pablo's Terminal configuration
This is my own terminal profile configuration, here to make it easier to have a sane terminal wherever I go

# Prerequisites

    sudo apt install --no-install-recommends git curl vim-nox

    brew install git curl vim-nox

### Optional

    sudo apt install --no-install-recommends exa

    brew install exa

# Setup

    curl https://raw.githubusercontent.com/PabloScolpino/terminalrc/master/bin/shell_init_script.sh | bash


# Binding Cheatsheet

## Interface

|Key||Effect|
|-|-|-|
|`<Backspace><Backspace>`||Delete trailing whitespaces across the file|
|`<F9>`||Execute current file|
|`<Leader>c`|`<Leader>C`|remove line number and git status column from current buffer|
|`<Leader>f`||Fuzzy **file** search and open in buffer|
|`<Leader>b`||Fuzzy **buffer** search and jump to buffer|

# References
* [how to clone a repo into an existing directory](http://stackoverflow.com/questions/2411031/how-do-i-clone-into-a-non-empty-directory)
* [VimPlug](https://github.com/junegunn/vim-plug)
