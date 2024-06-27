#!/bin/bash

# Function to wait for a service to be up
wait_for_service() {
  local host=$1
  local port=$2
  local service_name=$3
  echo "Waiting for $service_name at $host:$port..."
  while ! nc -z $host $port; do
    echo "$service_name is not up yet..."
    sleep 2
  done
  echo "$service_name is up!"
}

# Wait for the db service
wait_for_service db 3306 "MySQL Database"

# Wait for the openfids service
wait_for_service openfids 80 "OpenFIDS Application"

echo "All services are up. Starting kali..."
exec "$@"