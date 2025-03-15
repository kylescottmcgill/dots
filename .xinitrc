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

xsetroot -cursor_name left_ptr

export GPG_TTY=$(tty)
/usr/bin/gpg-connect-agent updatestartuptty /bye &>/dev/null

export WINIT_X11_SCALE_FACTOR=1
nitrogen --restore
.screenlayout/home.sh
#monitor &

#xmodmap ~/.xmodmap &
#xinput --set-prop 8 'libinput Accel Profile Enabled' 0, 1
#setxkbmap -option altwin:swap_lalt_lwin

exec 2bwm >| .cache/2bwm.log

# vim: ft=sh ts=4 sw=4 tw=0 fdm=marker foldlevel=0 :
