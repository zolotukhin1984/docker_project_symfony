.DEFAULT_GOAL := help

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build: ## Build containers
	docker-compose up -d --build

up: ## Up containers
	docker-compose up -d --force-recreate

down: ## Down containers
	@docker-compose down

stop: ## Stop contrainers
	@docker-compose stop

restart: stop up ## Restart docker containers

php-console: ## PHP console
	docker-compose exec php bash