#!/bin/bash

function prompt_command() {
    status=$(rt=$?; [[ $rt = 0 ]] && echo ${black} || echo ${red})
	PS1=" ${normal}\W${status} »${normal} "
}

PROMPT_COMMAND=prompt_command;
