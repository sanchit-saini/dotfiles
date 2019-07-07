#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$PATH:~/bin
VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR

alias ls='ls --color=auto --indicator-style=classify'
alias ll='ls -lh'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -FC'
alias uptime='uptime -p'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# append to the history file, don't overwrite it
shopt -s histappend

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd
PS1='[\u@\h \W]\$ '