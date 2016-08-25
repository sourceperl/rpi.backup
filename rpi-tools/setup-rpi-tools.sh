#!/bin/bash

SCRIPT_ABS_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# install packages
apt-get install -y gddrescue

# rpi-img-maker
cp $SCRIPT_ABS_PATH/rpi-img-maker /usr/local/sbin/
chmod +x /usr/local/sbin/rpi-img-maker

# rpi-img-writer
cp $SCRIPT_ABS_PATH/rpi-img-writer /usr/local/sbin/
chmod +x /usr/local/sbin/rpi-img-writer
