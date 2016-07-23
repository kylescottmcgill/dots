#!/usr/bin/env sh

SENSIBLE_BASH="$HOME/src/github.com/kylescottmcgill/bash-sensible/sensible.bash"
[[ -s $SENSIBLE_BASH ]] && source $SENSIBLE_BASH

export BASH_HOME="$HOME/.config/bash"

if [ -d $BASH_HOME ]; then
	for b in $BASH_HOME/* ; do
		source $b
	done
fi
