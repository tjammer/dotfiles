#!/bin/sh
. /etc/X11/xinit/xinitrc-common
# Set a nice background.
hsetroot -solid "#88C0D0"

# screensaver
xset dpms 300 &
xss-lock slock &

# Load resources.
#xrdb -load ~/.Xresources
xsetroot -cursor_name left_ptr

# seafile
seafile-applet &

# notifications
dunst &

# compton
compton --config ~/.config/compton/compton.conf &
# bar
~/.config/polybar/launch.sh

# Start window manager in the background. If it dies, X still lives.
2bwm &

# Start a terminal in the foreground. If this dies, X dies.
exec st
