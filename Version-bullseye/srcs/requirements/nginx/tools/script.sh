#!/bin/bash

#SSL Configuration
echo "server {
    listen 443 ssl;
    server_name zelabbas.42.fr;

    # All files will be in this repo
    root /var/www/html;
    index index.php index.html;

    # SSL certificate paths
    ssl_certificate  $_CERT;
    ssl_certificate_key $_KEY;
    ssl_protocols       TLSv1.3;
    include /etc/nginx/mime.types;
" > /etc/nginx/sites-enabled/default

echo '    # PHP handling through FastCGI
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
		fastcgi_pass wordpress:9000;
    }
}' >> /etc/nginx/sites-enabled/default

nginx -t
# Start Nginx in the foreground when the container starts
exec nginx -g "daemon off;"