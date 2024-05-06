#!/bin/bash

# Tambahkan kebutuhan untuk menjadi master pochinki
echo '
zone "airdrop.it26.com" {
        type master;
        notify yes;
        also-notify { 192.246.3.3; }; //IP Georgopol
        allow-transfer { 192.246.3.3; }; //IP Georgopol
        file "/etc/bind/jarkom/airdrop.it26.com";
};

zone "redzone.it26.com" {
        type master;
        notify yes;
        also-notify { 192.246.3.3; }; //IP Georgopol
        allow-transfer { 192.246.3.3; }; //IP Georgopol
        file "/etc/bind/jarkom/redzone.it26.com";
};

zone "loot.it26.com" {
        type master;
        notify yes;
        also-notify { 192.246.3.3; }; //IP Georgopol
        allow-transfer { 192.246.3.3; }; //IP Georgopol
        file "/etc/bind/jarkom/loot.it26.com";
};

zone "4.246.192.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/4.246.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

service bind9 restart