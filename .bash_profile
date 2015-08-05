source ~/.bashrc

#[[ -z $DISPLAY && $XDG_VTNR -eq 1 && $TERM=linux && -z "$TMUX" ]] && exec startx || true

#systemctl --user import-environment PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
