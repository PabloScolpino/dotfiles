[![Ansible](https://github.com/PabloScolpino/dotfiles/actions/workflows/ansible.yml/badge.svg)](https://github.com/PabloScolpino/dotfiles/actions/workflows/ansible.yml)
[![Bash](https://github.com/PabloScolpino/dotfiles/actions/workflows/bash.yml/badge.svg)](https://github.com/PabloScolpino/dotfiles/actions/workflows/bash.yml)
[![Zsh](https://github.com/PabloScolpino/dotfiles/actions/workflows/zsh.yml/badge.svg)](https://github.com/PabloScolpino/dotfiles/actions/workflows/zsh.yml)

# Pablo's Terminal configuration
This is my own terminal profile configuration, here to make it easier to have a sane terminal wherever I go

# [Setup](setup/README.md)

# [Testing & development](test/README.md)

# Binding Cheatsheet

## i3 + Alacritty

|Key|Effect|
|-|-|
|`<$mod><Y>`|Toggle active pane full screen mode|

## VIM

### General
|Key||Effect|
|-|-|-|
|`<F9>`||Execute current file|
|`<Backspace><Backspace>`||Delete trailing whitespaces across the file|
|`<Leader>c`|`<Leader>C`|remove line number and git status column from current buffer|
|`<Leader>f`||Fuzzy **file** search and open in buffer|
|`<Leader>b`||Fuzzy **buffer** search and jump to buffer|

### Git

|Key||Effect|
|-|-|-|
|`ggh`|`ggH`|Hightlight unstaged changes|
|`ggf`||Toggle folding unchanged blocks|
|`<Leader>gd`||Git diff vertical split|
|`gdh`||In `:Git mergetool`, fetch changes from the left pannel|
|`gdl`||In `:Git mergetool`, fetch changes from the right pannel|
|`<Leader>hs`||gitgutter stage chunk|
|`<Leader>hu`||gitgutter undo chunk|

### Notes
|Key||Effect|
|-|-|-|
|`:Note <name>`||Start a note named `<name>`|
|`gf`||Inside a note, Jump to linked note under cursor|

# Inspiration & guide
* [Jeff Geerling's awesome mac install automation](https://github.com/geerlingguy/mac-dev-playbook)

# References
* [how to clone a repo into an existing directory](http://stackoverflow.com/questions/2411031/how-do-i-clone-into-a-non-empty-directory)
* [VimPlug](https://github.com/junegunn/vim-plug)
* [How to install several kubernetes-cli versions with brew] (https://gist.github.com/rdump/b79a63084b47f99a41514432132bd408)
