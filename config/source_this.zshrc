CONFIG="${0:A:h}"

source $CONFIG/env.sh
source $CONFIG/path.sh # zprezto overrides the order of path set up
source $CONFIG/alias.sh
source $CONFIG/git.sh

[ -f $CONFIG/extras.sh ] && source $CONFIG/extras.sh

source $CONFIG/ruby.sh
source $CONFIG/node.sh

if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

zstyle ':prezto:module:editor' key-bindings 'vi'
prompt paradox
zstyle ':prezto:module:ssh:load' identities 'id_rsa'
