#!/bin/sh
hostname router

apt-get update
apt-get upgrade -y

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o enp1s0 -j MASQUERADE
ip route add 192.168.200.0/24 via 192.168.100.200
ip route add 192.168.202.0/24 via 192.168.100.202
