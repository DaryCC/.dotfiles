#!/bin/sh
# bspc wm -r
#CONFIGURACIÓN DE TECLADO
setxkbmap -layout latam -variant deadtilde &

if [[ $(xrandr -q | grep 'HDMI-0 connected') ]]; then
xrandr --output eDP-1-1 --primary --mode 1920x1080 --rotate normal --output HDMI-0 --mode 2560x1080 --rotate normal --right-of eDP-1-1
bspc monitor eDP-1-1 -d 1 2 3 4
bspc monitor HDMI-0  -d 5 6 7 8
# elif
#     bspc monitor eDP-1-1 -d 1 2 3 4 5 6 8
fi

echo "Configuracion para monitor externo aplicada..."

