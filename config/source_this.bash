CONFIG=$HOME/.dotfiles/config

. $CONFIG/prompt.sh
. $CONFIG/path.sh
. $CONFIG/ld_library_path.sh
. $CONFIG/alias.sh
. $CONFIG/env.sh
. $CONFIG/git.sh
. $CONFIG/ruby.sh
. $CONFIG/yaml.sh
[ -f $CONFIG/extras.sh ] && source $CONFIG/extras.sh

$HOME/.dotfiles/bin/set_ssh_agent.sh
