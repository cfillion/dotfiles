#!/bin/sh
# dwb:xyt

echo "js \
  f=document.getElementsByTagName('embed')[0]; \
  f.parentNode.removeChild(f);
" > "$DWB_FIFO"

video=$(youtube-dl -g --proxy "$DWB_PROXY" "$DWB_URI")
mpv --title="$DWB_TITLE" "$video"
