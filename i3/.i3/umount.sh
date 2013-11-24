#!/bin/sh
udiskie-umount -de "/media/$(ls /media | dmenu)"
