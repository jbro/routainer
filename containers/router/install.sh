#!/bin/sh
apt-get update
apt-get upgrade -y

apt-get install -y dnsmasq
cp /opt/routainer/linknet-dhcp.conf /etc/dnsmasq.d/
systemctl restart dnsmasq

echo 1 > /proc/sys/net/ipv4/ip_forward
/sbin/iptables -t nat -A POSTROUTING -o enp1s0 -j MASQUERADE
