CONFIG=$HOME/.dotfiles/.config

. $CONFIG/path.sh
. $CONFIG/ld_library_path.sh
. $CONFIG/env.sh
[ -f $CONFIG/extras.sh ] && source $CONFIG/extras.sh
