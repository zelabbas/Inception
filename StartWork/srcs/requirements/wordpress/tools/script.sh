#!/bin/bash

# # Download WP-CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

# sleep to wait mariadb 
sleep 10

# download the wordpress core
wp core download --allow-root


chmod 755 /var/www/html/

# Web Server User:
# www-data is the default user and group used by web servers like NGINX and Apache. This allows the web server to access and serve files from the WordPress directory.
chown -R www-data:www-data /var/www/html/

wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$HOST --allow-root
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=$WP_U_ROLE --allow-root

# Set PHP-FPM to listen on port 9000
sed -i 's@/run/php/php8.2-fpm.sock@9000@g' /etc/php/8.2/fpm/pool.d/www.conf

# Start PHP-FPM in the foreground
php-fpm8.2 -F

# -F: This flag tells PHP-FPM to run in the foreground. By default, 
# PHP-FPM runs as a daemon in the background, but in a Docker container,
# you usually want to keep it running in the foreground so that the container doesn't exit immediately after starting.