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
   yum install -y --nogpgcheck procps-ng  iputils && \
   yum-config-manager --enable mysql-tools-community

# Copy init script
COPY init-db.sh /init-db.sh

# Low memory config file
COPY low-memory-my.cnf /etc/mysql/my.cnf

# Update mysql configuration to allow remote connections
COPY mysql.cnf /etc/mysql/conf.d/

# Make the script executable
RUN chmod +x /init-db.sh

# Copy init script
#COPY start.sh /start.sh

# Make the script executable
#RUN chmod +x /start.sh

# Set the entrypoint script to run on container startup
ENTRYPOINT ["/init-db.sh"]

# Expose MySQL port
EXPOSE 3306

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
#CMD ["mysqld"]




