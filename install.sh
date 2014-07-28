#!/bin/sh
if [ -z "$*" ]; then
  echo "Usage:"
  echo -e "\t./install.sh */"
  echo -e "\t./install.sh i3 xorg zsh"
  exit
fi

cd "$(dirname $0)"
files="$(find $* -type f)"
root="$(pwd -P)"

for file in $files; do
  dest="$HOME/${file#*/}"

  mkdir -p "$(dirname "$dest")"
  ln -si "$root/$file" "$dest"
done
