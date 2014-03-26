#!/bin/sh
if [ -r ~/.ssh/id_rsa ]; then
  keychain --quiet ~/.ssh/id_rsa
  [ -r ~/.keychain/$HOSTNAME-sh ] && . ~/.keychain/$HOSTNAME-sh
  [ -r ~/.keychain/$HOSTNAME-sh-gpg ] && . ~/.keychain/$HOSTNAME-sh-gpg
fi
