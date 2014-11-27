#!/bin/sh
# dwb:,m

proxy="$DWB_PROXY"
uri="$DWB_URI"

play='http_proxy="'"$proxy"'" mpv --fs "'"$uri"'" || read'
xterm -T "mpv.sh: $uri" -e "zsh -ic '$play'"
