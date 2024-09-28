#!/bin/bash

# Debugging output for environment variables
echo "MYSQL_ROOTPASSWORD: $MYSQL_ROOTPASSWORD"
echo "MYSQL_DATABASE: $MYSQL_DATABASE"
echo "MYSQL_USER: $MYSQL_USER"
echo "MYSQL_PASSWORD: $MYSQL_PASSWORD"
# Debugging output for environment variables

# Starting the MariaDB service
service mariadb start;

echo "start CREATE THE DATA BASES"

# Create the database if it doesn't exist
mysql -u root -p"$MYSQL_ROOTPASSWORD" -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
echo "finish CREATE THE DATA BASES"
# Create the user if it doesn't exist
mysql -u root -p$MYSQL_ROOTPASSWORD -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# Grant all privileges on the created database to the user
mysql -u root -p$MYSQL_ROOTPASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"

# Reload the grant tables to update its internal data structures with the current contents
mysql -u root -p$MYSQL_ROOTPASSWORD -e "FLUSH PRIVILEGES;"

# set the password for the root user of the MariaDB/MySQL server
mysql -u root -p$MYSQL_ROOTPASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOTPASSWORD';"

# This shutdown happens to prevent MariaDB from continuing to run in the background unnecessarily during the setup phase.
mysqladmin -u root -p$MYSQL_ROOTPASSWORD shutdown

echo "done ✅"
# Start MariaDB daemon in the foreground to keep the container running
exec mysqld_safe

# The output you provided indicates that MariaDB is expecting to use the Unix socket located at /run/mysqld/mysqld.sock, but the socket file does not exist (No such file or directory). This suggests that MariaDB did not start successfully or the socket file was not created.

# Steps to resolve the issue:
# 1. Ensure the /run/mysqld directory exists:
# Run the following command to ensure that the required directory exists and has the correct permissions:
# ======> mariadb --help to show all info about mariadb 
# bash
# Copy code
# mkdir -p /run/mysqld
# chown -R mysql:mysql /run/mysqld
# This command will create the directory if it doesn't exist and ensure it is owned by the mysql user, which is necessary for MariaDB to create the socket file.