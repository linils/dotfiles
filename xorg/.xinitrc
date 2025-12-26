#!/bin/sh


setxkbmap -option caps:escape
picom -b --no-frame-pacing
udiskie &
xrdb ~/.Xresources
export $(dbus-launch)

exec i3
