#!/bin/sh
hostname pihole

apt-get update
apt-get upgrade -y

apt-get install -y curl
curl -sSL https://install.pi-hole.net | bash /dev/stdin --unattended
