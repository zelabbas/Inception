# Base image: Debian Bookworm (version 12)
FROM debian:bookworm

# Update the package list and install Nginx and OpenSSL
RUN apt update && apt upgrade && apt install -y nginx openssl

# Create a folder to store the certificate and key
RUN mkdir -p /etc/nginx/ssl

# Generate the certificate and private key using OpenSSL
# C:country
# L:locality
# O:organization
# CN:e common name (CN), which is typically the fully qualified domain name
# UID: user id
RUN openssl req -x509 -nodes -days 365 \
    -out /etc/nginx/ssl/certificate.crt \
    -keyout /etc/nginx/ssl/private.key \
    -subj "/C=MA/L=KHOURIBGA/O=42/CN=zelabbas.42.fr/UID=zelabbas"

# copy the script from local host (nginx/tools/script.sh) to the container 
COPY ./tools/script.sh /tmp/script.sh

#change script.sh permession to excute 
RUN chmod +x /tmp/script.sh


#RUN the script inside the container
ENTRYPOINT [ "/tmp/script.sh" ]

# Start Nginx in the foreground when the container starts
# CMD ["nginx", "-g", "daemon off;"]

# This flag tells OpenSSL not to encrypt the private key with a passphrase.
# nodes stands for "no DES (Data Encryption Standard)"