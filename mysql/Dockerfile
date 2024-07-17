FROM mysql:5.7

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=fids
ENV MYSQL_USER=openfids
ENV MYSQL_PASSWORD=Lt69lzYJNoLCPH5s
ENV MYSQL_ROOT_HOST=%

# Install necessary tools
RUN yum-config-manager --disable mysql-tools-community && \
    yum update -y && \
    yum install -y --nogpgcheck procps-ng && \
    yum-config-manager --enable mysql-tools-community

# Copy init script
COPY init-db.sh /docker-entrypoint-initdb.d/init-db.sh

# Update mysql configuration to allow remote connections
COPY mysql.cnf /etc/mysql/conf.d/

# Make the script executable
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh

# Expose MySQL port
EXPOSE 3306

# Keep the container running
CMD ["tail", "-f", "/dev/null"]




