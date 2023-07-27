ssh_agent_dir="$HOME/.ssh/agent-environment"

if [ ! -f $HOME/.ssh ];then
  mkdir $HOME/.ssh
  chmod 700 $HOME/.ssh
fi

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${ssh_agent_dir}"
    echo succeeded
    chmod 600 "${ssh_agent_dir}"
    . "${ssh_agent_dir}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${ssh_agent_dir}" ]; then
    . "${ssh_agent_dir}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# usr/bin/ssh-add;
