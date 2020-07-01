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

#http://d.hatena.ne.jp/ksmemo/20110214/p1
stty -ixon -ixoff

export PS1='\[\e[01;32m\][\u:$PWD]\$\[\e[00m\] '
export TERM=xterm-256color

# 空白から始まるコマンドはhistoryに残さない/連続は1回だけ
export HISTCONTROL=ignoreboth
