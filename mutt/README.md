# Mutt

The Mutt E-Mail Client

http://www.mutt.org/

    # pacman -S inotify-tools isync msmtp mutt w3m

Dependencies:

- [inotify-tools](https://github.com/inotify-tools/inotify-tools) for the `watch-mail` script
- [isync](https://isync.sourceforge.io/) to synchronize IMAP mailboxes
- [msmtp](https://marlam.de/msmtp/) for sending mail without a hard-coded plain-text password
- [w3m](https://salsa.debian.org/debian/w3m) for parsing HTML attachments

Additional untracked configuration:

    $ cat > ~/.config/mutt/identrc
    set from = "user@host"
    set realname = "John Doe"
    alternates ...

    $ cat > ~/.config/isyncrc
    Create Both
    Remove Near
    Expunge Both
    SyncState *

    IMAPStore remote
      TLSType IMAPS
      Host hostname
      User user@hostname
      Pass "p@ssw0rd (or PassCmd)"

    MaildirStore local
      Path ~/.mail/
      Inbox ~/.mail/INBOX

    Channel default
      Far :remote:
      Near :local:
      Patterns * !Trash
    $ systemctl daemon-reload --user
    $ systemctl enable --user --now isync.timer

    $ cat > ~/.config/msmtp/config
    defaults
      auth on
      port 587
      tls on

    account default
      host host
      user user@host
      from user@host
      passwordeval pass email/smtp
