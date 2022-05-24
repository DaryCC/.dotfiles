#!/bin/sh
#####APLICACIONES DE INICIO#####################
echo "+++++++++++++++++++++NUEVA ENTRADA++++++++++++++++++++++++++++" >> log.txt
echo "++++++++++APLICANDO WORKSPACES"
sleep 6
bspc desktop --focus ^5
firefox &
sleep 3
bspc desktop --focus ^8
spotify &
sleep 3
bspc desktop --focus ^1
google-chrome-stable  &
sleep 2
# bspc node -t "~"{floating,tiled}
bspc node -t "~"floating
sleep 1
bspc node -t "~"tiled
echo "++++++++++DONE"
#polychormaticj
#/usr/bin/lsusb
#Bus 003 Device 058: ID 046d:c539 Logitech, Inc. USB Receiver
#Bus 003 Device 004: ID 046d:c08d Logitech, Inc. G502 LIGHTSPEED Wireless Gaming Mouse
#Bus 003 Device 005: ID 1532:0257 Razer USA, Ltd Razer Huntsman Mini
#para mouse https://github.com/hipnoizz/libratbag/wiki/Running-ratbagd-As-Non-root-In-Development
if /usr/bin/lsusb | grep "046d:c539"
then
    #algo
    echo '++++++++++APLICANDO CONFIG DE MOUSE'
    ratbagd
    ratbagctl
    echo '++++++++++DONE'
fi
if /usr/bin/lsusb | grep "1532:0257"
then
    #algo
    echo '++++++++++APLICANDO CONFIG DE TECLADO'
    polychromatic-cli -e ~/.config/polychromatic/effects/RazerHuntsmanMiniPOSos.json && echo "Polychromatic-cli effects Ok" >> ./log.txt || echo "Polychromatic effect failed" >> ./log.txt
    echo '++++++++++DONE'
fi
#######this is for emacs daemon mode
emacs --daemon &&
    echo "Emacs daemon Ok" >> ./log.txt || echo "Emacs daemon FAILED" >> ./log.txt
echo ------------------------- $?
echo "++++++++++EMACS DAEMON DONE..."
sleep 3
bspc desktop --focus ^5
emacsclient -nc
echo "++++++++++ABRIENDO CLIENTE EMACS"
sleep 2
bspc desktop --focus ^5
sleep 1
dropbox &
