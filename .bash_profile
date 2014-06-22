#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT=$HOME/.bash

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='kylescottmcgill'

# Set my editor and git editor
export EDITOR="/usr/bin/vim"
export GIT_EDITOR='/usr/bin/vim'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Go Path
export GOPATH=~/.go
export GOBIN=$GOPATH/bin

# Load Bash It
source $BASH_IT/bash_it.sh

# Custom Shiz
export PATH="$HOME/.bin:HOME/.composer/vendor/bin/:$GOBIN:$PATH"
export MYSQL_HISTFILE=/dev/null
export LESSHISTFILE=/dev/null
export BZR_LOG=/dev/null
export BROWSER=firefox
export PULSE_LATENCY_MSEC=60

alias sl='ls'
alias ls='ls --color'
alias ccat='highlight -O ansi'
alias less='less -F -g -i -M -R -S -w -X -z -4'

alias saidar='saidar -c'
alias packer='packer --noconfirm --noedit --auronly'
alias ll='ls -lh'
alias mpv='DISPLAY=:0 mpv -vo vdpau:fps=60 -ao=alsa'
alias rm='rm -f'
alias tmux='tmux -2'
alias mpd='sudo -E mpd ~/.mpd/mpd.conf'

stty werase undef
bind '\C-w:unix-filename-rubout'
bind Space:magic-space

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
