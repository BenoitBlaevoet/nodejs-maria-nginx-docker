#!/bin/bash

# Start Nginx
echo 'Executing service nginx start'
service nginx start

# Start MariaDB
echo 'Executing mysqld'
mysqld

# Wait for MariaDB to be ready
# while ! mysqladmin ping -hlocalhost --silent; do
#   echo 'I am sleeping 1' &
#   sleep 1
# done

# Run the Node.js server
echo 'Executing node server.js' & 
node app/server.js