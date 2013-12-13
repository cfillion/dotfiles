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

xrdb -load ~/.Xresources
~/.screenlayout/default

xautolock -time 30 -locker 'i3lock -c 000000 --dpms' &
xset dpms 0 0 0 # disable automatic screen blanking

udiskie & # automount devices
mbsync -a & # syncronize mail

# use gtk theme in Qt5 applications
export DESKTOP_SESSION=gnome

exec ${2:-i3}
# ...or the Window Manager of your choice
