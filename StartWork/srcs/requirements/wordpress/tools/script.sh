
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

wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$HOST --allow-root
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=$WP_U_ROLE --allow-root

# Start PHP-FPM in the foreground
php-fpm8.2 -F

# -F: This flag tells PHP-FPM to run in the foreground. By default, 
# PHP-FPM runs as a daemon in the background, but in a Docker container,
# you usually want to keep it running in the foreground so that the container doesn't exit immediately after starting.