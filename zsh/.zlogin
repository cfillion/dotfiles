#!/bin/sh
HOSTNAME=`hostname`

keychain --quiet ~/.ssh/id_rsa
[ -r ~/.keychain/$HOSTNAME-sh ] && . ~/.keychain/$HOSTNAME-sh 2>/dev/null
[ -r ~/.keychain/$HOSTNAME-sh-gpg ] && . ~/.keychain/$HOSTNAME-sh-gpg 2>/dev/null

