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
xmodmap ~/.xmodmap &

# Finally, start the correct WindowManger based on the hostname

#sxhkd &
#exec bspwm

exec 2bwm

# vim: ft=sh ts=4 sw=4 tw=0 fdm=marker foldlevel=0 :
