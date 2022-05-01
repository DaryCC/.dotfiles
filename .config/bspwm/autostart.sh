#!/bin/sh
# run "xrandr --output eDP-1-1 --primary --mode 1920x1080 --rotate normal --output HDMI-0 --mode 2560x1080 --rotate normal --right-of eDP-1-1"
# xrandr --output eDP-1-1 --primary --mode 1920x1080 --rotate normal --output HDMI-0 --mode 2560x1080 --rotate normal --right-of eDP-1-1
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
# bspc monitor eDP-1-1 -d 1 2 3 4 5 6 8
# Terminate already running bar instances
# killall -q polybar

# # Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# # Launch polybar
# polybar main -c $(dirname $0)/config.ini &

# if [[ $(xrandr -q | grep 'HDMI1-0 connected') ]]; then
# 	polybar external -c $(dirname $0)/config.ini &
# #The dirname $0 command returns the directory where the Bash script 
# # file is saved.  We can return a relative path or an absolute path. 
# # This all depends on how the bash script is called.
# fi
# # Launch bar1 and bar2
# # polybar example &

echo "Configuracion para monitor externo aplicada..."
