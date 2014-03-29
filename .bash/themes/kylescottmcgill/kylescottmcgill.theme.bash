#!/usr/bin/env bash
# n0qorg theme by Florian Baumann <flo@noqqe.de>

## look-a-like
# host directory (branch*)»
# for example:
# ananas ~/Code/bash-it/themes (master*)»

function git_status() {
    if [[ `vcprompt -f'%P'` != `whoami` ]]; then
        vcprompt -f'[%s:%P:%b%m%a]' -n 2>/dev/null
    else
        vcprompt -f %m -n 2>/dev/null
    fi
}

function prompt_command() {
    STATUS=$(rt=$?; [[ $rt = 0 ]] && echo ${bold_blue} || echo ${bold_red})
    PS1="${STATUS}\$(hostname)${bold_black} \w${normal} ${bold_white}$(git_status)${normal}» "
}

PROMPT_COMMAND=prompt_command;

## git-theme
# feel free to change git chars.
GIT_THEME_PROMPT_DIRTY="${bold_blue}*${bold_white}"
GIT_THEME_PROMPT_CLEAN=""
GIT_THEME_PROMPT_PREFIX="${bold_blue}(${bold_white}"
GIT_THEME_PROMPT_SUFFIX="${bold_blue})"

## alternate chars
#
SCM_THEME_PROMPT_DIRTY="*"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX="("
SCM_THEME_PROMPT_SUFFIX=")"
