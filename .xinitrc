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

xset +fp /usr/share/fonts/local # Load some fonts... all of dem
[[ -d $HOME/.local/share/fonts ]] && xset +fp $HOME/.local/share/fonts
xset fp rehash                  # Something else for the fonts
xset -b                         # disable bell
xrdb $HOME/.Xresources          # Merge Xresources

xset m 1/1 0                    # No Mouse Acceleration

xsetroot -cursor_name left_ptr & # Use a non-shit cursor

if [[ -d ~/.screenlayout ]]; then
    ~/.screenlayout/nvidia.sh
fi

# This is required for some GTK2 themes to get set correctly

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
sh ~/.fehbg &
compton --opengl --vsync opengl-swc --paint-on-overlay --config ~/.compton.conf &

# Finally, start the correct WindowManger based on the hostname
case "$(hostname)" in
    "ouroboros") sxhkd & exec bspwm ;;    # Main PC
    "kuro") sxhkd & exec bspwm ;;    # Laptop
    "xm-dev") sxhkd & exec bspwm ;;    # Work PC
    *) exec dwm ;;
esac
