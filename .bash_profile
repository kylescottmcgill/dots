source ~/.bashrc

[[ -z $DISPLAY && $XDG_VTNR -eq 1 && $TERM=linux && -z "$TMUX" ]] && exec startx &>/tmp/xorg.log || true

