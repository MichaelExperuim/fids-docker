#!/bin/bash

# Kill existing mysql service
pkill mysqld
# Delete all files
rm -rf /var/lib/mysql/*
# Reinitialize database with no root password
mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql
# Run mysql service
mysqld --user=mysql --socket=/var/run/mysqld/mysqld.sock --pid-file=/var/run/mysqld/mysqld.pid &
#/usr/sbin/mysqld --initialize-insecure --user=mysql
#mysqld
#/usr/sbin/mysqld

# Wait for MySQL server to start
sleep 6
# Login as root
mysql -u root --socket=/var/run/mysqld/mysqld.sock

# Create the user and grant privileges
#mysql -uroot -e "
#GRANT ALL PRIVILEGES ON *.* TO 'openfids'@'%' IDENTIFIED BY 'Lt69lzYJNoLCPH5s';
#FLUSH PRIVILEGES;
#CREATE DATABASE fids;"

mysql -u root --socket=/var/run/mysqld/mysqld.sock -e "
GRANT ALL PRIVILEGES ON *.* TO 'openfids'@'%' IDENTIFIED BY 'Lt69lzYJNoLCPH5s';
FLUSH PRIVILEGES;
CREATE DATABASE fids;"

# Keep the container running
tail -f /dev/null


