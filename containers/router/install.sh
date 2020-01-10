#!/bin/sh
hostname router

# Start routing before we update so dnscache can bootstrap
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o enp1s0 -j MASQUERADE
ip route add 192.168.0.0/24 via 192.168.100.10    # MGMT net
ip route add 192.168.200.0/24 via 192.168.100.200 # Client net
ip route add 192.168.202.0/24 via 192.168.100.202 # Guest net

until host -W1 deb.debian.org > /dev/null; do
  echo "retrying in 5s"
   sleep 5
done

apt-get update
apt-get upgrade -y

