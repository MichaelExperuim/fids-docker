# Use PHP 7.4 with Apache
FROM php:7.4-apache

# Install mysqli for MySQL support
RUN docker-php-ext-install mysqli

# Enable Apache mod_rewrite for URL rewrites
RUN a2enmod rewrite

# Install OpenSSH server
RUN apt-get update && apt-get install -y openssh-server sudo

# Create a directory for SSH
RUN mkdir /var/run/sshd

# Create a flight_manager user with a password
RUN useradd -m fids_developer && echo "fids_developer:itsaplane" | chpasswd

# Allow fids_developer to use sudo without a password
RUN echo "fids_developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Enable password authentication for SSH
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

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

# Expose port 22 for SSH
#EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]

# Set custom ServerName
RUN echo "ServerName fids-terminus" >> /etc/apache2/apache2.conf
