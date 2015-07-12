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

fc-cache
xset +fp /usr/share/fonts/local
xset fp rehash                  # Something else for the fonts
xset -b                         # disable bell
xrdb $HOME/.Xresources          # Merge Xresources

xset m 1/1 0                    # No Mouse Acceleration

xsetroot -cursor_name left_ptr & # Use a non-shit cursor

# This is required for some GTK2 themes to get set correctly

export _JAVA_AWT_WM_NONREPARENTING=1
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
compton &
hsetroot -solid "#1F2833" &
nitrogen --restore &

#bottombar &
while true; do
   xsetroot -name "$( date +"%F %R" )"
   sleep 1m    # Update time every minute
done &

# Finally, start the correct WindowManger based on the hostname
case "$(hostname)" in
    # "turtil") sxhkd & exec bspwm ;;    # Laptop
    "turtil")  dwm ;;    # Laptop
esac
