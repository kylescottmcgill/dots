[[ -z $DISPLAY && $XDG_VTNR -eq 1 && $TERM=linux ]] && exec startx

source ~/.bashrc

if [[ ! S{DISPLAY} && ${XDG_VTNR} == 1 ]]; then
    exec startx &> ~/.cache/x.log
fi





export NVM_DIR="/home/kyle/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
