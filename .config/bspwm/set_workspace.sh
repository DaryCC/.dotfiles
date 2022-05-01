#!/bin/sh
#####APLICACIONES DE INICIO#####################

echo "Aplicando workspaces"
sleep 4
bspc desktop --focus ^5
firefox &
sleep 3
bspc desktop --focus ^8
spotify &
sleep 3
bspc desktop --focus ^1
google-chrome-stable  --disable-session-crashed-bubble &
sleep 3
bspc desktop --focus ^5
emacs &
sleep 2
bspc desktop --focus ^5
sleep 1
# bspc node -t "~"{floating,tiled}
bspc node -t "~"floating
sleep 1
bspc node -t "~"tiled
echo "Done"
#polychormaticj
#/usr/bin/lsusb
#Bus 003 Device 058: ID 046d:c539 Logitech, Inc. USB Receiver
#Bus 003 Device 004: ID 046d:c08d Logitech, Inc. G502 LIGHTSPEED Wireless Gaming Mouse
#Bus 003 Device 005: ID 1532:0257 Razer USA, Ltd Razer Huntsman Mini
#para mouse https://github.com/hipnoizz/libratbag/wiki/Running-ratbagd-As-Non-root-In-Development
if /usr/bin/lsusb | grep "046d:c539"
then
    #algo
    echo 'aplicando config de mouse'
    ratbagd
    ratbagctl
fi
if /usr/bin/lsusb | grep "1532:0257"
then
    #algo
    echo 'aplicando config de teclado'
    polychromatic-cli -e ~/.config/polychromatic/effects/RazerHuntsmanMiniPOSos.json
fi
# Desktop
#        General Syntax
#            desktop [DESKTOP_SEL] COMMANDS

#            If DESKTOP_SEL is omitted, focused is assumed.

#        COMMANDS
#            -f, --focus [DESKTOP_SEL]
#                Focus the selected or given desktop.

#            -a, --activate [DESKTOP_SEL]
#                Activate the selected or given desktop.

#            -m, --to-monitor MONITOR_SEL [--follow]
#                Send the selected desktop to the given monitor. If
#                --follow is passed, the focused desktop will stay
#                focused.

#            -s, --swap DESKTOP_SEL [--follow]
#                Swap the selected desktop with the given desktop. If
#                --follow is passed, the focused desktop will stay
#                focused.

#            -l, --layout CYCLE_DIR|monocle|tiled
#                Set or cycle the layout of the selected desktop.

#            -n, --rename <new_name>
#                Rename the selected desktop.

#            -b, --bubble CYCLE_DIR
#                Bubble the selected desktop in the given direction.

#            -r, --remove
#                Remove the selected desktop.
 # Monitor
 #       General Syntax
 #           monitor [MONITOR_SEL] COMMANDS

 #           If MONITOR_SEL is omitted, focused is assumed.

 #       Commands
 #           -f, --focus [MONITOR_SEL]
 #               Focus the selected or given monitor.

 #           -s, --swap MONITOR_SEL
 #               Swap the selected monitor with the given monitor.

 #           -a, --add-desktops <name>...
 #               Create desktops with the given names in the selected
 #               monitor.

 #           -o, --reorder-desktops <name>...
 #               Reorder the desktops of the selected monitor to match
 #               the given order.

 #           -d, --reset-desktops <name>...
 #               Rename, add or remove desktops depending on whether the
 #               number of given names is equal, superior or inferior to
 #               the number of existing desktops.

 #           -g, --rectangle WxH+X+Y
 #               Set the rectangle of the selected monitor.

 #           -n, --rename <new_name>
 #               Rename the selected monitor.

 #           -r, --remove
 #               Remove the selected monitor.

 #   Query
 #       General Syntax
 #           query COMMANDS [OPTIONS]

 #       Commands
 #           The optional selectors are references.

 #           -N, --nodes [NODE_SEL]
 #               List the IDs of the matching nodes.

 #           -D, --desktops [DESKTOP_SEL]
 #               List the IDs (or names) of the matching desktops.

 #           -M, --monitors [MONITOR_SEL]
 #               List the IDs (or names) of the matching monitors.

 #           -T, --tree
 #               Print a JSON representation of the matching item.

 #       Options
 #           -m,--monitor [MONITOR_SEL], -d,--desktop [DESKTOP_SEL], -n,
 #           --node [NODE_SEL]
 #               Constrain matches to the selected monitor, desktop or
 #               node. The descriptor can be omitted for -M, -D and -N.

 #           --names
 #               Print names instead of IDs. Can only be used with -M and
 #               -D.

 #   Wm
 #       General Syntax
 #           wm COMMANDS

 #       Commands
 #           -d, --dump-state
 #               Dump the current world state on standard output.

 #           -l, --load-state <file_path>
 #               Load a world state from the given file. The path must be
 #               absolute.

 #           -a, --add-monitor <name> WxH+X+Y
 #               Add a monitor for the given name and rectangle.

 #           -O, --reorder-monitors <name>...
 #               Reorder the list of monitors to match the given order.

 #           -o, --adopt-orphans
 #               Manage all the unmanaged windows remaining from a
 #               previous session.

 #           -h, --record-history on|off
 #               Enable or disable the recording of node focus history.

 #           -g, --get-status
 #               Print the current status information.

 #           -r, --restart
 #               Restart the window manager
