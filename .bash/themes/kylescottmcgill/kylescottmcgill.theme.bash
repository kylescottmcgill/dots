#!/usr/bin/env bash
# kylescottmcgill theme by Kyle Mcgill <email@kylescottmcgill.com>

## look-a-like
# host directory [git:repo:branch*]»
# for example:
# ananas ~/Code/bash-it/themes [git:bash-it:master*]»

function git_status() {
    if [[ `git rev-parse --show-toplevel 2>/dev/null` != $HOME ]]; then
        vcprompt -f'[%n:%b%m]' 2>/dev/null
    else
        vcprompt -f'%m' 2>/dev/null
    fi
}

function prompt_command() {
    STATUS=$(rt=$?; [[ $rt = 0 ]] && echo ${bold_blue} || echo ${bold_red})
    if [[ $COLORSCHEME == "minimal" || `tput cols` -le 60 ]]; then
        PS1="${STATUS} » ${normal}"
    else
        PS1="${STATUS}\h${bold_black} \w${normal} ${bold_white}\$(git_status)${normal}» "
    fi
}

PROMPT_COMMAND=prompt_command;

