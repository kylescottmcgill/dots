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

# git git git
alias git=hub
alias gs='git status -s'
alias gita='git add .'
alias gitc='git commit -m'
alias gitl='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gitp='git push -u origin master'
alias gitpp='git pull ; git push'
alias gitt='git add . && git commit && git push -u origin master'

# misc
alias rm='rm -f'
alias less='less -F -g -i -M -R -S -w -X -z -4'

alias packer='packer --noconfirm --noedit --auronly'
alias search='\packer -Ss'
alias update='sudo pacman -Syu --noconfirm; packer -Syu'

alias mpv='mpv --msg-level=cplayer=fatal:ffmpeg=fatal --loop=inf --cache=no'
alias mutt="mutt -F $HOME/.config/mutt/muttrc"
alias repo-sync='sudo reflector -l 100 -p http --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syyu'

steam-debug() {
find ~/.local/share/Steam/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete
find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete

find ~/.local/share/Steam/ -name "libgpg-error.so*" -print -delete
find ~/.steam/root/ -name "libgpg-error.so*" -print -delete

steam
}

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
