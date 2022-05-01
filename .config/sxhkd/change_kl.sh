#! /bin/sh

CURRENT_LAYOUT=$(setxkbmap -query|awk -F : 'NR==3{print $2}'|sed 's/ //g')

if [ "$CURRENT_LAYOUT" = "us" ]; then
    setxkbmap -layout latam -variant deadtilde &
else
    setxkbmap -layout us -variant altgr-intl &
fi
