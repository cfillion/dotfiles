cfi30's dotfiles
================

Installation using [GNU Stow](http://www.gnu.org/software/stow/) (does not overwrite existing files):
```
$ git clone https://cfi30@bitbucket.org/cfi30/dotfiles.git ~/cfi30-dotfiles
$ cd ~/cfi30-dotfiles
$ stow */ # full installation
$ stow i3 xorg zsh ... # partial installation
```

Dependencies
------------

**alsa-jack**

- `snd-aloop` kernel module

**gtk**

- [MediterraneanNight Series](http://gnome-look.org/content/show.php/MediterraneanNight+Series?content=156782)

**i3**

- [jq](http://stedolan.github.io/jq/)
- [QjackCtl](http://qjackctl.sourceforge.net/)
- [udiskie](https://github.com/coldfix/udiskie)
- xautolock
- [zscreen](https://github.com/ChrisZeta/Scrot-and-imgur-zenity-GUI)

**vim**

- [Vundle](https://github.com/gmarik/vundle)

**weechat**

- [buffers](http://www.weechat.org/scripts/source/buffers.pl.html/)
- [colorize_lines](http://www.weechat.org/scripts/source/colorize_lines.pl.html/)
- [colorize_nicks](http://www.weechat.org/scripts/source/colorize_nicks.py.html/)
- [zerotab](http://www.weechat.org/scripts/source/zerotab.py.html/)

**xorg**

- [IPA Fonts](http://ipafont.ipa.go.jp/)

**zsh**

- [fasd](https://github.com/clvv/fasd)
- [keychain](https://github.com/funtoo/keychain)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
