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
    Docker can build images automatically by reading the instrucations from a Dockerfile.
    A Dockerfile is a text document that contains all the commandsa user could call on the command line to assemble an image
    
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