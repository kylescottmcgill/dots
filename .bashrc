#!/usr/bin/env bash

# Load sensible.bash
source $HOME/Projects/src/github.com/mrzool/bash-sensible/sensible.bash
source $HOME/.bash/colors.bash
source $HOME/.bash/theme.bash

# Set my editor and git editor
export EDITOR="$(which nvim)"
export GIT_EDITOR=$EDITOR

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='weechat'

# Golang
export GOPATH=$HOME/Projects
export GOBIN=$HOME/Projects/bin

# Custom Shiz
export PATH="$GOBIN:$PATH"

eval $(dircolors -b $HOME/.config/LS_COLORS | sed -e s#^LS_COLORS#LS_COLORS_CUSTOM#g | sed -e s#^export\ LS_COLORS##g)
eval $(dircolors -b $HOME/.config/dircolors/LS_COLORS | sed -e s#^LS_COLORS#LS_COLORS_BASE#g | sed -e s#^export\ LS_COLORS##g)
export LS_COLORS="$LS_COLORS_BASE$LS_COLORS_CUSTOM"

hash pkgfile 2>/dev/null && source /usr/share/doc/pkgfile/command-not-found.bash

export MYSQL_HISTFILE=/dev/null
export LESSHISTFILE=/dev/null
export BZR_LOG=/dev/null
export BROWSER=chromium
export XDG_CONFIG_HOME="$HOME/.config"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WWW_HOME="$HOME/.cache"

alias ls='ls --color -h --group-directories-first'
alias sl='ls'
alias less='less -F -g -i -M -R -S -w -X -z -4'
alias packer='packer --noconfirm --noedit --auronly'
alias search='\packer -Ss'
alias ll='ls -lh'
alias rm='rm -f'
alias v=vim
alias vim="nvim -i ~/.cache/nviminfo"
alias git=hub
alias gitpp='git pull ; git push'
alias gits='git status -s'
alias gs='git status -s'
alias glog='git log --graph --decorate --pretty=oneline --abbrev-commit'

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
}
bind Space:magic-space
