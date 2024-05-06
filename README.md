# Jarkom-Modul-2-IT26-2024
Laporan Resmi pengerjaan soal shift modul 2 Praktikum Jaringan Komputer 2024 Kelompok IT26

## Anggota Kelompok
1. Ilhan Ahmad Syafa (5027221040)
2. George David Neborre (5027221043)

## Nomor 1
Buatlah topologi sesuai dengan pembagian seperti berikut:
<a href="https://ibb.co/f0qVPgQ"><img src="https://i.ibb.co/Qmp71gX/Screenshot-2024-05-06-103724.png" alt="Screenshot-2024-05-06-103724" border="0"></a> \
Kemudian setup konfig untuk setiap node kota seperti berikut:
```
Erangel:
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 192.246.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 192.246.2.1
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 192.246.3.1
	netmask 255.255.255.0

auto eth4
iface eth4 inet static
	address 192.246.4.1
	netmask 255.255.255.0

Pochinki:
auto eth0
iface eth0 inet static
	address 192.246.1.2
	netmask 255.255.255.0
        gateway 192.246.1.1

Quarry:
auto eth0
iface eth0 inet static
	address 192.246.2.2
	netmask 255.255.255.0
	gateway 192.246.2.1

Shelter:
auto eth0
iface eth0 inet static
	address 192.246.2.3
	netmask 255.255.255.0
	gateway 192.246.2.1

Gatka:
auto eth0
iface eth0 inet static
	address 192.246.3.2
	netmask 255.255.255.0
	gateway 192.246.3.1

Georgopol:
auto eth0
iface eth0 inet static
	address 192.246.3.3
	netmask 255.255.255.0
	gateway 192.246.3.1

Severny:
auto eth0
iface eth0 inet static
	address 192.246.4.2
	netmask 255.255.255.0
	gateway 192.246.4.1

Stalber:
auto eth0
iface eth0 inet static
	address 192.246.4.3
	netmask 255.255.255.0
	gateway 192.246.4.1

Lipovka:
auto eth0
iface eth0 inet static
	address 192.246.4.4
	netmask 255.255.255.0
	gateway 192.246.4.1

Mylta:
auto eth0
iface eth0 inet static
	address 192.246.4.5
	netmask 255.255.255.0
	gateway 192.246.4.1

```
Konfig kembali Erangel:
- iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.246.0.0/16
- cat /etc/resolv.conf di Erangel dan didapatkan IP DNS 192.168.122.1
- Tambahkan command iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.246.0.0/16 pada /root/.bashrc di Erangel
- Tambahkan command “echo nameserver 192.168.122.1 > /etc/resolv.conf” pada /root/.bashrc tiap nodes kota

Pastikan seluruh nodes kota dapat melakukan ping google

## Nomor 2 - 5
- Buatlah file .sh yang berisi konfigurasi untuk node Pochinki dan Georgopol, kemudian jalankan file tersebut untuk melakukan provisioning.
- Kemudian lakukan konfigurasi pada direktori /etc/bind/jarkom/[airdrop/redzone/loot].it26.com seperti berikut:
<a href="https://ibb.co/wBbyx2d"><img src="https://i.ibb.co/sbDjMXg/config-etc-bind-jarkom-airdrop-update.png" alt="config-etc-bind-jarkom-airdrop-update" border="0"></a>
<a href="https://ibb.co/sw92RK8"><img src="https://i.ibb.co/7WtXCns/config-etc-bind-jarkom-loot.png" alt="config-etc-bind-jarkom-loot" border="0"></a>
<a href="https://ibb.co/jhwXWTz"><img src="https://i.ibb.co/0q9bFcK/config-etc-bind-jarkom-redzone-update.png" alt="config-etc-bind-jarkom-redzone-update" border="0"></a>
- tambahkan nameserver 192.246.1.2 (master Pochinki) dan nameserver 192.246.3.3 (slave Georgopol) pada direktori /etc/resolv.conf masing-masing client yaitu Gatka, Quarry, Shelter
```
nameserver 192.246.1.2
nameserver 192.246.3.3
```
- Pastikan setiap client pada Erangel dapat mengakses atau melakukan ping terhadap ketiga domain tersebut:
<a href="https://ibb.co/QQ07KZV"><img src="https://i.ibb.co/g9YbRG8/Gatka.png" alt="Gatka" border="0"></a>
<a href="https://ibb.co/9T15z9Y"><img src="https://i.ibb.co/vPTngxz/Screenshot-2024-05-06-114035.png" alt="Screenshot-2024-05-06-114035" border="0"></a>
<a href="https://ibb.co/KzhKCN4"><img src="https://i.ibb.co/Fq3HGsZ/Screenshot-2024-05-06-114104.png" alt="Screenshot-2024-05-06-114104" border="0"></a>

