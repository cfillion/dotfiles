#!/bin/sh
if [ -r ~/.ssh/id_rsa ]; then
  keychain ~/.ssh/id_rsa 2>/dev/null
  [ -r ~/.keychain/$HOSTNAME-sh ] && . ~/.keychain/$HOSTNAME-sh
  [ -r ~/.keychain/$HOSTNAME-sh-gpg ] && . ~/.keychain/$HOSTNAME-sh-gpg
fi
