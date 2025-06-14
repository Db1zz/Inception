COMPOSE_PATH = ./srcs
COMPOSE_FLAGS = --project-directory $(COMPOSE_PATH) --progress auto
build:
	docker compose $(COMPOSE_FLAGS) build

run: 
	docker compose $(COMPOSE_FLAGS) up -d

clean:
	docker compose $(COMPOSE_FLAGS) down -v

fclean: clean
	docker compose $(COMPOSE_FLAGS) rm -s -f

re:	fclean build run

.PHONY: build run clear fclean re