DOTFILES_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/.."
export DOTFILES_PATH

config_path=${DOTFILES_PATH}/config

. $config_path/prompt.sh
. $config_path/path.sh
. $config_path/ld_library_path.sh
. $config_path/alias.sh
. $config_path/env.sh
. $config_path/git.sh
. $config_path/ruby.sh
. $config_path/node.sh
[ -f $config_path/extras.sh ] && source $config_path/extras.sh

$DOTFILES_PATH/bin/set_ssh_agent.sh
