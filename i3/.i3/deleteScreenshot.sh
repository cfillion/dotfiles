#!/bin/sh
FILE="$HOME/.zscreen/deleteURL.txt"
xdg-open $(tac "$FILE" | dmenu)
