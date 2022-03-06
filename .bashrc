PATH=$PATH:~/bin
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias ls='ls --color=auto --indicator-style=classify'
alias ll='ls -lh'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -FC'
alias uptime='uptime -p'

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

GREEN="\[$(tput setaf 2)\]"
CYAN="\[$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"
GIT_BRANCH="$(echo '$(git_branch)')"

PS1="${CYAN} \w${GREEN}${GIT_BRANCH}\n └─ \$ ▶ ${RESET}"

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
