#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xset +fp /usr/share/fonts/local
xset fp rehash                  # Something else for the fonts
fc-cache
xset s off ; xset -dpms
xset m 1/1 0                    # No Mouse Acceleration

xrdb $HOME/.Xresources          # Merge Xresources

autocutsel -fork
autocutsel -selection PRIMARY -fork
# panel &
$HOME/.fehbg &
xsetroot -cursor_name left_ptr & # Use a non-shit cursor

# Finally, start the correct WindowManger based on the hostname
case "$(hostname)" in
	"kuro") exec 2bwm ;;
	*) xwait ;;
esac
