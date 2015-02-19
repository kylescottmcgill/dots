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
export IRC_CLIENT='weechat'

# Go Path
export GOPATH=~/.go
export GOBIN=$GOPATH/bin

# PHP Path
export PHPPATH=~/.composer/vendor/bin

# Ruby Path
if [[ -e /usr/share/chruby/chruby.sh ]];
then
    source /usr/share/chruby/chruby.sh
    source /usr/share/chruby/auto.sh
fi

# Load Bash It
source $BASH_IT/bash_it.sh

# Sources Private Settings like auth tokens etc
source $HOME/.bash_private

# Custom Shiz
export PATH="$HOME/.bin:$PHPPATH:$GOBIN:$PATH"

export MYSQL_HISTFILE=/dev/null
export LESSHISTFILE=/dev/null
export BZR_LOG=/dev/null
export BROWSER=chromium
export XDG_CONFIG_HOME="$HOME/.config"
export NIX_REMOTE=daemon

alias sl='ls'
alias ls='ls --color -h --group-directories-first'
alias less='less -F -g -i -M -R -S -w -X -z -4'
alias saidar='saidar -c'
alias packer='packer --noconfirm --noedit --auronly'
alias ll='ls -lh'
alias rm='rm -f'
alias tmux='tmux -2 -f ~/.tmux/tmux.conf'
alias v="vim -i NONE -X"
alias gv='gvim -X'
alias mini='source $HOME/.bin/mini'

#alias git=hub
alias gitpp='git pull ; git push'
alias gits='git status -s'
alias gs='git status -s'

alias mysql='mysql --auto-rehash'

alias t=teamocil_setup

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

eval $(dircolors -b $HOME/.dircolors)

hash pkgfile 2>/dev/null && source /usr/share/doc/pkgfile/command-not-found.bash

teamocil_setup() {
    teamocil --here --layout=$HOME/.tmux/$1.yml
}
