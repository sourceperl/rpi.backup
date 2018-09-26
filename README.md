# rpi.backup

A useful set for backup or restore a Raspberry (locally or remotely).


## Rsync

### Remote copy of Raspberry partitions 1 and 2 on a running Pi


    # boot file system (rpi /boot/) for partition 1
    sudo rsync -axv --numeric-ids --rsync-path='sudo rsync' pi@RPI_IP:/boot/ /local/path/boot/

    # root file system (rpi /) for partition 2
    sudo rsync -axv --numeric-ids --rsync-path='sudo rsync' pi@RPI_IP:/ /local/path/root_fs/

In some case, like backup of databases files, it's should be better to make a 
snapshot of filesystem before remote copy. The default Raspbian root filesystem 
ext4 don't allow snapshot but btrfs can do that.

## Rpi Tools

A set of tools to use with the Raspberry Pi for manage backup and restore.

### Setup

    # on Debian like Linux distribution
    sudo apt-get install -y dosfstools e2fsprogs pv
    sudo ./rpi-tools/setup-rpi-tools.sh

## Tool rpi-img-maker

This script auto-build an image file for Raspberry Pi SD card. Build standard 2 
partitions cards: fat16/ext4 or fat16/btrfs

Usage of btrfs for linux root filesytem need custom kernel. See: 
https://www.raspberrypi.org/documentation/linux/kernel/building.md for 
instructions on custom kernel building and see also "Custom kernel" below.

### Usage

from a remote builder :

    sudo rpi-img-maker /local/path/boot/ /local/path/root_fs/ myrpi-20160823.img

locally on a Raspberry :

    sudo rpi-img-maker /boot/ / /path/to/usb-key/myrpi-20160823.img

help :

    sudo rpi-img-maker -h

## Tool rpi-img-writer

This script write an image file (RAW with or without gzip compress) to a SD 
card. Since using directly dd can be dangerous this script add some checks like 
target device is mount ?, target is a block device ?, size matching, y/n 
confirm...

### Usage

without gzip :

    sudo rpi-img-writer myrpi-20160823.img /dev/usb-card-device

with gzip (for image with *.gz name writer use on fly gunzip):

    sudo rpi-img-writer myrpi-20160823.img.gz /dev/usb-card-device

help :

    sudo rpi-img-writer -h

# Misc

## Custom Pi kernel

When a custom kernel is in use on a Pi, some packages should be hold to avoid 
kernel overwrite.

    # stop packages update
    sudo apt-mark hold raspberrypi-bootloader
    sudo apt-mark hold raspberrypi-kernel

    # check
    sudo dpkg --get-selections | grep raspberrypi
