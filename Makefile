.DEFAULT_GOAL := test
COMPOSE=docker-compose

.PHONY: up
up: ## Create and start containers for local development
	$(COMPOSE) up -d

.PHONY: down
down: ## Stop and remove local Docker containers
	$(COMPOSE) down

.PHONY: run
run: ## Create and start local docker postgres container and application from source code
	$(COMPOSE) up -d postgres && ./gradlew bootRun

.PHONY: test
test: ## Run tests
	./gradlew clean test

