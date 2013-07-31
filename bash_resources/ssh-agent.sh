#!bash
# Ist schon ein Socket definiert?
if [ "$SSH_AUTH_SOCK" != "" ]; then
    # Ok, Script verlassen
    return
fi

. .agent > /dev/null
ps -p $SSH_AGENT_PID | grep ssh-agent > /dev/null || {
    ssh-agent > .agent
    . .agent > /dev/null
}
# Add Key if necessary
if [ `ssh-add -l | grep id_rsa | wc -l` = 0 ]; then
    ssh-add
fi
