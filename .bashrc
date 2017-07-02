#!/usr/bin/env sh

SENSIBLE_BASH="$HOME/src/github.com/mrzool/bash-sensible/sensible.bash"
[[ -s $SENSIBLE_BASH ]] && source $SENSIBLE_BASH

export BASH_HOME="$HOME/.config/bash"

if [ -d $BASH_HOME ]; then
	for b in $BASH_HOME/* ; do
		[ -f $b ] && source $b
	done

	for b in $BASH_HOME/func/* ; do
		[ -f $b ] && source $b
	done
fi