## Nomor 6
- Buat file .sh yang berisi konfigurasi nomor 6 untuk client node yaitu Gatka, Shelter dan Quarry. Kemudian jalankan file tersebut untuk melakukan provisioning (install dnsutils).
- Buat file .sh yang berisi konfigurasi nomor 6 untuk master node yaitu Pochinki. Kemudian jalankan file tersebut untuk melakukan provisioning (reverse DNS/record PTR)
- Jika sudah, jalankan command `host -t PTR 192.246.4.2 (IP Severny)`. Maka outputnya akan menjadi seperti berikut:
<a href="https://ibb.co/Nm8Mq8v"><img src="https://i.ibb.co/VQ7sG71/Screenshot-2024-05-06-120343.png" alt="Screenshot-2024-05-06-120343" border="0"></a>
<a href="https://imgbb.com/"><img src="https://i.ibb.co/1dbvzv0/Screenshot-2024-05-06-120452.png" alt="Screenshot-2024-05-06-120452" border="0"></a>
<a href="https://imgbb.com/"><img src="https://i.ibb.co/5cbK044/Screenshot-2024-05-06-120520.png" alt="Screenshot-2024-05-06-120520" border="0"></a>

## Nomor 7
- buat file .sh pada nodes Pochinki dan Georgopol yang berisi konfigurasi untuk mendeklrasikan master dan slave seperti berikut:
```
#!/bin/bash

# Konfig Pochinki
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
```
```
#!/bin/bash

# Konfig Georgopol
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
```
- Jalankan kedua file tersebut di node masing-masing.
- Coba matikan service bind9 pada node master yaitu Pochinki
<a href="https://ibb.co/3kHfJyQ"><img src="https://i.ibb.co/CWFJr5D/Screenshot-2024-05-06-124331.png" alt="Screenshot-2024-05-06-124331" border="0"></a>
- Lalu, lakukan ping dari client nodes ke salah satu domain. Apabila masih bisa diping, maka deklarasi slave dan master berhasil dilakukan.
<a href="https://ibb.co/nLtR3L2"><img src="https://i.ibb.co/FDCnsDv/Screenshot-2024-05-06-124632.png" alt="Screenshot-2024-05-06-124632" border="0"></a>

## Nomor 8
- Jalankan command `nano /etc/bind/jarkom/airdrop.it26.com` kemudian tambahkan konfigurasi seperti berikut:
<a href="https://ibb.co/wBbyx2d"><img src="https://i.ibb.co/sbDjMXg/config-etc-bind-jarkom-airdrop-update.png" alt="config-etc-bind-jarkom-airdrop-update" border="0"></a>
- Setelah itu, cobalah ping subdomain medkit.airdrop.it26.com dari masing-masing client. Maka seharusnya subdomain tersebut akan mengarah ke alamat IP Lipovka
<a href="https://ibb.co/Fn5w6QZ"><img src="https://i.ibb.co/b7sB14w/Screenshot-2024-05-06-130007.png" alt="Screenshot-2024-05-06-130007" border="0"></a>
<a href="https://ibb.co/c8WyHdy"><img src="https://i.ibb.co/ykzN1JN/Screenshot-2024-05-06-130013.png" alt="Screenshot-2024-05-06-130013" border="0"></a>
<a href="https://ibb.co/brCW9Fw"><img src="https://i.ibb.co/4jXmr2v/Screenshot-2024-05-06-130019.png" alt="Screenshot-2024-05-06-130019" border="0"></a>

## Nomor 9
- Tambahkan konfig berikut pada direktori `/etc/bind/named.conf.local` Georgopol
<a href="https://ibb.co/d6LgFhz"><img src="https://i.ibb.co/zb7Jpk0/config-etc-bind-named-conf-local.png" alt="config-etc-bind-named-conf-local" border="0"></a>
- Tambahkan konfig berikut pada direktori `/etc/bind/jarkom/redzone.it26.com` Pochinki
<a href="https://ibb.co/wwdjVjn"><img src="https://i.ibb.co/1d0j1jC/config-etc-bind-jarkom-redzone-update.png" alt="config-etc-bind-jarkom-redzone-update" border="0"></a>
- Tambahkan konfig berikut
<a href="https://ibb.co/bzkyk15"><img src="https://i.ibb.co/86HRHMg/config-etc-bind-delegasi-redzone.png" alt="config-etc-bind-delegasi-redzone" border="0"></a>
