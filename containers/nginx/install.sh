#!/usr/bin/env bash
hostname nginx

apt-get update
apt-get upgrade -y
apt-get install unattended-upgrades apt-listchanges

apt-get install -y python3-pip nginx

pip3 install --upgrade pip
pip3 install certbot
pip3 install certbot-nginx
pip3 install certbot-plugin-gandi
pip3 install cryptography --upgrade

systemctl stop nginx
rm -fr /etc/nginx/sites-enabled/
ln -s /opt/nginx/sites-enabled /etc/nginx/
rm -fr /etc/letsencrypt/
ln -s /opt/nginx/letsencrypt /etc/
systemctl start nginx

certbot renew -q -a certbot-plugin-gandi:dns --certbot-plugin-gandi:dns-credentials /etc/letsencrypt/gandi.ini --server https://acme-v02.api.letsencrypt.org/directory

