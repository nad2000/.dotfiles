#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
# Note: replace "mybar" with the exact name of your bar section in ~/.config/polybar/config.ini
# exec polybar mybar -c ~/.config/polybar/config.ini
exec polybar dwmbar -c ~/.config/polybar/config.ini
