#!/bin/sh
hostname pihole

until host -W1 deb.debian.org > /dev/null; do
  echo "retrying in 5s"
   sleep 5
done

apt-get update
apt-get upgrade -y

apt-get install -y curl
curl -sSL https://install.pi-hole.net | bash /dev/stdin --unattended
