source ~/.bashrc

export NVM_DIR="/home/kyle/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -z $DISPLAY && $XDG_VTNR -eq 1 && $TERM=linux ]] && exec startx
