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

chmod -R 775 /var/www/html/wp-content

# Web Server User:
# www-data is the default user and group used by web servers like NGINX and Apache. This allows the web server to access and serve files from the WordPress directory.
chown -R www-data:www-data /var/www/html/

wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$HOST --allow-root
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=$WP_U_ROLE --allow-root

# Set PHP-FPM to listen on port 9000
sed -i 's@/run/php/php8.2-fpm.sock@9000@g' /etc/php/8.2/fpm/pool.d/www.conf

# # Install and activate Redis Object Cache plugin
wp plugin install redis-cache --activate --allow-root

sleep 10

# Configure wp-config.php for Redis
# set Hostname of redis container
wp config set WP_REDIS_HOST 'redis' --allow-root

# This constant controls whether caching is enabled in WordPress or not.
wp config set WP_CACHE 'true' --allow-root

# set The Port of Redis, This command is also assuming that Redis is running and listen on port 6379
wp config set WP_REDIS_PORT '6379' --allow-root

# # Enable Redis Cache
wp redis enable --allow-root

# Start PHP-FPM in the foreground
php-fpm8.2 -F

# -F: This flag tells PHP-FPM to run in the foreground. By default, 
# PHP-FPM runs as a daemon in the background, but in a Docker container,
# you usually want to keep it running in the foreground so that the container doesn't exit immediately after starting.