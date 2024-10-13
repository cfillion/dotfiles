# foot

Fast, lightweight, and minimalistic Wayland terminal emulator

https://codeberg.org/dnkl/foot

    # pacman -S beep foot

Dependencies:

- [beep](https://github.com/spkr-beep/beep)
- [Input Mono](https://input.djr.com/)
  and/or [ttf-hack](https://sourcefoundry.org/hack/)

Allow running `beep` as non-root:

    # cat /etc/udev/rules.d/20-pcspkr-beep.rules
    ACTION=="add", SUBSYSTEM=="input", ATTRS{name}=="PC Speaker", ENV{DEVNAME}!="", TAG+="uaccess"
    # udevadm control --reload && rmmod pcspkr && modprobe pcspkr
