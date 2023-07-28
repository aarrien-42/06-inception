
# Colors

RED =    \033[0;31m
GREEN =  \033[0;32m
YELLOW = \033[0;33m
BLUE =   \033[0;34m
PURPLE = \033[0;35m
CYAN =   \033[0;36m
BOLD =   \033[0;1m
WHITE =  \033[0;0m

# Functions

SIZE = 50

define print_section
	@echo "$(PURPLE)"
	@word_len=$$(echo -n $1 | wc -c); \
	line_len=$$(($(SIZE) - word_len / 2)); \
	for i in $$(seq 1 $$line_len); do \
		echo -n ' '; \
	done; \
	echo -n "╔"; \
	for i in $$(seq 1 $$((word_len + 4))); do \
		echo -n '═'; \
	done; \
	echo -n "╗"; \
	echo; \
	for i in $$(seq 1 $$line_len); do \
		echo -n '═'; \
	done; \
	echo -n "╣ " $1 " ╠"; \
	for i in $$(seq 1 $$line_len); do \
		echo -n '═'; \
	done; \
	echo; \
	for i in $$(seq 1 $$line_len); do \
		echo -n ' '; \
	done; \
	echo -n "╚"; \
	for i in $$(seq 1 $$((word_len + 4))); do \
		echo -n '═'; \
	done; \
	echo -n "╝"; \
	echo "$(WHITE)"
endef

# Rules

all: title

status:
	$(call print_section,CONTAINERS)
	@docker ps -a | awk '{printf "$(BLUE)"} NR==1 {print $1;next} {printf "$(WHITE)"} {print}'
	@echo "                            "
	$(call print_section,IMAGES)
	@echo "$(WHITE)"
	@docker images | awk '{printf "$(BLUE)"} NR==1 {print $1;next} {printf "$(WHITE)"} {print}'

title:
	@echo "\n$(PURPLE)" "██╗███╗   ██╗ ██████╗███████╗██████╗ ████████╗██╗ ██████╗ ███╗   ██╗"
	@echo "$(BLUE)"     "██║████╗  ██║██╔════╝██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║"
	@echo "$(CYAN)"     "██║██╔██╗ ██║██║     █████╗  ██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║"
	@echo "$(PURPLE)"   "██║██║╚██╗██║██║     ██╔══╝  ██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║"
	@echo "$(BLUE)"     "██║██║ ╚████║╚██████╗███████╗██║        ██║   ██║╚██████╔╝██║ ╚████║"
	@echo "$(CYAN)"     "╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
	@echo               "\nby: aarrien-\n" "$(WHITE)"

.PHONY: all status title