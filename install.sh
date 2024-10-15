#!/bin/bash
ROOT="$(pwd -P)"

if [ -z "$*" ]; then
  echo "Usage:"
  echo -e "\t./install.sh */"
  echo -e "\t./install.sh i3 xorg zsh"
  exit
fi

install() {
  local files="$(find -L $* -type f -not -name README\*)"

  oldIFS="$IFS"
  IFS=$'\n'

  for file in $files; do
    local dest="$HOME/${file#*/}"

    mkdir -p "$(dirname "$dest")"

    # create an absolute symlink
    ln -sir "$ROOT/$file" "$dest"
  done

  IFS="$oldIFS"
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
