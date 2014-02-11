#!/bin/sh
device=$(ls /media | dmenu -i -p "device:")
[ "$device" ] && udiskie-umount -de "/media/$device"
