#!/bin/sh
hostname router

iptables -P INPUT DROP

iptables -A INPUT -i lo -j ACCEPT

iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT
iptables -A INPUT -p udp -j REJECT --reject-with icmp-port-unreachable
iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset
iptables -A INPUT -j REJECT --reject-with icmp-proto-unreachable

echo 'nameserver 8.8.8.8' > /etc/resolv.conf
echo 'nameserver 8.8.4.4' >> /etc/resolv.conf

apt-get update
apt-get upgrade -y

echo 'nameserver 192.168.100.50' > /etc/resolv.conf

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o enp1s0 -j MASQUERADE
ip route add 192.168.0.0/24 via 192.168.100.10    # MGMT net
ip route add 192.168.200.0/24 via 192.168.100.200 # Client net
ip route add 192.168.202.0/24 via 192.168.100.202 # Guest net

iptables -A PREROUTING -t nat -d 185.233.253.110 -p tcp --dport 80 -j DNAT --to 192.168.100.52:80
iptables -A PREROUTING -t nat -d 185.233.253.110 -p tcp --dport 443 -j DNAT --to 192.168.100.52:443

