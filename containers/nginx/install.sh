#!/usr/bin/env bash
hostname nginx

apt-get update
apt-get upgrade -y

apt-get install -y python-pip certbot python-certbot-nginx nginx
apt-get remove -y python-cryptography

pip install cryptography
pip install certbot-plugin-gandi

systemctl stop nginx
rm -fr /etc/nginx/sites-enabled/
ln -s /opt/nginx/sites-enabled /etc/nginx/
rm -fr /etc/letsencrypt/
ln -s /opt/nginx/letsencrypt /etc/
systemctl start nginx

