#!/bin/sh
LAYOUTDIR="$HOME/.screenlayout"

choice=$(ls "$LAYOUTDIR" | dmenu -i -p "screen-layout:")
[ "$choice" ] && source "$LAYOUTDIR/$choice"
