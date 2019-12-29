# This repo just contains a bunch of notes and files related to setting up my home router

## The idea

Use CoreOS Container Linux as the base for a home router, where the router and
helpers for each network are separated into containers, using systemd nspawn.

## The hardware

The setup consists if a [PCEngines apu2c4](https://pcengines.ch/apu2d4.htm)
powered with PoE.

## The network

The first ethernet port on the apu is used connected to the internet, the
second is connected to a "trunk" port on my switch and used as a VLAN
agregator. The third port is used for a management network and used to
ssh into the apu.
