#!/bin/sh
hostname mediavpn

apt-get update
apt-get upgrade -y

mkdir /etc/dnsmasq.d/
cp /opt/routainer/dhcp.conf /etc/dnsmasq.d/

apt-get install -y dnsmasq openvpn openvpn-systemd-resolved

rmdir /etc/openvpn/client
ln -sf /opt/vpn-configs /etc/openvpn/client

mkdir /etc/systemd/system/openvpn-client@.service.d
cp /opt/routainer/override.conf /etc/systemd/system/openvpn-client@.service.d/

systemctl start openvpn-client@my_expressvpn_usa_-_new_york_udp
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE