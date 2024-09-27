# base image: version 12 of debian
FROM    debian:bookworm

# install the mariadb-server in the container 
RUN apt-get update && apt-get install -y mariadb-server

# copy the script from local host (mariadb/tools/script.sh) to the container 
COPY ./tools/script.sh /tmp/script.sh

# such the script.sh does not have a permession to execute we should change the pemission for the script.sh in the container
RUN chmod +x /tmp/script.sh

# Run the script at container startup
ENTRYPOINT [ "/tmp/script.sh" ]

# start the mariaDB service
CMD [ "mysqld" ]