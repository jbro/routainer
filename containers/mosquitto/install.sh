#!/bin/sh
hostname mosquitto

apt-get update
apt-get upgrade -y

apt-get install -y mosquitto
ln -s /opt/mosquitto/default.conf /etc/mosquitto/conf.d/
ln -s /opt/mosquitto/passwd /etc/mosquitto/
