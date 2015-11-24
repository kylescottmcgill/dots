#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xset +fp /usr/share/fonts/local
xset fp rehash                  # Something else for the fonts
xset s off ; xset -dpms
xrdb $HOME/.Xresources          # Merge Xresources
fc-cache

xset m 1/1 0                    # No Mouse Acceleration

xsetroot -cursor_name left_ptr & # Use a non-shit cursor

# This is required for some GTK2 themes to get set correctly
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

autocutsel -fork
autocutsel -selection PRIMARY -fork

feh --bg-fill "$HOME/Pictures/253 - NDO9v7C.jpg" --no-fehbg
sxhkd &

focus_watcher.sh &
gm &

# Finally, start the correct WindowManger based on the hostname
case "$(hostname)" in
    "turtil") exec sh -c '$HOME/.local/bin/swm' ;;    # Laptop
	*) xwait ;;
esac
