#!/bin/bash

# Check for root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi

config() {
    # Check if BIND9 is installed
    if ! dpkg -l | grep -q bind9; then
        apt-get update 
        apt-get install -y bind9 nano 
    fi

    # Create directory for zone files if it doesn't exist
    mkdir -p /etc/bind/jarkom/

    # Create a zone configuration
    cat <<EOL > /etc/bind/named.conf.local
zone "airdrop.it26.com" {
    type master;
    notify yes;
    also-notify { 192.246.3.3; }; 
    allow-transfer { 192.246.3.3; };
    file "/etc/bind/jarkom/airdrop.it26.com";
};

zone "redzone.it26.com" {
    type master;
    notify yes;
    also-notify { 192.246.3.3; }; 
    allow-transfer { 192.246.3.3; };
    file "/etc/bind/jarkom/redzone.it26.com";
};

zone "loot.it26.com" {
    type master;
    notify yes;
    also-notify { 192.246.3.3; }; 
    allow-transfer { 192.246.3.3; };
    file "/etc/bind/jarkom/loot.it26.com";
};

zone "mylta.it26.com" {
    type master;
    notify yes;
    also-notify { 192.246.3.3; }; 
    allow-transfer { 192.246.3.3; };
    file "/etc/bind/jarkom/mylta.it26.com";
};

zone "tamat.it26.com" {
    type master;
    notify yes;
    also-notify { 192.246.3.3; }; 
    allow-transfer { 192.246.3.3; };
    file "/etc/bind/jarkom/tamat.it26.com";
};
EOL

    # Copy db.local to new files
    cp /etc/bind/db.local /etc/bind/jarkom/airdrop.it26.com
    cp /etc/bind/db.local /etc/bind/jarkom/redzone.it26.com
    cp /etc/bind/db.local /etc/bind/jarkom/loot.it26.com
    # cp /etc/bind/db.local /etc/bind/jarkom/medkit.airdrop.it26.com
    # cp /etc/bind/db.local /etc/bind/jarkom/siren.redzone.it26.com
    # cp /etc/bind/db.local /etc/bind/jarkom/log.siren.redzone.it26.com
    cp /etc/bind/db.local /etc/bind/jarkom/mylta.it26.com
    cp /etc/bind/db.local /etc/bind/jarkom/tamat.it26.com

    # Configure each domain
    config() {
echo <<EOL > /etc/bind/jarkom/airdrop.it26.com
\$TTL 604800
@ IN SOA airdrop.it26.com. root.airdrop.it26.com. (
    $(date +"%Y%m%d%H") ; Serial
    604800 ; Refresh
    86400 ; Retry
    2419200 ; Expire
    604800 ); Negative Cache TTL
@ IN NS airdrop.it26.com.
@ IN A 192.246.4.3
www IN CNAME airdrop.it26.com.
EOL

echo <<EOL > /etc/bind/jarkom/redzone.it26.com
\$TTL 604800
@ IN SOA redzone.it26.com. root.redzone.it26.com. (
    $(date +"%Y%m%d%H") ; Serial
    604800 ; Refresh
    86400 ; Retry
    2419200 ; Expire
    604800 ); Negative Cache TTL
@ IN NS redzone.it26.com.
@ IN A 192.246.4.2
www IN CNAME redzone.it26.com.
EOL

echo <<EOL > /etc/bind/jarkom/loot.it26.com
\$TTL 604800
@ IN SOA loot.it26.com. root.loot.it26.com. (
    $(date +"%Y%m%d%H") ; Serial
    604800 ; Refresh
    86400 ; Retry
    2419200 ; Expire
    604800 ); Negative Cache TTL
@ IN NS loot.it26.com.
@ IN A 192.246.4.5
www IN CNAME loot.it26.com.
EOL

# echo <<EOL > /etc/bind/jarkom/medkit.airdrop.it26.com
# \$TTL 604800
# @ IN SOA medkit.airdrop.it26.com. root.medkit.airdrop.it26.com. (
#     $(date +"%Y%m%d%H") ; Serial
#     604800 ; Refresh
#     86400 ; Retry
#     2419200 ; Expire
#     604800 ); Negative Cache TTL
# @ IN NS medkit.airdrop.it26.com.
# @ IN A 192.246.3.3
# www IN CNAME medkit.airdrop.it26.com.
# EOL

# echo <<EOL > /etc/bind/jarkom/siren.redzone.it26.com
# \$TTL 604800
# @ IN SOA siren.redzone.it26.com. root.siren.redzone.it26.com. (
#     $(date +"%Y%m%d%H") ; Serial
#     604800 ; Refresh
#     86400 ; Retry
#     2419200 ; Expire
#     604800 ); Negative Cache TTL
# @ IN NS siren.redzone.it26.com.
# @ IN A 192.246.3.3
# www IN CNAME siren.redzone.it26.com.
# EOL

echo <<EOL > /etc/bind/jarkom/mylta.it26.com
\$TTL 604800
@ IN SOA mylta.it26.com. root.mylta.it26.com. (
    $(date +"%Y%m%d%H") ; Serial
    604800 ; Refresh
    86400 ; Retry
    2419200 ; Expire
    604800 ); Negative Cache TTL
@ IN NS mylta.it26.com.
@ IN A 192.246.3.3
www IN CNAME mylta.it26.com.
EOL

echo <<EOL > /etc/bind/jarkom/tamat.it26.com
\$TTL 604800
@ IN SOA tamat.it26.com. root.tamat.it26.com. (
    $(date +"%Y%m%d%H") ; Serial
    604800 ; Refresh
    86400 ; Retry
    2419200 ; Expire
    604800 ); Negative Cache TTL
@ IN NS tamat.it26.com.
@ IN A 192.246.3.3
www IN CNAME tamat.it26.com.
EOL
}
    # Restart BIND to apply changes
    service bind9 restart
}

# Call the function to execute the configuration
config
