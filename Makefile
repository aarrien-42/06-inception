
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

up:
	docker-compose -f $(DOCKER_COMPOSE_DIR) up --build -d

clean:
	docker-compose -f $(DOCKER_COMPOSE_DIR) down

fclean: clean
	docker system prune -a --force

re: fclean up

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

.PHONY: all up clean fclean re status title