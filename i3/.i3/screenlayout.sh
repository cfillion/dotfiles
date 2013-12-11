#!/bin/sh
LAYOUTDIR="$HOME/.screenlayout"

choice=$(ls "$LAYOUTDIR" | dmenu)
[ "$choice" ] && source "$LAYOUTDIR/$choice"
