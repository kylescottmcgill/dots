#!/usr/bin/env bash

alias rm='rm -f'

alias less='less -F -g -i -M -R -S -w -X -z -4'

alias sl='ls'
alias ls='ls --color -h --group-directories-first --quoting-style=literal'
alias ll='ls -lh'

alias git=hub
alias gitpp='git pull ; git push'
alias gits='git status -s'
alias gs='git status -s'
alias glog='git log --graph --decorate --pretty=oneline --abbrev-commit'

alias packer='packer --noconfirm --noedit --auronly'
alias search='\packer -Ss'
alias update='sudo pacman -Syu --noconfirm; packer -Syu'

alias docker-clean='docker rm -f $(docker ps -aq)'

alias v=vim
alias vim="nvim -i ~/.cache/nviminfo"

alias irc='weechat'

alias repo-sync='sudo reflector -l 100 -p http --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syyu'

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
