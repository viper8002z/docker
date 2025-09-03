#!/bin/sh
set -e

sed -i "s/PORT/$PORT/g" /etc/nginx/conf.d/default.conf
sed -i "s/PORT/$PORT/g" /etc/tor/torrc

tor

sleep 20

sed -i "s/ONION/$(cat /srv/onion_web_service/hostname)/g" /usr/share/nginx/html/index.html
sed -i "s/ONION/$(cat /srv/onion_web_service/hostname)/g" /etc/nginx/nginx.conf

nginx -g 'daemon off;'
