## What's a docker engine
Docker Engine is an open source containerization technology for building and containerizing your applications.
Docker Engine acts as a client-server application with: A server with a long-running daemon process dockerd .
APIs which specify interfaces that programs can use to talk to and instruct the Docker daemon


- Docker is an open source standalone application which works as an engine used to run containerized 
- an application running in a container is isolated from the rest of the system and from other containers
- Docker application run in a container that can be used in any system 

## We could say Docker is a container management service .


*** the meaning of cli is: Command line interface
*** the meaning of api is : application programming interface 

# --------------Docker Architecture-----------------

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
	// Searching after!


##### commands ########
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
- docker netwrok disconnect n2 id_container : to disconnect from a newtwork 
_ docker network connect n1  id_container : to connect into n1 network

# Docker Compose:
	docker compose is a tool for defining and running multi-container Docker applications.
	with compose you use a YAML file to configure your application's services
	==> the meaning of YAML is : YET another Markup Language

-  docker-compose -v : to the version of docker-compose