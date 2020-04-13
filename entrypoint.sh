#!/bin/sh

echo "$CRON /run.sh" > /etc/crontab
crontab /etc/crontab
crond -f