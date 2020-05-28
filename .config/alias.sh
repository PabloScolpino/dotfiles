if [ -n `which exa` ]
  alias l="ls -l -G"
  alias a="clear;ls -l -G"
then
  alias ls="exa -l"
  alias l="exa -l"
  alias lt="exa -l -T --level=3"
  alias a="clear;exa -l"
fi

alias ap='ansible-playbook'

alias vi='vim'

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

alias k='kubectl'
