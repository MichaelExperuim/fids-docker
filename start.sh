#!/bin/bash

app="ctf-6"

# Function to kill processes using a specific port
kill_process_using_port() {
    port=$1
    pid=$(lsof -ti tcp:${port})
    if [ ! -z "$pid" ]; then
        echo "Killing process using port ${port} (PID: ${pid})"
        kill -9 $pid
    fi
}

# Kill any process using port 3306 and 8080
kill_process_using_port 3306
kill_process_using_port 8080

# create network (internal)
docker network inspect ${app}.network-internal >/dev/null 2>&1 || \
docker network create -d bridge \
                      --subnet 172.16.245.0/24 \
                      --internal \
                      ${app}.network-internal

# create network (external) 
docker network inspect ${app}.network-external >/dev/null 2>&1 || \
docker network create -d bridge \
                      --subnet 172.16.248.0/24 \
                      ${app}.network-external

docker rm -f ${app}.db ${app}.app ${app}.kali 2>/dev/null || true

# build php-apache app image from the php-apache subdirectory
docker build -t ${app}.app -f php-apache/Dockerfile ./php-apache

# run php-apache app container
docker run -d \
           --publish 8080:80/tcp \
           --name=${app}.app \
           --network="${app}.network-external" \
           --ip="172.16.248.12" \
           --restart=always \
           --hostname="openfids" \
           ${app}.app:latest

# build db image from the mysql subdirectory
docker build -t ${app}.db -f mysql/Dockerfile ./mysql 

# run db container
docker run -d \
           --publish 3306:3306/tcp \
           --name=${app}.db \
           --restart=always \
           --network="${app}.network-internal" \
           --ip=172.16.245.32 \
           --hostname="db" \
           -e MYSQL_ROOT_PASSWORD=rootpassword \
           -e MYSQL_DATABASE=fids \
           -e MYSQL_USER=openfids \
           -e MYSQL_PASSWORD=Lt69lzYJNoLCPH5s \
           ${app}.db:latest

# connect app to internal network
docker network connect ${app}.network-internal ${app}.app --ip="172.16.245.12"

# add db entry to /etc/hosts in app container
docker exec ${app}.app sh -c "echo '172.16.245.32 db' >> /etc/hosts"

# build kali linux from the kali subdirectory
docker build -t ${app}.kali -f kali/Dockerfile ./kali

# run kali linux container
docker run -td \
           --privileged \
           --name=${app}.kali \
           --restart=always \
           --network="${app}.network-external" \
           --ip="172.16.248.13" \
           --hostname="kali" \
           ${app}.kali:latest 
