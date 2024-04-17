.PHONY: express-typescript-server
express-typescript-server:
	docker-compose exec express-typescript-server bash

.PHONY: build
build:
	docker-compose build

.PHONY: run-dev
run-dev:
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d

.PHONY: run-prod
run-prod:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d