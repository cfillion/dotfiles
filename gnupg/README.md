# GnuPG

https://www.gnupg.org/

    # pacman -Syu gnupg

To have gpg-agent present a subkey with the `Authentication` capability to SSH:

1. `gpg --export-ssh-key $KEY_ID | ssh remote_host tee -a .ssh/authorized_keys`
2. `gpg --list-secret-keys --with-keygrip`
3. `gpg-connect-agent 'keyattr $KEYGRIP Use-for-ssh: true' /bye
