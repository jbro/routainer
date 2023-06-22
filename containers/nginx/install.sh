#!/usr/bin/env bash
hostname nginx

apt-get update
apt-get upgrade -y
apt-get install unattended-upgrades apt-listchanges

apt-get install -y python3-pip nginx

pip3 install --break-system-packages --upgrade pip
pip3 install --break-system-packages certbot
pip3 install --break-system-packages certbot-nginx
pip3 install --break-system-packages certbot-plugin-gandi
pip3 install --break-system-packages cryptography --upgrade

systemctl stop nginx
rm -fr /etc/nginx/sites-enabled/
ln -s /opt/nginx/sites-enabled /etc/nginx/
rm -fr /etc/letsencrypt/
ln -s /opt/nginx/letsencrypt /etc/
systemctl start nginx

certbot renew -q  --authenticator dns-gandi --dns-gandi-credentials  /etc/letsencrypt/gandi.ini
