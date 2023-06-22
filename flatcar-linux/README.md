# Installing to an apu2c4

## Prerequisite

The apu must have Internet access on any of its interfaces configured with
DHCP.

## Installation

Boot the apu using iPXE to the console and execute

    dhcp
    chain https://raw.githubusercontent.com/jbro/routainer/master/flatcar-linux/install.ipxe

If your ipxe doesn't support ssl, then copy paste the contents for the
ipxe script into the ipxe console using the hint below.

*hint* if you want to copy paste the above try something like:

     sleep 2; sudo ydotool type "$(wl-paste)"

to use ydotool to type the contents of the clipboard into the current
window.

If the routainer git repo is not checked out on sdb, then use the toolbox to do
so now.
