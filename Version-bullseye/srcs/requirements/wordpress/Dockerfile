# base image: version 11 of debian
FROM    debian:bullseye

RUN apt update && apt upgrade -y

# we will need to install WordPress with its download link, we need to install wget
# Wget (short for World Wide Web Get) 
RUN apt -y install wget

# php-fpm: FastCGI Process Manager
# # Install PHP 7.4, php-fpm, and php-mysql
RUN apt install -y php php-fpm php-mysql php-redis

# Create the /run/php/ directory to store session data, temporary files.
RUN mkdir -p /run/php/
# Create the /var/www/html directory
RUN mkdir -p /var/www/html

# copy the script.sh into the container
COPY ./tools/script.sh /tmp/script.sh

# Change the permission of script.sh to make it executable
RUN chmod +x /tmp/script.sh

# Run the script when the container starts
ENTRYPOINT [ "/tmp/script.sh" ]