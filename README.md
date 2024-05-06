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

## Nomor 2
Buatlah file .sh yang berisi konfigurasi untuk node Pochinki dan Georgopol, kemudian jalankan file tersebut untuk melakukan provisioning. Kemudian lakukan konfigurasi pada direktori /etc/bind/jarkom/[airdrop/redzone/loot].it26.com seperti berikut:
<a href="https://ibb.co/wBbyx2d"><img src="https://i.ibb.co/sbDjMXg/config-etc-bind-jarkom-airdrop-update.png" alt="config-etc-bind-jarkom-airdrop-update" border="0"></a>
<a href="https://ibb.co/sw92RK8"><img src="https://i.ibb.co/7WtXCns/config-etc-bind-jarkom-loot.png" alt="config-etc-bind-jarkom-loot" border="0"></a>
<a href="https://ibb.co/wwdjVjn"><img src="https://i.ibb.co/1d0j1jC/config-etc-bind-jarkom-redzone-update.png" alt="config-etc-bind-jarkom-redzone-update" border="0"></a>
