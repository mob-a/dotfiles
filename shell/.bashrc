# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ls='ls -F --color=tty'
alias lh='ls -F --color=tty -lh'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias h='history'
alias em='emacs'
alias q='exit'

# https://linuxfan.info/disable-ctrl-s
if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi

export PS1='\[\e[01;32m\][\u:$PWD]\$\[\e[00m\] '
export TERM=xterm-256color

# https://unix.stackexchange.com/questions/391201/user-hostname-shown-two-times-in-terminal-after-ssh
unset PROMPT_COMMAND

# 空白から始まるコマンドはhistoryに残さない/連続は1回だけ
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=10000

export PIPENV_VENV_IN_PROJECT=true

# To enable agent forwarding when screen is reconnected.
# http://mokokko.hatenablog.com/entry/2013/03/14/133850
AUTH_SOCK="$HOME/.ssh/.ssh-auth-sock"
if [ -S "$AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK=$AUTH_SOCK
elif [ ! -S "$SSH_AUTH_SOCK" ]; then
    export SSH_AUTH_SOCK=$AUTH_SOCK
elif [ ! -L "$SSH_AUTH_SOCK" ]; then
    ln -snf "$SSH_AUTH_SOCK" $AUTH_SOCK && export SSH_AUTH_SOCK=$AUTH_SOCK
fi

# export http_proxy=http://localhost:3128/
# export https_proxy=http://localhost:3128/
# export no_proxy=localhost,127.0.0.1
# export proxy_host=`echo $http_proxy|perl -ple 's!^.*//([^:]*):(\d+)[^\d]*$!$1!'`
# export proxy_port=`echo $http_proxy|perl -ple 's!^.*//([^:]*):(\d+)[^\d]*$!$2!'`
