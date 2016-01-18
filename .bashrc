#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT=$HOME/.config/bash-it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='kylescottmcgill'

# Set my editor and git editor
export EDITOR="$(which nvim)"
export GIT_EDITOR=$EDITOR
export NVIM_TUI_ENABLE_TRUE_COLOR='1'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='weechat'

# Local Path
export LOCALPATH=~/.local/bin

# Golang
export GOPATH=$HOME/Projects
export GOBIN=$HOME/Projects/bin
export PHPPATH=$HOME/.composer/vendor/bin

# Load Bash It
source $BASH_IT/bash_it.sh

eval $(dircolors -b $HOME/.config/LS_COLORS | sed -e s#^LS_COLORS#LS_COLORS_CUSTOM#g | sed -e s#^export\ LS_COLORS##g)
eval $(dircolors -b $HOME/.config/dircolors/LS_COLORS | sed -e s#^LS_COLORS#LS_COLORS_BASE#g | sed -e s#^export\ LS_COLORS##g)
export LS_COLORS="$LS_COLORS_BASE$LS_COLORS_CUSTOM"

hash pkgfile 2>/dev/null && source /usr/share/doc/pkgfile/command-not-found.bash

# Custom Shiz
export PATH="$LOCALPATH:$GOBIN:$PHPPATH:$PATH"

export MYSQL_HISTFILE=/dev/null
export LESSHISTFILE=/dev/null
export BZR_LOG=/dev/null
export BROWSER=firefox-developer
export XDG_CONFIG_HOME="$HOME/.config"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WWW_HOME="$HOME/.cache"

export COLORSCHEME="minimal"

alias ls='ls --color -h --group-directories-first'
alias sl='ls'
alias less='less -F -g -i -M -R -S -w -X -z -4'
alias packer='packer --noconfirm --noedit --auronly'
alias search='\packer -Ss'
alias ll='ls -lh'
alias rm='rm -f'
alias tmux='tmux -2 -f $HOME/.config/tmux/tmux.conf'
alias v=vim
alias vim="nvim -i ~/.cache/nviminfo"

alias git=hub

alias gitpp='git pull ; git push'
alias gits='git status -s'
alias gs='git status -s'
alias glog='git log --graph --decorate --pretty=oneline --abbrev-commit'

alias mysql='mysql --auto-rehash'

stty werase undef
bind '\C-w:unix-filename-rubout'
bind Space:magic-space
bind 'set completion-ignore-case on'

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

