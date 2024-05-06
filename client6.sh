#!/bin/bash

# Set nameserver kembali ke Ip Erangel
echo 'nameserver 192.168.122.1' > /etc/resolv.conf

# Install package dnsutils
apt-get update
apt-get install dnsutils -y

# Kembalikan nameserver ke Ip Pochinki & Georgopol
echo '
nameserver 192.246.1.2
nameserver 192.246.3.3' > /etc/resolv.conf