#!/bin/bash

# SSL Configuration
echo "server {
    listen 443 ssl;
    server_name zelabbas.42.fr;

    # All files will be in this repo
    root /var/www/html;
    index index.php index.html index.htm;

    # SSL certificate paths
    ssl_certificate  /etc/nginx/ssl/certificate.crt;
    ssl_certificate_key /etc/nginx/ssl/private.key;
    ssl_protocols       TLSv1.2;

    # PHP handling through FastCGI
    location ~ \.php$ {
        try_files \$uri =404;  # Escape the dollar sign to ensure it's interpreted correctly
        fastcgi_pass wordpress:9000; # Pass the request to the FastCGI server (PHP-FPM)
        fastcgi_index index.php;     # Default file to serve for PHP requests
        include fastcgi_params;      # Standard FastCGI parameters
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name; # Full path to the PHP script
        fastcgi_param PATH_INFO \$fastcgi_path_info; # Additional path info (if any)
    }
}" > /etc/nginx/sites-enabled/default
