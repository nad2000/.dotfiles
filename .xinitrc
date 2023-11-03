#!/bin/sh

# this file is run when calling startx
#
# user init scripts and settings
[ -r /etc/X11/xinit/.Xresources ] && xrdb -merge /etc/X11/xinit/.Xresources 
[ -r /etc/X11/xinit/.Xmodmap ] && xmodmap /etc/X11/xinit/.Xmodmap
[ -r ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap

# to run Android Studio soothly
export _JAVA_AWT_WM_NONREPARENTING=1

# default arch init scripts
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[ -r ~/.xprofile ] && . ~/.xprofile

# Fcitx: https://wiki.archlinux.org/title/Fcitx#Set_environment_variables_for_IM_modules
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS='@im=fcitx'
export XIM_PROGRAM=/usr/bin/fcitx5

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

xcompmgr &
# launch the session, commands below this line will be ignored
# exec dwm
exec ssh-agent dwm
