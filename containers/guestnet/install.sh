#!/bin/sh
hostname guestnet

until host -W1 deb.debian.org > /dev/null; do
  echo "retrying in 5s"
   sleep 5
done

apt-get update
apt-get upgrade -y

echo 1 > /proc/sys/net/ipv4/ip_forward
