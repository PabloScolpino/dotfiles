if [ -z `which exa` ]
then
  alias l="ls -l -G"
  alias a="clear;ls -l -G"
else
  alias ls="exa -l"
  alias l="exa -l"
  alias lt="exa -l -T --level=3"
  alias a="clear;exa -l"
fi

alias ap='ansible-playbook'

if [ -n "$(which vim)" ]
then
  alias vi='vim'
fi

alias screen='screen -D -RR'

alias mutt='cd ~/attachments && neomutt'

alias mux='tmuxinator'

alias tnew='tmate -S /tmp/tmate.sock new-session'
alias trw='tmate -S /tmp/tmate.sock display -p "#{tmate_ssh}"'
alias tro='tmate -S /tmp/tmate.sock display -p "#{tmate_ssh_ro}"'

alias rerun='rerun --no-notify'
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dce='docker-compose exec'
alias dcu='docker-compose up --build'

alias docker_clean_logs='sudo find /var/lib/docker/containers -name "*.log"  -exec truncate -s 0 {} \;'

alias k='kubectl'
