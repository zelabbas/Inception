#!/bin/bash

# Start MariaDB service
service mysql start

# Update MariaDB to listen on all IP addresses (not just localhost)
sed -i 's/bind-address\s*=.*127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# Create Database if Not Exists
mysql -u root -p'1234' -e "CREATE DATABASE IF NOT EXISTS wordpress_db;"







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