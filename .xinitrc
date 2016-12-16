#!/usr/bin/env bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xset +fp /usr/share/fonts/local
xset fp rehash                  # Something else for the fonts
fc-cache
xset s off ; xset -dpms
xset m 1/1 0                    # No Mouse Acceleration

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

autocutsel -fork
autocutsel -fork -selection PRIMARY

xsetroot -solid "#222222" -cursor_name left_ptr &

monitor &

sudo rfkill unblock 0
EXTERNAL_MOUSE=$(xinput --list | grep -w "MX Master")
if [[ $EXTERNALMOUSE != "" ]]; then
	MOUSE=$(xinput --list | grep -m 1 -w MX\ Master | awk '{print $5}' | cut -d"=" -f2)

	xinput --set-prop $MOUSE "Device Accel Constant Deceleration" 2
	xinput --set-prop $MOUSE "Device Accel Velocity Scaling" 1
	/usr/bin/synclient TouchpadOff=1
else
	/usr/bin/synclient TouchpadOff=0
fi

# Finally, start the correct WindowManger based on the hostname
case "$(hostname)" in
	"kuro") exec 2bwm;;
esac

# vim: ft=sh ts=4 sw=4 tw=0 fdm=marker foldlevel=0 :
