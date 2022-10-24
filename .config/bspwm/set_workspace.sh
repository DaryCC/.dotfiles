#!/bin/sh
#####APLICACIONES DE INICIO#####################
current_time=$(date +"%Y-%m-%d %H:%M")
echo "++++++++++NUEVA ENTRADA: ${current_time}" >> ~/.dotfiles/log.txt
echo "++++++++++APLICANDO WORKSPACES"
sleep 6
bspc desktop --focus ^5
# echo "desktop --focus ^5" >> ~/.spacemacs.d/log.txt
# firefox & &&  echo "firefox started" >> ~/.spacemacs.d/log.txt || echo "firefox failed" >> ~/.spacemacs.d
if ! pgrep -x firefox >/dev/null
then
    echo "Process firefox not found, STARTING" >> ~/.dotfiles/log.txt
    firefox &
else
    echo "Process firefox found, ABORTING" >> ~/.dotfiles/log.txt
fi
sleep 5
bspc desktop --focus ^8
# echo "desktop --focus ^8" >> ~/.spacemacs.d/log.txt
# pgrep -x spotify >/dev/null && echo "Process Spotify found" >> ~/.spacemacs.d/log.txt || echo "Process spotify not found" >> ~/.spacemacs.d/log.txt
if ! pgrep -x spotify >/dev/null
   then
       sleep 2
       echo "Process spotify not found, STARTING" >> ~/.dotfiles/log.txt
       spotify &
   else
       echo "Process Spotify found ABORTING" >> ~/.dotfiles/log.txt
fi

# spotify && echo "spotify started" >> ~/.spacemacs.d/log.txt || echo "spotify failed" >> ~/.spacemacs.d
sleep 3
bspc desktop --focus ^1
# echo "desktop --focus ^1" >> ~/.spacemacs.d/log.txt
# google-chrome-stable  && echo "google-chrome-stable started" >> ~/.spacemacs.d/log.txt || echo "google-chrome-stable failed" >> ~/.spacemacs.d
if ! pgrep -x google-chrome-stable >/dev/null
then
    echo "Process google-chrome-stable not found, STARTING" >> ~/.dotfiles/log.txt
    google-chrome-stable &
else
    echo "Process google-chrome-stable found, ABORTING">> ~/.dotfiles/log.txt
fi

sleep 2
# bspc node -t "~"{floating,tiled}
# bspc node -t "~"floating
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
    echo "Logitech wireless mouse adapter detected" >> ~/.dotfiles/log.txt
    echo '++++++++++APLICANDO CONFIG DE MOUSE'
    # ratbagd && echo "ratbagd command succeeded" >> ~/.spacemacs.d/log.txt || echo "ratbagd command failed" >> ~/.spacemacs.d
    # ratbagd & >> ~/.spacemacs.d/log.txt
    # ratbagctl & >> ~/.spacemacs.d/log.txt
    ratbagd &
    ratbagctl &
    # ratbagd &
    # if $?
    # then
    #     echo "Command ratbagd succeeded" >> ~/.spacemacs.d/log.txt
    # else
    #     echo "Command ratbagd failed" >> ~/.spacemacs.d/log.txt
    # fi
    # ratbagctl &

    # if $?
    # then
    #     echo "Command ratbagctl succeeded" >> ~/.spacemacs.d/log.txt
    # else
    #     echo "Command ratbagctl failed" >> ~/.spacemacs.d/log.txt
    # fi
fi

if /usr/bin/lsusb | grep "1532:0257"
then
    echo "Razer Huntsman Mini detected" >> ~/.dotfiles/log.txt
    echo '++++++++++APLICANDO CONFIG DE TECLADO'
    # ratbagd && echo "ratbagd command succeeded" >> ~/.spacemacs.d/log.txt || echo "ratbagd command failed" >> ~/.spacemacs.d
    if polychromatic-cli -e ~/.config/polychromatic/effects/RazerHuntsmanMiniPOSos.json;
    then
        echo "polychromatic effects successfully added" >> ~/.dotfiles/log.txt
    else
        echo "polychromatic-cli effects FAILED" >> ~/.dotfiles/log.txt
    fi
fi
#######this is for emacs daemon mode
emacs --daemon &&
    echo "Emacs daemon STARTED Ok" >> ~/.dotfiles/log.txt || echo "Emacs daemon FAILED" >> ~/.dotfiles/log.txt
# echo ------------------------- $?
echo "++++++++++EMACS DAEMON DONE..."
sleep 3
bspc desktop --focus ^5
# echo "desktop --focus ^5" >> ~/.spacemacs.d/log.txt
emacsclient -nc && echo "Emacs cliente, STARTED" >> ~/.dotfiles/log.txt || echo "Emacs client FAILED" >> ~/.dotfiles/log.txt
echo "++++++++++ABRIENDO CLIENTE EMACS"
sleep 2
bspc desktop --focus ^5
# echo "desktop --focus ^5" >> ~/.spacemacs.d/log.txt
sleep 1
# dropbox && echo "dropbox STARTED Ok" >> ~/.spacemacs.d/log.txt || echo "dropbox client FAILED" >> ~/.spacemacs.d/log.txt
# if dropbox is already running?
if ! pgrep -x dropbox >/dev/null
then
    echo "Process dropbox not found, STARTING" >> ~/.dotfiles/log.txt
    dropbox
else
    echo "Process dropbox found, ABORTING" >> ~/.dotfiles/log.txt
fi
