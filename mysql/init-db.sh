#!/bin/bash

# Create the user and grant privileges
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" -e "
GRANT ALL PRIVILEGES ON *.* TO 'openfids'@'%' IDENTIFIED BY 'Lt69lzYJNoLCPH5s';
FLUSH PRIVILEGES;"

# Keep the container running
tail -f /dev/null


