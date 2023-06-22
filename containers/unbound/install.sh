#!/bin/sh
hostname unbound

# Use google dns to bootstrap
echo 'nameserver 8.8.8.8' > /etc/resolv.conf
echo 'nameserver 8.8.4.4' >> /etc/resolv.conf

apt-get update
apt-get upgrade -y

apt-get install -y curl unbound
systemctl stop unbound
rm -fr /etc/unbound/unbound.conf.d/
ln -s /opt/routainer/unbound.conf.d/ /etc/unbound/
cp /opt/routainer/roothints.* /usr/lib/systemd/system/
systemctl daemon-reload
systemctl enable roothints.timer
curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.cache
unbound-control-setup
systemctl start unbound
echo "nameserver 127.0.0.1" > /etc/resolv.conf
