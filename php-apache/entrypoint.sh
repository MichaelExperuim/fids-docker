#!/bin/bash

# Run the Open FIDS install script
php /var/www/html/install.php

# Start Apache in the foreground
apache2-foreground
