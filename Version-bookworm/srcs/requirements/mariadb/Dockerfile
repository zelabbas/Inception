# base image: version 12 of debian
FROM    debian:bookworm

# install the mariadb-server in the container 
RUN apt update && apt upgrade && apt install -y mariadb-server

# add these configurations to /etc/mysql/mariadb.conf.d/50-server.cnf to ensure that your MariaDB server is set up correctly
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# copy the script from local host (mariadb/tools/script.sh) to the container 
COPY ./tools/script.sh /tmp/script.sh

# such the script.sh does not have a permession to execute we should change the pemission for the script.sh in the container
RUN chmod +x /tmp/script.sh

# Run the script at container startup
ENTRYPOINT [ "/tmp/script.sh" ]