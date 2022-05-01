#!/usr/bin/sh

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main -c $(dirname $0)/config.ini &
echo "polybar para monitor principal configurado..."
if [[ $(xrandr -q | grep 'HDMI-0 connected') ]]; then
echo "Intentando configurar polybar para segundo monitor..."
polybar external -c $(dirname $0)/config.ini &
echo "polybar para segundo monitor configurado..."
fi
echo "SE TERMINO POLYBAR"
