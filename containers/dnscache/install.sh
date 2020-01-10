#!/bin/sh
hostname dnscache

# Use google dns to bootstrap
echo 'nameserver 8.8.8.8' > /etc/resolv.conf
echo 'nameserver 8.8.4.4' >> /etc/resolv.conf

apt-get update
apt-get upgrade -y

apt-get install -y dnsmasq
cp /opt/routainer/dnscache.conf /etc/dnsmasq.d/
systemctl restart dnsmasq
