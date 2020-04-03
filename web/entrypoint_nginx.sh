#!/bin/sh

mkdir /var/www/app/log
mkdir /etc/letsencrypt/live
exec "$@"