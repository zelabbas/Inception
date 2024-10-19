# Path to the docker-compose file inside srcs folder
DOCKER_COMPOSE_PATH = ./srcs/docker-compose.yml

# Default rule: Build and start the services
all: makedir up

# Build services
build:
	docker-compose -f $(DOCKER_COMPOSE_PATH) build

# Start services
up:
	docker-compose -f $(DOCKER_COMPOSE_PATH) up -d

# create the folders if doesn't existes
makedir:
	mkdir -p /home/zelabbas/Desktop/data_base
	mkdir -p /home/zelabbas/Desktop/wp_files

# delete folders
deletedir:
	sudo rm -rf /home/zelabbas/Desktop/data_base
	rm -rf /home/zelabbas/Desktop/wp_files

# Stop services
down:
	docker-compose -f $(DOCKER_COMPOSE_PATH) down

# Restart services
restart:
	docker-compose -f $(DOCKER_COMPOSE_PATH) down
	docker-compose -f $(DOCKER_COMPOSE_PATH) up -d

# Clean up volumes and containers
clean: deletedir
	docker-compose -f $(DOCKER_COMPOSE_PATH) down -v --rmi all

# Rebuild everything from scratch
re: clean all