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

export DESKTOP_SESSION=gtk2
rm -rf ~/.cache/dwb*

xrdb -load ~/.Xresources
~/.screenlayout/default

xautolock -time 30 -locker 'i3lock -c 000000 --dpms' &
xset dpms 0 0 0 # disable automatic screen blanking

clipit -d &
mbsync -a &
qjackctl  &
udiskie   &

exec ${2:-i3}
