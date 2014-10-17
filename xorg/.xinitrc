#!/bin/sh
# Executed by startx

source_dir() {
  [ -d "$1" ] || return

  for f in "$1"/*; do
    [ -x "$f" ] && . "$f"
  done

  unset f
}

source_dir /etc/X11/xinit/xinitrc.d
source_dir ~/.startup

exec ${2:-i3}
