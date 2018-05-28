#!/usr/bin/env bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xset +fp /usr/share/fonts/local
xset fp rehash                  # Something else for the fonts
#xset dpms force on
xset s 300 300
fc-cache
xset m 1/1 0                    # No Mouse Acceleration

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsetroot -cursor_name left_ptr &

export GPG_TTY=$(tty)
/usr/bin/gpg-connect-agent updatestartuptty /bye &>/dev/null

monitor &
#xinput disable $(xinput | grep 'Touch' | grep -Po 'id=\d+' | cut -d'=' -f2) &
xmodmap ~/.xmodmap &

exec 2bwm
#exec dwm

# vim: ft=sh ts=4 sw=4 tw=0 fdm=marker foldlevel=0 :
