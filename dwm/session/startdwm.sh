#!/bin/sh

setxkbmap us,ru -option 'grp:ctrl_space_toggle'
setxkbmap -option 'caps:escape'
systemctl --user start dunst.service
feh --bg-center ~/.dotfiles/wallpapers/vagabond.jpg
xset r rate 180 25

while true; do
  dwm 2> ~/.dwm.log
done
