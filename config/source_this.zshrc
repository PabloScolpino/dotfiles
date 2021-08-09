CONFIG=$HOME/.dotfiles/config

. $CONFIG/alias.sh
. $CONFIG/git.sh
. $CONFIG/env.sh
[ -f $CONFIG/extras.sh ] && source $CONFIG/extras.sh

. $CONFIG/ruby.sh

$HOME/.dotfiles/bin/set_ssh_agent.sh

zstyle ':prezto:module:editor' key-bindings 'vi'
prompt paradox
zstyle ':prezto:module:ssh:load' identities 'id_rsa'
