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

# Set this to the command you use for todo.txt-cli
# export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
export VCPROMPT_EXECUTABLE=~/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh


# Custom Shiz
export PATH=~/.bin/:$PATH
export MYSQL_HISTFILE=/dev/null
export LESSHISTFILE=/dev/null
alias sl='ls'
alias ls='ls --color'
alias ccat='highlight -O ansi'
alias less='less -F -g -i -M -R -S -w -X -z -4'

alias saidar='saidar -c'
alias packer='packer --noconfirm --noedit --auronly'
alias ll='ls -lh'
alias mpv='DISPLAY=:0 mpv -vo vdpau:fps=60 -ao=pulse'
alias rm='rm -f'
alias tmux='tmux -2'
source /usr/share/chruby/chruby.sh
PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"


# Functions to Execute per Interactive Session
crontab-update >/dev/null 2>&1
