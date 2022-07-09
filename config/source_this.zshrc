CONFIG=$HOME/.dotfiles/config

source $CONFIG/env.sh
source $CONFIG/path.sh # zprezto was overriding the order of path set up
source $CONFIG/alias.sh
source $CONFIG/git.sh

[ -f $CONFIG/extras.sh ] && source $CONFIG/extras.sh

source $CONFIG/ruby.sh

$HOME/.dotfiles/bin/set_ssh_agent.sh

zstyle ':prezto:module:editor' key-bindings 'vi'
prompt paradox
zstyle ':prezto:module:ssh:load' identities 'id_rsa'
