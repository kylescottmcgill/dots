#!/usr/bin/env sh

SENSIBLE_BASH="$HOME/src/github.com/mrzool/bash-sensible/sensible.bash"
[[ -s $SENSIBLE_BASH ]] && source $SENSIBLE_BASH

export BASH_HOME="$HOME/.config/bash"

if [ -d $BASH_HOME ]; then
	for b in $BASH_HOME/* ; do
		source $b
	done
fi


# added by travis gem
[ -f /home/kyle/.travis/travis.sh ] && source /home/kyle/.travis/travis.sh
