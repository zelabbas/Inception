### NOTE :

```
before start: if the *trixie* new version fo debain is published so you should use version-bookworm else use version
bullseye
```

# what is Docker

    discription:
        Docker is an open source standlone application which works as an engine used to run containerized applications
        , it is insstalled on your operating system preferavbly on linux but can be also insttalled on windows and macos

# Key Components of Docker:

The following are the some of the key components of Docker:

    Docker Engine: It is a core part of docker, that handles the creation and management of containers.
    Docker Image: It is a read-only template that is used for creating containers, containing the application   code and dependencies.
    Docker Hub: It is a cloud based repository that is used for finding and sharing the container images.
    Dockerfile: It is a script that containing instructions to build a docker image.
    Docker Registry : It is a storage distribution system for docker images, where you can store the images     in both public and private modes.

# Docker Tags:

    Docker tags are refrence to docker images

# Dockerfile

<image src="./images/ArchitectureDocker.png">

    Docker can build images automatically by reading the instrucations from a Dockerfile.
    A Dockerfile is a text document that contains all the commandsa user could call on the command line to assemble an image

## What's a docker engine

Docker Engine is an open source containerization technology for building and containerizing your applications.
Docker Engine acts as a client-server application with: A server with a long-running daemon process dockerd .
APIs which specify interfaces that programs can use to talk to and instruct the Docker daemon

- Docker is an open source standalone application which works as an engine used to run containerized
- an application running in a container is isolated from the rest of the system and from other containers
- Docker application run in a container that can be used in any system

## We could say Docker is a container management service .

- the meaning of cli is: Command line interface
- the meaning of api is : application programming interface

# Virtualization vs Containerization

<image src="./images/vrtVScont.png">
<image src="./images/virtvscont.png">

# --------------Docker Architecture-----------------

<image src="./images/Dockerfile.png">

# Img

    discription :
    	imge is a read-olny template with instructions for creating a Docker container (for example: windows system)

# Container

    discription :
    	a container is a runnable instance of an image (commands used: start, stop, move, delete)

# Registry

    discription :
    	Registry is Docker Hub (contain all imges from each company)
    there's two types :
    	1 public like Docker Hub
    	2 private

# client

    discription:
    	the Docker client is the primary way that many Docker users interact with Docker ,
    	when you use commands such as "docker run" the client sends these commands to dockerd

# Docker daemon

    discription:
    	the Docker daemon listens for Docker API requests and manages Docker objects sush as images containers networks and volums.

# NameSpace

    a namespace is a feature provided by the Linux kernel that isolates and partitions system resources for containers, creating a sandboxed environment. Namespaces ensure that processes running inside a Docker container cannot see or interact with resources (like files, network interfaces, or process IDs) outside the container, providing the foundation for container isolation.

### Key Points:

Types of namespaces in Docker include :

- Isolation: Namespaces provide isolation for different resources, such as process IDs, user IDs, and network stacks.
- Network namespace: Isolates network interfaces (each container has its own network stack).
- Mount namespace: Isolates file system mounts.
- UTS namespace: Isolates hostname and domain name.
- IPC namespace: Isolates interprocess communication resources.

##### commands

