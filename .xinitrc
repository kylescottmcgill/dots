#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset +fp /usr/share/fonts/local
xset fp rehash
xset -b # disable bell
xrdb -merge $HOME/.Xresources

sleep 1; xset -dpms
xset s off

mpd
numlockx

export RADEON_HYPERZ=1
export LIBVA_DRIVER_NAME=vdpau
export VDPAU_DRIVER=radeonsi

xsetroot -cursor_name left_ptr &

xrandr --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate left \
       --output VGA1 --mode 1920x1080 --pos 1080x376 --rotate normal


export GTK2_RC_FILES="$HOME/.gtkrc-2.0" &
sh ~/.fehbg &

if [[ hostname == "ouroboros" ]]; then exec xmonad; else exec dwm; fi
