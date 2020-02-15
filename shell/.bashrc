# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.local/venv/global/bin:$PATH
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

#http://d.hatena.ne.jp/ksmemo/20110214/p1
stty -ixon -ixoff

export PS1='\033[01;32m\][\u:$PWD]\$\[\033[00m\] '
