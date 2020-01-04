#!/bin/sh
hostname guestnet

apt-get update
apt-get upgrade -y

echo 1 > /proc/sys/net/ipv4/ip_forward

mkdir /etc/dnsmasq.d/
cp /opt/routainer/dhcp.conf /etc/dnsmasq.d/

apt-get install -y dnsmasq

