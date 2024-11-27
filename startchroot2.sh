#!/bin/bash

# Kill all old prcoesses
killall -9 termux-x11 Xwayland pulseaudio virgl_test_server_android termux-wake-lock
am broadcast -a com.termux.x11.ACTION_STOP -p com.termux.x11
pkill -f com.termux.x11

## Start Termux X11
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity

sudo busybox mount --bind $PREFIX/tmp /data/local/tmp/chrootubuntu/tmp

XDG_RUNTIME_DIR=${TMPDIR} termux-x11 :0 -ac &

sleep 3

# Start Pulse Audio of Termux
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1

# Start virgl server
virgl_test_server_android &

# Execute chroot Ubuntu script
su -c "sh /data/local/tmp/startu2.sh"
