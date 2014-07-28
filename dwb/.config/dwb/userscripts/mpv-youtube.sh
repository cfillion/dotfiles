#!/bin/sh
# dwb:xyt

proxy="$DWB_PROXY"
uri="$DWB_URI"
title="$DWB_TITLE"

notify-send -t 2 "$DWB_TITLE" "Extracting media..."

echo "js \
  f=document.getElementsByTagName('embed')[0]; \
  f.parentNode.removeChild(f);
" > "$DWB_FIFO"

cookies="/tmp/youtube-cookies-$RANDOM"
ua=$(youtube-dl --dump-user-agent)
media=$(youtube-dl -g --cookies "$cookies" --proxy "$proxy" "$uri")

(
http_proxy=$proxy mpv --quiet --force-window \
  --user-agent="$ua" --cookies --cookies-file="$cookies" \
  --title="$DWB_TITLE" "$media"
rm "$cookies"
) &
