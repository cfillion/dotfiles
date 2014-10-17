# JACK Audio Connection Kit

http://jackaudio.org/

	$ pacaur -S jack2-dbus qjackctl a2jmidid

Dependencies:

- [a2jmidid](http://home.gna.org/a2jmidid/)
- [QjackCtl](http://qjackctl.sourceforge.net/)

Read more about the Alsa-to-Jack bridge:
http://alsa.opensrc.org/Jack_and_Loopback_device_as_Alsa-to-Jack_bridge

Post-installation instructions:

1. Setup the `snd-aloop` kernel module

		# modprobe snd-aloop
		# echo snd-aloop > /etc/modules-load.d/snd-aloop.conf
		# cat > /etc/modprobe.d/snd-aloop.conf
		alias snd-card-0 snd-aloop
		alias snd-card-1 snd-hdsp
		alias snd-card-2 snd-hda-intel

		options snd-aloop index=0 pcm_substreams=2
		options snd-hda-intel index=1

		$ pacaur -S a2jmidid

2. Configure QjackCtl

  1. `Setup...` > `Options`
  2. Set "Execute script after Startup" to `~/.local/bin/post-jack`
