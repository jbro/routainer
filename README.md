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

## Notes

### Things to install in the **toolbox**

    apt install bash-completion vim git tmux kitty-terminfo debootstrap

### Enable containers

At the moment containers need to be enabled by hand:

    for c in /etc/systemd/nspawn/*.nspawn; do basename $c .nspawn | xargs -n1 sudo machinectl enable; done

Also if `machines.target` is not enabled:

    systemctl list-units --type=target

Do so:

    sudo systemctl enable machines.target

Also if a container times out on start edit its override:

    sudo systemctl edit systemd-nspawn@<countainer name>

And add:

    [Service]
    TimeoutSec=600

If a container needs to start after another container add:

    [Unit]
    After=systemd-nspawn@unbound.service

