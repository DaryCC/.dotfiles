#!/bin/sh
# run "xrandr --output eDP-1-1 --primary --mode 1920x1080 --rotate normal --output HDMI-0 --mode 2560x1080 --rotate normal --right-of eDP-1-1"
xrandr --output eDP-1-1 --primary --mode 1920x1080 --rotate normal --output HDMI-0 --mode 2560x1080 --rotate normal --right-of eDP-1-1
# bspc wm -r
