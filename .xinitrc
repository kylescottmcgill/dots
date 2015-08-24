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

#source /etc/X11/xinit/xinitrc.d/30-dbus.sh
#eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)

#export SSH_AUTH_SOCK
#export GPG_AGENT_INFO
#export GNOME_KEYRING_CONTROL
#export GNOME_KEYRING_PID

compton &
nitrogen --restore &

# Finally, start the correct WindowManger based on the hostname
case "$(hostname)" in
#    "turtil") exec budgie-session ;;    # Laptop
    "turtil") sxhkd & bspwm ;;    # Laptop
    #"turtil") $HOME/Projects/wtftw/target/release/wtftw ;;    # Laptop
esac
