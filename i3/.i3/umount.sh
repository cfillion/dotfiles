#!/bin/sh
device=$(ls /media | dmenu -i -p "device:")
[ "$device" ] || exit

msg=$(udiskie-umount -de "/media/$device" 2>&1)
[ "$?" -eq 0 ] || notify-send -u critical "$msg"
