#!/bin/sh
hostname clientnet

apt-get update
apt-get upgrade -y

apt-get install -y curl
mkdir /etc/pihole
#Gw10z7G8
cp /opt/routainer/setupVars.conf /etc/pihole/setupVars.conf
curl -sSL https://install.pi-hole.net | bash /dev/stdin --unattended
pihole logging off
cp /opt/routainer/02-pihole-dhcp.conf /etc/dnsmasq.d/02-pihole-dhcp.conf
pihole restartdns
