#!/bin/bash

# Create the user and grant privileges
mysql -uroot -p"" -e "
GRANT ALL PRIVILEGES ON *.* TO 'openfids'@'%' IDENTIFIED BY 'Lt69lzYJNoLCPH5s';
FLUSH PRIVILEGES;
CREATE DATABASE fids;"

# Keep the container running
tail -f /dev/null


