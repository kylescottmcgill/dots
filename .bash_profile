source ~/.bashrc

[[ -z $DISPLAY && $XDG_VTNR -eq 1 && $TERM=linux && -z "$TMUX" ]] && exec startx
if [ -e /Users/Kyle/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/Kyle/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
