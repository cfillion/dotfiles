#!/bin/sh
opts=(
  '-Dawt.useSystemAAFontSettings=on'
  '-Dswing.aatext=true'
  '-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
  '-Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
  '-Dsun.java2d.opengl=true'
)

export _JAVA_OPTIONS="${opts[*]}"
