# Base image: Debian 12 (Bookworm)
FROM debian:bookworm

# Update, upgrade, and install NGINX
RUN apt update && \
    apt upgrade -y && \
    apt install -y nginx

# Delete all files 
RUN rm -rf /var/www/html/*

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default

# Copy the entire static website
COPY ./tools/ /var/www/html/

# Start NGINX in the foreground
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]