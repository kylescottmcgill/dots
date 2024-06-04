#!/usr/bin/env sh

if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc
fi

#if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
#  exec startx
#fi


# Added by Toolbox App
export PATH="$PATH:/home/turtil/.local/share/JetBrains/Toolbox/scripts"

