#!/bin/sh

picom -b --no-frame-pacing
udiskie &
xrdb ~/.Xresources
export $(dbus-launch)

setxkbmap -option caps:escape
exec i3
