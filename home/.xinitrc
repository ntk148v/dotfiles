#!/bin/zsh

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
# set desktop background with custom effect
betterlockscreen -w dim

# Alternative (set last used background)
# source ~/.fehbg
dbus-update-activation-environment --systemd DISPLAY

exec xrdb .Xresources & i3
