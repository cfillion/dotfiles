# Alsa-to-Jack bridge

Post-installation instructions:

1) Setup the `snd-aloop` kernel module

    # modprobe snd-aloop
    # echo snd-aloop > /etc/modules-load.d/snd-aloop.conf
    # cat > /etc/modprobe.d/snd-aloop.conf
    alias snd-card-0 snd-aloop
    alias snd-card-1 snd-hdsp
    alias snd-card-2 snd-hda-intel

    options snd-aloop index=0 pcm_substreams=2
    options snd-hda-intel index=1
