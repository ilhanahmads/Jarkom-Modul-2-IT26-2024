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
    mkdir -p /var/lib/bind/jarkom/

    # Create a zone configuration
    cat <<EOL > /var/lib/bind/named.conf.local
zone "airdrop.it26.com" {
    type slave;
    masters { 192.246.1.2; }; 
    file "/var/lib/bind/jarkom/airdrop.it26.com";
};

zone "redzone.it26.com" {
    type slave;
    masters { 192.246.1.2; };
    file "/var/lib/bind/jarkom/redzone.it26.com";
};

zone "loot.it26.com" {
    type slave;
    masters { 192.246.1.2; };
    file "/var/lib/bind/jarkom/loot.it26.com";
};

# zone "medkit.airdrop.it26.com" {
#     type slave;
#     masters { 192.246.1.2; };
#     file "/var/lib/bind/jarkom/medkit.airdrop.it26.com";
# };

# zone "siren.redzone.it26.com" {
#     type slave;
#     masters { 192.246.1.2; };
#     file "/var/lib/bind/jarkom/siren.redzone.it26.com";
# };

# zone "log.siren.redzone.it26.com" {
#     type slave;
#     masters { 192.246.1.2; };
#     file "/var/lib/bind/jarkom/log.siren.redzone.it26.com";
# };

zone "mylta.it26.com" {
    type slave;
    masters { 192.246.1.2; };
    file "/var/lib/bind/jarkom/mylta.it26.com";
};

zone "tamat.it26.com" {
    type slave;
    masters { 192.246.1.2; };
    file "/var/lib/bind/jarkom/tamat.it26.com";
};
EOL

#     # Copy db.local to new files
#     cp /etc/bind/db.local /etc/bind/jarkom/airdrop.it26.com
#     cp /etc/bind/db.local /etc/bind/jarkom/redzone.it26.com
#     cp /etc/bind/db.local /etc/bind/jarkom/loot.it26.com
#     cp /etc/bind/db.local /etc/bind/jarkom/medkit.airdrop.it26.com
#     cp /etc/bind/db.local /etc/bind/jarkom/siren.redzone.it26.com
#     cp /etc/bind/db.local /etc/bind/jarkom/log.siren.redzone.it26.com
#     cp /etc/bind/db.local /etc/bind/jarkom/mylta.it26.com
#     cp /etc/bind/db.local /etc/bind/jarkom/tamat.it26.com

#     # Configure each domain
#     for domain in "airdrop.it26.com" "redzone.it26.com" "loot.it26.com" "medkit.airdrop.it26.com" "siren.redzone.it26.com" "log.siren.redzone.it26.com" "mylta.it26.com" "tamat.it26.com"; do
#         cat <<EOL > "/etc/bind/jarkom/$domain"
# \$TTL 604800
# @ IN SOA $domain. root.$domain. (
#     $(date +"%Y%m%d00") ; Serial
#     604800 ; Refresh
#     86400 ; Retry
#     2419200 ; Expire
#     604800 ); Negative Cache TTL
# @ IN NS $domain.
# @ IN A 192.246.1.2
# www IN CNAME $domain.
# EOL
#     done

    # Restart BIND to apply changes
    service bind9 restart
}

# Call the function to execute the configuration
config
