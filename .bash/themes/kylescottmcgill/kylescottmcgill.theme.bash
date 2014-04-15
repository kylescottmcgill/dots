#!/usr/bin/env bash
# kylescottmcgill theme by Kyle Mcgill <email@kylescottmcgill.com>

## look-a-like
# host directory [git:repo:branch*]»
# for example:
# ananas ~/Code/bash-it/themes [git:bash-it:master*]»

function git_status() {
    if [[ `vcprompt -f'%P'` != `whoami` ]]; then
        vcprompt -f'[%s:%P:%b%m%a]' -n 2>/dev/null
    else
        vcprompt -f %m -n 2>/dev/null
    fi
}

function prompt_command() {
    STATUS=$(rt=$?; [[ $rt = 0 ]] && echo ${bold_blue} || echo ${bold_red})
    PS1="${STATUS}\$(hostname)${bold_black} \w${normal} ${bold_white}\$(git_status)${normal}» "
}

PROMPT_COMMAND=prompt_command;

