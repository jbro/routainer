#!/bin/sh
hostname managementnet

apt-get update
apt-get upgrade -y

echo 1 > /proc/sys/net/ipv4/ip_forward
