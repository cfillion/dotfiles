#!/bin/sh
mark_id=$(echo -n | dmenu -i -p "identifier:")
[ "$mark_id" ] && i3-msg "mark $mark_id"
