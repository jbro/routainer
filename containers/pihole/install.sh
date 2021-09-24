#!/bin/sh
hostname pihole

apt-get update
apt-get upgrade -y

apt-get install -y curl
curl -sSL https://install.pi-hole.net | bash /dev/stdin --unattended
setcap CAP_NET_BIND_SERVICE,CAP_NET_RAW,CAP_NET_ADMIN+ei /usr/bin/pihole-FTL
/usr/bin/pihole-FTL
