#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

#xset +fp /usr/local/lib/X11/fonts
#xset +fp /usr/share/fonts/local
#xset +fp /usr/share/fonts/TTF
#xset +fp /usr/share/fonts/misc
#xset +fp /usr/share/fonts

[[ -d $HOME/.local/share/fonts ]] && xset +fp $HOME/.local/share/fonts
fc-cache
xset fp rehash                  # Something else for the fonts
xset -b                         # disable bell
xrdb $HOME/.Xresources          # Merge Xresources

xset m 1/1 0                    # No Mouse Acceleration

xsetroot -cursor_name left_ptr & # Use a non-shit cursor

#if [[ -d ~/.screenlayout ]]; then
#    ~/.screenlayout/nvidia.sh
#fi

# This is required for some GTK2 themes to get set correctly

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
#compton &
hsetroot -solid "#1F2833"

#bottombar &

# Finally, start the correct WindowManger based on the hostname
case "$(hostname)" in
    "turtil") sxhkd & exec bspwm ;;    # Laptop
    "xm-dev") unclutter -grab & sxhkd & exec bspwm ;;    # Work PC
    *) exec xmonad ;;
esac
