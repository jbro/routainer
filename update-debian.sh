#!/bin/sh
INCLUDE="systemd-container,kitty-terminfo,vim,bash-completion"
DATE=$(date +%Y%m%d%H%M%S)
debootstrap --include="$INCLUDE" stable "debian-$DATE"
