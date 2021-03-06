# ~/.bashrc: executed by bash(1) for interactive shells.
# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
export BOOSTROOT=/usr/include/boost/
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#

## Source all Scripts in ~/.bash_resources:
if [ -d  "${HOME}/.bash_resources" ]; then
    for f in ${HOME}/.bash_resources/*; do
        source $f
    done
fi

# PS1 Anzeige von Git status
# git-promt.sh sollte schon "gesourced" sein von oben
if [ -f "${HOME}/.bash_resources/git-prompt.sh" ]; then
    # Uncomment the following two lines if you have a
    # fast HDD or only small git repos
	#GIT_PS1_SHOWDIRTYSTATE=true
	#GIT_PS1_SHOWUNTRACKEDFILES=true
	PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]$(__git_ps1 " (%s)") \n\$ '
fi

if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    export WORKON_HOME=${HOME}/.virtualenvs
    export PROJECT_HOME=$HOME/projects
    source /usr/local/bin/virtualenvwrapper.sh
fi
