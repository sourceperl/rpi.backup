#!/bin/bash

PGM=rpi-img-maker
SCRIPT_ABS_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp $SCRIPT_ABS_PATH/$PGM /usr/local/sbin/
chmod +x /usr/local/sbin/$PGM