#!/usr/bin/env bash

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
alias c='clear'
alias p="pwd | sed \"s:$HOME:~:g\""
alias i='weechat'
alias e='$EDITOR'
alias v='$EDITOR'
alias vim="nvim -i ~/.cache/nviminfo"

# git
alias gs='git status -s'
alias gita='git add .'
alias gitc='git commit -m'
alias gitl='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gitp='git push -u origin master'
alias gitpp='git pull ; git push'
alias gitt='git add . && git commit && git push -u origin master'

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
