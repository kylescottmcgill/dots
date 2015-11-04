#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xset +fp /usr/share/fonts/local
xset fp rehash                  # Something else for the fonts
xset -b                         # disable bell
xset s off ; xset -dpms
xrdb $HOME/.Xresources          # Merge Xresources
fc-cache

xset m 1/1 0                    # No Mouse Acceleration

xsetroot -cursor_name left_ptr & # Use a non-shit cursor

# This is required for some GTK2 themes to get set correctly
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

autocutsel -fork &
autocutsel -selection PRIMARY -fork &

#compton &
hsetroot -fill "$HOME/Pictures/033 - YNMDMrz.jpg" &
sxhkd &

focus_watcher.sh &
gm &
#pulse.sh &

exec sh -c '$HOME/.local/bin/swm'

#xwait

# Finally, start the correct WindowManger based on the hostname
#case "$(hostname)" in
#    "turtil") bspwm ;;    # Laptop
#esac
