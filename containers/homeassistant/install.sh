#!/bin/sh
hostname homeassistant

apt-get update
apt-get upgrade -y

apt-get install -y python3 python3-dev python3-venv python3-pip libffi-dev libssl-dev libjpeg-dev zlib1g-dev autoconf build-essential libopenjp2-7 libtiff5 libturbojpeg0 tzdata

cd /srv/homeassistant
python3 -m venv .
. bin/activate
python3 -m pip install wheel
pip3 install homeassistant
systemctl link /opt/services/hass.service
systemctl enable hass.service
systemctl start hass.service

apt-get install -y mosquitto
ln -s /opt/mosquitto/default.conf /etc/mosquitto/conf.d/
ln -s /opt/mosquitto/passwd /etc/mosquitto/
systemctl restart mosquitto
