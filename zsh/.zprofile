path=("$HOME/.local/bin" $path)

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  wm="$(readlink -e "$(which desktop-session)")"
  [ -x "$wm" ] && exec "$wm" >/dev/null
fi
