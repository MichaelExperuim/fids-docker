#!/bin/bash

# Wait for the MySQL server to start
echo "Waiting for MySQL server to start..."
while ! mysqladmin ping -h"localhost" --silent; do
    sleep 1
done

OPENFIDS_IP=$(getent hosts openfids | awk '{ print $1 }')
echo "$OPENFIDS_IP openfids" >> /etc/hosts

# Create the user and grant privileges
mysql -uroot -p"rootpassword" -e "
CREATE USER 'openfids'@'%' IDENTIFIED BY 'Lt69lzYJNoLCPH5s';
GRANT ALL PRIVILEGES ON fids.* TO 'openfids'@'%';
FLUSH PRIVILEGES;"
