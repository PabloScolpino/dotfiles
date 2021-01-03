CONFIG=$HOME/.config

. $CONFIG/alias.sh
. $CONFIG/git.sh
. $CONFIG/env.sh
[ -f $CONFIG/extras.sh ] && source $CONFIG/extras.sh

eval "$(rbenv init -)"
