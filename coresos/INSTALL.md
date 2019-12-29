# Installing Container Linux to an apu2c4

## Prerequisite

The apu must have Internet access on anyone of its interfaces configures with
dhcp.

## Installation

Boot the apu using iPXE to the console and execute

    dhcp
    kernel http://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz initrd=coreos_production_pxe_image.cpio.gz console=ttyS0,115200 coreos.autologin=ttyS0
    initrd http://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz
    boot

The long commands can be entered with `xdotool`

    export windowid=<windowid>
    sleep 2; xdotool type --clearmodifiers --delay 50 --window $windowid 'kernel http://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz initrd=coreos_production_pxe_image.cpio.gz console=ttyS0,115200 coreos.autologin=ttyS0'
    sleep 2; xdotool type --delay 50 --window $windowid 'initrd http://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz'

The `windowid` the terminal which is connected via the apu's serial line can be
found using `xwinfo`, and that window must be kept in focus while `xdotool` is
doing its job.

When the Container Linux image is booted, you need to use wget to get the
`routainer.json` file from this folder, on to the image.

It is build from `routainer.ign` by doing:

   ct -in-file routainer.ign -strict -pretty > routainer.json

To install Container Linux to disc do:

    sudo coresos-install -d /dev/sda -i routainer.json
