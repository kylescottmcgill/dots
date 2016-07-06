#!/usr/bin/env sh

# Set my editor and git editor
export EDITOR="$(which nvim)"
export GIT_EDITOR=$EDITOR

# Don't check mail when opening terminal.
unset MAILCHECK

# Golang
export GOPATH=$HOME
export GOBIN=$HOME/bin

# Custom Shiz
export PATH="$GOBIN:$PATH"

export MYSQL_HISTFILE=/dev/null
export LESSHISTFILE=/dev/null
export BZR_LOG=/dev/null
export BROWSER=chromium
export XDG_CONFIG_HOME="$HOME/.config"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WWW_HOME="$HOME/.cache"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export _JAVA_AWT_WM_NONREPARENTING=1
export BASH_HOME="$HOME/.config/bash"

SENSIBLE_BASH="$HOME/src/github.com/kylescottmcgill/bash-sensible/sensible.bash"
[[ -s $SENSIBLE_BASH ]] && source $SENSIBLE_BASH

if [ -d $BASH_HOME ]; then
	for b in $BASH_HOME/* ; do
		source $b
	done
fi

