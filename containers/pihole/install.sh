#!/bin/sh
hostname pihole

apt-get update
apt-get upgrade -y

chown -R root:root /bin/su ; chmod 755 /bin/su ; chmod u+s /bin/su
apt-get install -y curl
curl -sSL https://install.pi-hole.net | bash /dev/stdin --unattended
