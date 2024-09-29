#!/bin/bash

# Debugging output for environment variables
echo "MYSQL_ROOTPASSWORD: $MYSQL_ROOTPASSWORD"
echo "MYSQL_DATABASE: $MYSQL_DATABASE"
echo "MYSQL_USER: $MYSQL_USER"
echo "MYSQL_PASSWORD: $MYSQL_PASSWORD"
# Debugging output for environment variables

# Starting the MariaDB service
service mariadb start;

# Wait for MariaDB to fully start
sleep 10

echo "Start creating the databases..."

# Create the database if it doesn't exist
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

echo "Finish creating the database."

# Create the user if it doesn't exist
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# Grant all privileges on the created database to the user
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"

# set the password for the root user of the MariaDB/MySQL server
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOTPASSWORD}';"

# Reload the grant tables to update its internal data structures with the current contents
mysql -u root -p$MYSQL_ROOTPASSWORD -e "FLUSH PRIVILEGES;"

# This shutdown happens to prevent MariaDB from continuing to run in the background unnecessarily during the setup phase.
mysqladmin -u root -p$MYSQL_ROOTPASSWORD shutdown

echo "Database setup completed successfully! ✅"
# Start MariaDB daemon in the foreground to keep the container running
exec mysqld_safe
