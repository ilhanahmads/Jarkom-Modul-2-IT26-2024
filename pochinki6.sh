#!/bin/bash

# Buat reverse DNS (Record PTR)
echo 'zone "2.75.10.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/2.75.10.in-addr.arpa";
};' >> /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/2.75.10.in-addr.arpa

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     redzone.it23.com. root.redzone.it23.com. (
                        2024050301      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
2.75.10.in-addr.arpa.    IN      NS      redzone.it23.com.
3                       IN      PTR     redzone.it23.com.' > /etc/bind/jarkom/2.75.10.in-addr.arpa

service bind9 restart