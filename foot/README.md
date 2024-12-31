# foot

Fast, lightweight, and minimalistic Wayland terminal emulator

https://codeberg.org/dnkl/foot

    # pacman -S beep foot

Dependencies:

- [beep](https://github.com/spkr-beep/beep)
- `fontconfig` directory for mapping monospace to Input Mono (w/ Hack fallback)

Allow running `beep` as non-root:

    # cat /etc/udev/rules.d/20-pcspkr-beep.rules
    ACTION=="add", SUBSYSTEM=="input", ATTRS{name}=="PC Speaker", ENV{DEVNAME}!="", TAG+="uaccess"
    # udevadm control --reload && rmmod pcspkr && modprobe pcspkr

Input Mono must be configured with 1.2x line height for uncropped rendering (eg. uppercase letters with diacritics).
