# rpi.backup

A usefull set of tools for backup a Raspberry (locally or remotely).


## Rsync

### Remote copy of Raspberry partitions 1 and 2 on a running Pi


    # boot file system (rpi /boot/) for partition 1
    sudo rsync -axv --rsync-path='sudo rsync' pi@RPI_IP:/boot/ /local/path/boot/

    # root file system (rpi /) for partition 2
    sudo rsync -axv --rsync-path='sudo rsync' pi@RPI_IP:/ /local/path/root_fs/

In some case, like backup of databases files, it's should be better to make a 
snapshot of filesystem before remote copy. The default Raspbian root filesystem 
ext4 don't allow snapshot but btrfs can do that.

## Tool rpi-img-maker

This script auto-build an image file for Raspberry Pi SD card
- build standard 2 partitions cards: fat16/ext4 or fat16/btrfs
- usage of btrfs for linux root filesytem need custom kernel

See: https://www.raspberrypi.org/documentation/linux/kernel/building.md for 
instructions on custom kernel building and see "Custom kernel" below.

### Setup

    # on Debian like Linux distribution
    sudo ./image-maker/setup-maker.sh

### Usage

from a remote builder :

    # build image for easy restore
    sudo rpi-img-maker /local/path/boot/ /local/path/root_fs/ myrpi-20160823.img

locally on a Raspberry :

    # build image for easy restore
    sudo rpi-img-maker /boot/ / /path/to/usb-key/myrpi-20160823.img

## Custom Pi kernel

When a custom kernel is in use on a Pi, some packages should be hold to avoid 
kernel overwrite.

    # stop packages update
    sudo apt-mark hold raspberrypi-bootloader
    sudo apt-mark hold raspberrypi-kernel

    # check
    sudo dpkg --get-selections | grep raspberrypi
