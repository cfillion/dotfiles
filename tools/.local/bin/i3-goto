#!/bin/sh
mark_id=$(i3-msg -t get_marks | jq -r ".[]" | dmenu -i -p "mark:")
[ "$mark_id" ] && i3-msg "[con_mark=\"$mark_id\"] focus"
