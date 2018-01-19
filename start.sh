#!/bin/bash -ex

if [[ ! -d /cache/cc ]]; then
    mkdir -p /cache/cc 
fi

sed -i "s/<<CACHE_SIZE_MB>>/$CACHE_SIZE_MB/g" /etc/squid.conf
sed -i "s/<<REGISTRY_IP>>/$TARGET_REGISTRY_IP/g" /etc/squid.conf
sed -i "s/<<REGISTRY_PORT>>/$TARGET_REGISTRY_PORT/g" /etc/squid.conf

chmod 777 -R /cache/cc
/usr/sbin/squid -N -z -f /etc/squid.conf

/usr/sbin/squid -NYCd 1 -f /etc/squid.conf

