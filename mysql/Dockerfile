FROM mysql:5.7

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=fids
ENV MYSQL_USER=openfids
ENV MYSQL_PASSWORD=Lt69lzYJNoLCPH5s

# Copy init script
COPY init-db.sh /docker-entrypoint-initdb.d/init-db.sh

# Make the script executable
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh

# Expose MySQL port
EXPOSE 3306


