#!/bin/sh
ROOT="$(pwd -P)"

if [ -z "$*" ]; then
  echo "Usage:"
  echo -e "\t./install.sh */"
  echo -e "\t./install.sh i3 xorg zsh"
  exit
fi

install() {
  local files="$(find $* -type f -not -name README\*)"

  for file in $files; do
    local dest="$HOME/${file#*/}"

    mkdir -p "$(dirname "$dest")"

    # create an absolute symlink
    ln -si "$ROOT/$file" "$dest"
  done
}

readme() {
  local sep_len="$(tput cols)"

  for directory in $*; do
    local readme="$directory"/README

    [ -f "$readme"* ] || continue

    echo
    printf '%.0s―' $(seq 1 "$sep_len")
    echo; echo

    cat "$readme"*
  done
}

cd "$(dirname $0)"

install $*
readme $*
