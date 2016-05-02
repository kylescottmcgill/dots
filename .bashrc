#!/usr/bin/env bash

# Load sensible.bash
SENSIBLE_BASH="$HOME/Source/src/github.com/kylescottmcgill/bash-sensible/sensible.bash"
[[ -s $SENSIBLE_BASH ]] && source $SENSIBLE_BASH

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-grayscale.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

if [ -d $HOME/.bash ]; then
	source $HOME/.bash/alias.bash
	source $HOME/.bash/colors.bash
	source $HOME/.bash/theme.bash
	source $HOME/.bash/functions.bash
fi

# Set my editor and git editor
export EDITOR="$(which nvim)"
export GIT_EDITOR=$EDITOR

# Don't check mail when opening terminal.
unset MAILCHECK

# Golang
export GOPATH=$HOME/Source
export GOBIN=$HOME/Source/bin

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

