if [ -n "$(command -v exa)" ]
then
  alias ls="exa -l"
  alias l="exa -l"
  alias lt="exa -l -T --level=3"
  alias a="clear;exa -l"
else
  alias l="ls -l -G"
  alias a="clear;ls -l -G"
fi

alias ap='ansible-playbook'

if [ -n "$(command -v vim)" ]
then
  alias vi='vim'
fi

alias mutt='cd ~/attachments && neomutt'

alias screen='screen -D -RR'
alias mux='tmuxinator'

alias tnew='tmate -S /tmp/tmate.sock new-session'
alias trw='tmate -S /tmp/tmate.sock display -p "#{tmate_ssh}"'
alias tro='tmate -S /tmp/tmate.sock display -p "#{tmate_ssh_ro}"'

alias rerun='rerun --no-notify'
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dce='docker-compose exec'
alias dcr='docker-compose run --rm'
alias dcu='docker-compose up --build'

alias docker_clean_logs='sudo find /var/lib/docker/containers -name "*.log"  -exec truncate -s 0 {} \;'

alias k='kubectl'

platform=$(uname)
if [ "$platform" = 'Darwin' ]; then
  alias lsports='sudo lsof -iTCP -sTCP:LISTEN -n -P'
fi
