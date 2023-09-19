
# Colors

RED =    \033[0;31m
GREEN =  \033[0;32m
YELLOW = \033[0;33m
BLUE =   \033[0;34m
PURPLE = \033[0;35m
CYAN =   \033[0;36m
BOLD =   \033[0;1m
WHITE =  \033[0;0m

# Variables

DOCKER_COMPOSE_DIR = ./srcs/docker-compose.yml

# Rules

all: title up

build:
	docker-compose -f $(DOCKER_COMPOSE_DIR) build

up: setup-dirs build
	docker-compose -f $(DOCKER_COMPOSE_DIR) up -d

clean:
	@if [ -d $(HOME)/data ]; then sudo rm -rf $(HOME)/data; fi
	docker-compose -f $(DOCKER_COMPOSE_DIR) down -v

fclean: clean
	docker system prune -a --force

re: fclean up

setup-dirs:
	@if [ ! -d $(HOME)/data ]; then mkdir -p $(HOME)/data/mariadb $(HOME)/data/wordpress; fi
	@chown -R $(USER):$(USER) $(HOME)/data/mariadb $(HOME)/data/wordpress
	@chmod 777 $(HOME)/data $(HOME)/data/mariadb $(HOME)/data/wordpress

status:
	@docker ps -a | awk '{printf "$(BLUE)"} NR==1 {print $1;next} {printf "$(WHITE)"} {print}'
	@docker images | awk '{printf "$(BLUE)"} NR==1 {print $1;next} {printf "$(WHITE)"} {print}'
	@docker volume ls | awk '{printf "$(BLUE)"} NR==1 {print $1;next} {printf "$(WHITE)"} {print}'
	@docker network ls | awk '{printf "$(BLUE)"} NR==1 {print $1;next} {printf "$(WHITE)"} {print}'

title:
	@echo "\n$(PURPLE)" "██╗███╗   ██╗ ██████╗███████╗██████╗ ████████╗██╗ ██████╗ ███╗   ██╗"
	@echo "$(BLUE)"     "██║████╗  ██║██╔════╝██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║"
	@echo "$(CYAN)"     "██║██╔██╗ ██║██║     █████╗  ██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║"
	@echo "$(PURPLE)"   "██║██║╚██╗██║██║     ██╔══╝  ██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║"
	@echo "$(BLUE)"     "██║██║ ╚████║╚██████╗███████╗██║        ██║   ██║╚██████╔╝██║ ╚████║"
	@echo "$(CYAN)"     "╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
	@echo               "\nby: aarrien-\n" "$(WHITE)"

.PHONY: all build up clean fclean re setup-dirs status title