- command : explanation
- docker --version : to see the version of docker
- docker run (spicifia the img): to create an instance from an image (if it doesn't exist localy it will be downloaded automaticly from the docker hub)
- docker images (we can use ls): to see all imges in local storge
- docker container ls -a : to see all containers
- docker container rm ('id or name' container) {or we can use docker rm to delete a container}
- docker image rm ('id or name' img) {Note: we can't delete an img that contain some instances we should delete first the instances}
- docker container run (specifia the img): also to create a container from an img
- docker inspect (name_imge) : to see all information about the img
- docker stats (id_container or name_container) : to see the status for a container
- docker logs (id_container) : to see logs for a container
- docker info : to see all information about docker
- docker container run -d -p 80:80 --name (name of your choice) imge : to create a container from an image with a name and spicifia the port
- docker stop : to stop a container
- docker start : to start a container
- docker exec -it id_container command(that you want to execute inside the container)
- docker container run -d (img) : run a container in the background
- docker history img(name image) : display some inforamation like tags ...
- docker login : to login in your account
- docker logout : to logout from your account
- docker build path_to_dockerfile : to build an image (the name image will be none)
- docker build --tag `tag like you want` path_to_dockerfile : to build an image with a tag (the name image will be the tag)

- docker build -f file.Dockerfile -t test2 path_where : if you create a docker file wihout using the default name `Dockerfile` the meaining of flags -f and -t :
  -f => --file
  -t => --tag

# DATA MANAGEMENT in Docker

    # SEPARATION OF CONCERNS
        app       |     data
                  |     to store the data we have two types:
        layer     |      1. Volumes
        layer     |      2. Bind Mounting
        base_image|


    - Volumes:
        1.Volumes are stored in a part of the host filesystem which is managed by Docker (default path: /var/docker/volumes on linux)
        2. Volumes can store deffrent data from deffrent containers in the same time
    - Bind Mounting
        1. Bind Mounting may be stored anywhere on the host system

# volumes:

    - docker container run -d --name (name) -e MARIADB_ROOT_PASSWORD=1234 -v (the name you want for the volume):/var/lib/mysql  mariadb

    - docker exec -it (id_or_name container) mariadb -u root -p : to connect in to mariadb
    - docker volume ls : to list all existe volumes
    - docker volume create (name_for_volume) : to create a new volume
    - docker volume inspect   (name_for_volume) : to inspect a volume and see the information

# Bind Mounting:

    - docker container run -it --name alpine -v ${path}:/mounted_folder alpine : mounted_folder is the name that will be in the container and path is the path to files that will be share it

# DOCKER NETWORKING

    docker networking is primarily used to establish communication between Docker containers and the outside world via the host machine where the Docker daemon is running

- docker network create --driver bridge n1 : this is for create a network called n1
- docker run --network=n1 -d -it ubuntu : to assigne the netwrok n1
- docker netwrok disconnect n2 id\*container : to disconnect from a newtwork
  - docker network connect n1 id_container : to connect into n1 network

<image src="./images/NETWORK.png">

# Docker Compose:

<image src="./images/DockerCompose.png">

    docker compose is a tool for defining and running multi-container Docker applications.
    with compose you use a YAML file to configure your application's services
    ==> the meaning of YAML is : YET another Markup Language

- docker-compose -v : to see version of docker-compose

# SSL - TLS

    We use it to Establishing encrypted Connection between a client and server
    # SSL : Secure Sockets layer
    # TLS : Transport layer security

    SSL >>>>>> update to >> TLS
    # CSR : certaficate signing request

# unix socket

https://medium.com/@moaminsharifi/unix-sockets-in-a-docker-environment-a-comprehensive-guide-6b7588e5c2c4
https://devopscube.com/run-docker-in-docker/f

# PID 1

    Understanding PID 1 is important when working with processes, especially inside containers like Docker. Let's break down what PID 1 is, why it matters, and how it relates to Docker.

## What is PID 1?

`In Unix-like operating systems, each running process is assigned a process ID (PID). The first process started by the kernel during boot is given PID 1. This process is special because it is the ancestor of all other processes running on the system. In the context of a full system (like your computer running Linux), PID 1 is usually the init system, which manages starting and stopping services (like systemd, upstart, or sysvinit).`

### Why is PID 1 Special?

    Orphaned Process Handling:

```Any process that loses its parent is re-assigned to PID 1. This is because PID 1 is the root of the process tree.
If a child process is created but its parent terminates, PID 1 "adopts" that child process.
Signal Handling:

PID 1 plays a critical role in handling signals (such as SIGTERM, SIGINT, and SIGHUP). If a process receives these signals, it might exit gracefully, clean up resources, or perform other tasks.
PID 1 in a container is responsible for handling signals correctly, or else child processes can become "zombies" (stuck in a defunct state, waiting to be cleaned up).
Managing Processes:

In the case of PID 1, if this process terminates, the entire system or container shuts down, since PID 1 is the root of all other processes.
This makes PID 1 responsible for cleaning up any orphaned processes (called reaping).
```

## Sources:

mariadb : https://severalnines.com/blog/how-deploy-mariadb-server-docker-container \
nginx : https://nginx.org/en/docs/beginners_guide.html \
https://www.digitalocean.com/community/tutorials/how-to-configure-nginx-as-a-reverse-proxy-on-ubuntu-22-04 \
https://blog.nginx.org/blog/automating-installation-wordpress-with-nginx-unit-on-ubuntu \
FastCGI: https://www.digitalocean.com/community/tutorials/understanding-and-implementing-fastcgi-proxying-in-nginx \
redis : https://architecturenotes.co/p/redis \
 https://www.digitalocean.com/community/tutorials/how-to-configure-redis-caching-to-speed-up-wordpress-on-ubuntu-14-04 \
ftp : https://docs.openeuler.org/en/docs/22.03_LTS/docs/Administration/configuring-the-ftp-server.html

#### this link containe some resources usefl to help you understanding docker and tls ... : https://www.one-tab.com/page/z4g_bNlpQNyUhg6Azcbz_Q
