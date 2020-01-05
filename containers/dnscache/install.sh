#!/bin/sh
hostname dnscache

apt-get update
apt-get upgrade -y

apt-get install -y dnsmasq
cp /opt/routainer/dnscache.conf /etc/dnsmasq.d/
systemctl restart dnsmasq
