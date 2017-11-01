#!/usr/bin/env sh

SENSIBLE_BASH="$HOME/src/github.com/mrzool/bash-sensible/sensible.bash"
[[ -s $SENSIBLE_BASH ]] && source $SENSIBLE_BASH

#export GPG_TTY=$(tty)
#/usr/bin/gpg-connect-agent updatestartuptty /bye &>/dev/null

# Set my editor and git editor
export EDITOR="$(which nvim)"
export VISUAL_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

# Don't check mail when opening terminal.
unset MAILCHECK

# Golang
export GOPATH=$HOME
export GOBIN=$HOME/bin

export PATH="$GOBIN:$PATH"

# History
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

export MYSQL_HISTFILE=/dev/null
export LESSHISTFILE=/dev/null
export BZR_LOG=/dev/null

export BROWSER=chromium
export XDG_CONFIG_HOME="$HOME/.config"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WWW_HOME="$HOME/.cache"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

man() {
	export LESS_TERMCAP_mb=$'\e'"[1;31m"
	export LESS_TERMCAP_md=$'\e'"[1;31m"
	export LESS_TERMCAP_me=$'\e'"[0m"
	export LESS_TERMCAP_se=$'\e'"[0m"
	export LESS_TERMCAP_so=$'\e'"[1;44;33m"
	export LESS_TERMCAP_ue=$'\e'"[0m"
	export LESS_TERMCAP_us=$'\e'"[1;32m"
	command man $@
}

# ls shorteners
alias ls='ls --color -h --group-directories-first --quoting-style=literal'
alias l='ls'
alias la='ls -A'
alias ll='ls -lh'
alias sl='ls'

# easy navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../..'

# shorteners
alias i='weechat'
alias vim="nvim -i ~/.cache/nviminfo"
alias vimdiff="vim -d"

# git
alias gs='git status -s'
alias gitl='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gitpp='git pull ; git push'

# Work
alias xm-ssh='ssh -F $HOME/.ssh/xm/config'
alias xms-ssh='scp -F $HOME/.ssh/xm/config'

# misc
alias rm='rm -f'
alias less='less -F -g -i -M -R -S -w -X -z -4'

alias packer='packer --noconfirm --noedit --auronly'
alias search='\packer -Ss'
alias update='sudo pacman -Syu --noconfirm; packer -Syu'

alias mpv='mpv --msg-level=cplayer=fatal:ffmpeg=fatal --loop=inf --cache=no'
alias checkip='curl -s http://checkip.amazonaws.com/'
alias digs='dig +noall +answer'
alias su-code='sudo -E code --user-data-dir=/home/kyle/.config/Code/'
alias scrot="scrot '%Y-%m-%d_\$p_\$wx\$h.png'"

function prompt_command() {
	PS1=" ${normal}\W$(rt=$?; [[ $rt = 0 ]] && echo ${black} || echo ${red}) »${normal} "
}

PROMPT_COMMAND=prompt_command;
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
