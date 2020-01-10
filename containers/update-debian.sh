#!/bin/sh
INCLUDE="systemd-container,kitty-terminfo,vim,bash-completion,dnsutils"
DATE=$(date +%Y%m%d%H%M%S)
IMAGEPATH="/media/root/var/lib/machines/debian-$DATE"

debootstrap --include="$INCLUDE" stable "$IMAGEPATH"

cp "/media/root/data/routainer/containers/routainer-install.service" "$IMAGEPATH/usr/lib/systemd/system/"
chroot "$IMAGEPATH" systemctl enable routainer-install.service

chroot "$IMAGEPATH" systemctl disable ifupdown-pre.service
chroot "$IMAGEPATH" systemctl disable networking.service
chroot "$IMAGEPATH" systemctl enable systemd-networkd.service
