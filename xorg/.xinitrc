#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx

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

setxkbmap us colemak #terminate:ctrl_alt_bksp
xmodmap ~/.Xmodmap
xset r 66

synclient \
  VertEdgeScroll=1 \
  HorizEdgeScroll=1 \
  VertTwoFingerScroll=0 \
  HorizTwoFingerScroll=0 \
  CoastingSpeed=0

xautolock -time 30 -locker \
  'i3lock -c 000000 --dpms' &
xset dpms 0 0 0

clipit -d &
mbsync -a &
qjackctl  &
udiskie   &

exec ${2:-i3}
