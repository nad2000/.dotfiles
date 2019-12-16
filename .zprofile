export PATH="$HOME/.cargo/bin:$PATH"
[ -z $DISPLAY ] && [ $XDG_VTNR -eq 1 ] && exec startx
