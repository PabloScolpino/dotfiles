CONFIG=$HOME/.config

. $CONFIG/prompt.sh
. $CONFIG/path.sh
. $CONFIG/ld_library_path.sh
. $CONFIG/alias.sh
. $CONFIG/env.sh
. $CONFIG/git.sh
. $CONFIG/autocomplete.sh
. $CONFIG/tmuxinator.bash
[ -f $CONFIG/extras.sh ] && source $CONFIG/extras.sh
