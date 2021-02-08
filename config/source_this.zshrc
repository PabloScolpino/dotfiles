CONFIG=$HOME/.dotfiles/config

. $CONFIG/alias.sh
. $CONFIG/git.sh
. $CONFIG/env.sh
[ -f $CONFIG/extras.sh ] && source $CONFIG/extras.sh

. $CONFIG/ruby.sh

$HOME/.dotfiles/bin/set_ssh_agent.sh
