CONFIG=$HOME/.config

. $CONFIG/prompt.sh
. $CONFIG/path.sh
. $CONFIG/ld_library_path.sh
. $CONFIG/alias.sh
. $CONFIG/env.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
