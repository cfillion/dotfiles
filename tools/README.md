# Collection of Custom Scripts

## dscreen

Take, share and manage screenshots.

	$ pacaur -S dmenu feh imgur libnotify scrot

- [dmenu](http://tools.suckless.org/dmenu/)
- [feh](http://feh.finalrewind.org/)
- [imgur](http://imgur.com/tools/imgurbash.sh)
- [libnotify](https://developer.gnome.org/notification-spec/)
- [scrot](http://scrot.sourcearchive.com/)

## image

Opens all images from a directory in feh, correctly sorted.

	$ pacaur -S feh

- [feh](http://feh.finalrewind.org/)

## music

Random playlist generator and player.

	$ pacaur -S jshon mpv

- [jshon](http://kmkeen.com/jshon/)
- [mpv](http://mpv.io/)

## screenlayout

Selects the current screen layout.

	$ pacaur -S dmenu

- [dmenu](http://tools.suckless.org/dmenu/)

## temp

Execute a command with a temporary symlink to a path containing special characters.
`{}` is replaced by the proxy file.

Example:

	$ temp '[Underwater] Another 11 - Makeup -Tragedy- (TV 720p) [AB93429E].mkv' ffmpeg -i {} -c:a copy -vf subtitles={} ~/destination.mp4

## umount-menu

Selects and unmounts a device.

	$ pacaur -S dmenu libnotify

- [dmenu](http://tools.suckless.org/dmenu/)
- [libnotify](https://developer.gnome.org/notification-spec/)