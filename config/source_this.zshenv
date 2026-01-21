CONFIG="${0:A:h}"

. $CONFIG/env.sh
. $CONFIG/path.sh
. $CONFIG/ld_library_path.sh

[ -f $CONFIG/extras.sh ] && source $CONFIG/extras.sh
