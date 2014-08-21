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
xrdb $HOME/.Xresources   # Merge Xresources

#sleep 1; xset -dpms             # Do not turn off the screen
#xset s off                      # Do not allow the screensaver to start
xset m 1/1 0                    # No Mouse Acceleration

#mpd                             # Start MPD

#export RADEON_HYPERZ=1          # Sets Radeon Drivers to use HyperZ for vdpau
#export LIBVA_DRIVER_NAME=vdpau  # Use vdpau
#export VDPAU_DRIVER=radeonsi    # Use opensource Drivers

xsetroot -cursor_name left_ptr &  # Use a non-shit cursor

xrandr --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output VGA1 --mode 1920x1080 --pos 1920x0 --rotate normal


# This is required for some GTK2 themes to get set correctly

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
nitrogen --restore &
compton --opengl --vsync opengl-swc --paint-on-overlay --config ~/.compton.conf &
conky -c ~/.conky/conkyrc &

dwm-status &

# Finally, start the correct WindowManger based on the hostname
case "$(hostname)" in
    "ouroboros") exec dwm ;;    # Main PC
    "kuro") exec dwm ;;         # Chromebook
    "tsuchinoko") exec dwm ;;   # Work PC
    *) exec dwm ;;
esac

# exec dwm &> ~/.cache/xlog.log
