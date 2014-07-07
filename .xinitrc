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
xset fp rehash                  # Something else for the fonts
xset -b                         # disable bell
xrdb $HOME/.Xresources   # Merge Xresources

sleep 1; xset -dpms             # Do not turn off the screen
xset s off                      # Do not allow the screensaver to start
xset m 1/1 0

mpd                             # Start MPD
numlockx                        # Chromebook doesnt have Numlock but thats ok

export RADEON_HYPERZ=1          # Sets Radeon Drivers to use HyperZ for vdpau
export LIBVA_DRIVER_NAME=vdpau  # Use vdpau
export VDPAU_DRIVER=radeonsi    # Use opensource Drivers

xsetroot -cursor_name left_ptr &  # Use a non-shit cursor

# This sets the main screen to Vetical, i have this at work, errors out on chromebook and main pc
#xrandr --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate left \
#       --output VGA1 --mode 1920x1080 --pos 1080x376 --rotate normal

xrandr --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output VGA1 --mode 1920x1080 --pos 1920x0 --rotate normal


# This is required for some GTK2 themes to get set correctly
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
nitrogen --restore &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# Finally, start the correct WindowManger based on the hostname
#case "$(hostname)" in
#    "ouroboros") exec xmonad ;; # Main PC
#    "xm-ouroboros") exec xmonad ;;   # Chromebook
#    "chrome") exec monsterwm ;;   # Work PC
#    *) exec dwm ;;
#esac

exec monsterwm &> ~/.cache/xlog.log
