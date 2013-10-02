#!/bin/sh
sleep 0.1
filename=$(scrot -msb ~/Pictures/screenshots/%Y-%m-%d-%H%M%S.png -e 'echo $f')
xdg-open $filename &
xterm -hold -title imgur -e zsh -ic "imgur $filename"

