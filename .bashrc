#!/usr/bin/env bash

# Load sensible.bash
if [ -f $HOME/Projects/src/github.com/kylescottmcgill/bash-sensible/sensible.bash ]; then
	source $HOME/Projects/src/github.com/kylescottmcgill/bash-sensible/sensible.bash
fi

if [ -d $HOME/.bash ]; then
	source $HOME/.bash/alias.bash
	source $HOME/.bash/colors.bash
	source $HOME/.bash/theme.bash
fi

# Set my editor and git editor
export EDITOR="$(which nvim)"
export GIT_EDITOR=$EDITOR

# Don't check mail when opening terminal.
unset MAILCHECK

# Golang
export GOPATH=$HOME/Projects
export GOBIN=$HOME/Projects/bin

# Custom Shiz
export PATH="$GOBIN:$PATH"

eval $(dircolors -b $HOME/.config/LS_COLORS | sed -e s#^LS_COLORS#LS_COLORS_CUSTOM#g | sed -e s#^export\ LS_COLORS##g)
eval $(dircolors -b $HOME/.config/dircolors/LS_COLORS | sed -e s#^LS_COLORS#LS_COLORS_BASE#g | sed -e s#^export\ LS_COLORS##g)
export LS_COLORS="$LS_COLORS_BASE$LS_COLORS_CUSTOM"

hash pkgfile 2>/dev/null && source /usr/share/doc/pkgfile/command-not-found.bash

export MYSQL_HISTFILE=/dev/null
export LESSHISTFILE=/dev/null
export BZR_LOG=/dev/null
export BROWSER=chromium
export XDG_CONFIG_HOME="$HOME/.config"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export WWW_HOME="$HOME/.cache"

