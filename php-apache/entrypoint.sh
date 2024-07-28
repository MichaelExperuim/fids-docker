#!/bin/bash

# Run the Open FIDS install script
php /var/www/html/install.php

# Resolve the database container IP dynamically and update /etc/hosts
DB_IP=$(getent hosts db | awk '{ print $1 }')
echo "$DB_IP db" >> /etc/hosts

# Start Apache in the foreground
apache2-foreground 

# enable ssh to restart on boot and start ssh
systemctl enable ssh 
service ssh restart

#echo "172.16.245.32 db" >> /etc/hosts
tail -f /dev/null

