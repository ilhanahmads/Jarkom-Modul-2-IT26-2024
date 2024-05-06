#!/bin/bash

# Tambahkan keperluan untuk menjadi slave georgopol
echo '
zone "airdrop.it26.com" {
    type slave;
    masters { 192.246.1.2; }; // IP Pochinki
    file "/var/lib/bind/airdrop.it26.com";
};

zone "redzone.it26.com" {
    type slave;
    masters { 192.246.1.2; }; // IP Pochinki
    file "/var/lib/bind/redzone.it26.com";
};

zone "loot.it26.com" {
    type slave;
    masters { 192.246.1.2; }; // IP Pochinki
    file "/var/lib/bind/loot.it26.com";
};' > /etc/bind/named.conf.local

service bind9 restart