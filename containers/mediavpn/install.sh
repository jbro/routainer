#!/bin/sh
hostname mediavpn

until host -W1 deb.debian.org > /dev/null; do
  echo "retrying in 5s"
   sleep 5
done

apt-get update
apt-get upgrade -y

apt-get install -y openvpn openvpn-systemd-resolved git golang

export GOPATH=/opt/go
go get -v github.com/jbro/vpnswitch

rmdir /etc/openvpn/client
ln -sf /opt/vpn-configs /etc/openvpn/client

mkdir /etc/systemd/system/openvpn-client@.service.d
cp /opt/routainer/override.conf /etc/systemd/system/openvpn-client@.service.d/

iptables -A FORWARD -s 192.168.201.1 -j ACCEPT
iptables -A FORWARD -o tun0 -j ACCEPT
iptables -A FORWARD -i tun0 -j ACCEPT
iptables -A FORWARD -j DROP
echo 1 > /proc/sys/net/ipv4/ip_forward

systemctl start openvpn-client@my_expressvpn_usa_-_new_york_udp
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
