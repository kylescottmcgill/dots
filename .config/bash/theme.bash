#!/bin/bash

function prompt_command() {
    STATUS=$(rt=$?; [[ $rt = 0 ]] && echo ${bold_blue} || echo ${bold_red})
        PS1=" ${normal}\W${STATUS} » ${normal}"
}

PROMPT_COMMAND=prompt_command;
