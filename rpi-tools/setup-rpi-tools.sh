#!/bin/bash

# vars
NAME=$(basename "$0")
SCRIPT_ABS_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# checks
[ $EUID -ne 0 ] && { printf "ERROR: %s needs to be run by root\n" "$NAME" 1>&2; exit 1; }

# what we doing
printf "install tools to /usr/local/sbin/\n"

# rpi-img-maker
[ ! -x "$(command -v mkfs.fat)" ] && { printf "WARN: mkfs.fat not found but need by rpi-img-maker\n" 1>&2; }
[ ! -x "$(command -v mkfs.ext4)" ] && { printf "WARN: mkfs.ext4 not found but need by rpi-img-maker\n" 1>&2; }
[ ! -x "$(command -v rsync)" ] && { printf "WARN: rsync not found but need by rpi-img-maker\n" 1>&2; }
cp "$SCRIPT_ABS_PATH"/rpi-img-maker /usr/local/sbin/
chmod +x /usr/local/sbin/rpi-img-maker

# rpi-remote-img-maker
cp "$SCRIPT_ABS_PATH"/rpi-remote-img-maker /usr/local/sbin/
chmod +x /usr/local/sbin/rpi-remote-img-maker

# rpi-img-writer
[ ! -x "$(command -v pv)" ] && { printf "WARN: pv not found but need by rpi-img-write\n" 1>&2; }
cp "$SCRIPT_ABS_PATH"/rpi-img-writer /usr/local/sbin/
chmod +x /usr/local/sbin/rpi-img-writer
