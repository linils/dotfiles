#!/usr/bin/env sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar left -c ~/.config/polybar/config.ini &
polybar right -c ~/.config/polybar/config.ini &

#for m in $(polybar --list-monitors | cut -d":" -f1); do
#    MONITOR=$m polybar --reload $bar -c ~/.config/polybar/config.ini &
#done
