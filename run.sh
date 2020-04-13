#!/bin/sh

rclone sync $RCLONE_SOURCE /data $RCLONE_OPTS
#touch /data/success