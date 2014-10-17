#!/bin/sh
# Executed by startx

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -d ~/.startup/ ]; then
  for f in ~/.startup/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec ${2:-i3}
