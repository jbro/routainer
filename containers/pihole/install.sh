#!/bin/sh
hostname pihole

apt-get update
apt-get upgrade -y

apt-get install -y curl
curl -sSL https://install.pi-hole.net | PIHOLE_SKIP_OS_CHECK=true bash /dev/stdin --unattended
