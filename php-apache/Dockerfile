# Use PHP 7.4 with Apache
FROM php:7.4-apache

# Install mysqli for MySQL support
RUN docker-php-ext-install mysqli

# Enable Apache mod_rewrite for URL rewrites
RUN a2enmod rewrite

# Copy Open FIDS files into the Apache document root
COPY openfids/fidsversion1.2/ /var/www/html/

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint script to run on container startup
ENTRYPOINT ["/entrypoint.sh"]

# Expose port 80 (for internal container use)
EXPOSE 80

# Set custom ServerName
RUN echo "ServerName fids-terminus" >> /etc/apache2/apache2.conf
