#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export SSH_ASKPASS='/usr/lib/ssh/gnome-ssh-askpass'

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

[ -f ~/.screenlayout/default ] && ~/.screenlayout/default
xautolock -time 30 -locker 'i3lock -c 000000 --dpms' &
xset dpms 0 0 0 # disable automatic screen blanking

keychain ~/.ssh/id_rsa
[ -f ~/.keychain/$HOSTNAME-sh ] && . ~/.keychain/$HOSTNAME-sh 2>/dev/null
[ -f ~/.keychain/$HOSTNAME-sh-gpg ] && . ~/.keychain/$HOSTNAME-sh-gpg 2>/dev/null

udiskie & # automount devices

# exec gnome-session
# exec startkde
# exec startxfce4
exec i3 > ~/.i3/log
# ...or the Window Manager of your choice

