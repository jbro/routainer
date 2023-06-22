#!/bin/sh
INCLUDE="systemd-container,kitty-terminfo,iptables,ca-certificates,dbus"
DATE=$(date +%Y%m%d%H%M%S)
RELEASE=stable
IMAGEPATH="/media/root/var/lib/machines/debian-$RELEASE-$DATE"

debootstrap --include="$INCLUDE" $RELEASE "$IMAGEPATH"

cp "/media/root/data/routainer/containers/routainer-install.service" "$IMAGEPATH/usr/lib/systemd/system/"
chroot "$IMAGEPATH" systemctl enable routainer-install.service
chroot "$IMAGEPATH" systemctl enable systemd-networkd.service
