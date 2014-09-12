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

export DESKTOP_SESSION='gtk2'
export QT_STYLE_OVERRIDE='gtk'

xrdb -load ~/.Xresources
~/.screenlayout/default

numlockx on
setxkbmap us colemak #terminate:ctrl_alt_bksp
xmodmap ~/.Xmodmap
xset r 66

synclient \
  VertEdgeScroll=1 \
  HorizEdgeScroll=1 \
  VertTwoFingerScroll=0 \
  HorizTwoFingerScroll=0 \
  CoastingSpeed=0

# prevent screen from turning off
xset dpms 0 0 0

mbsync -a   &
qjackctl    &
udisks-glue &
xautolock -time 30 -locker \
  'i3lock -c 000000 --dpms' &

exec ${2:-i3}
