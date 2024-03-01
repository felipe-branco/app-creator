.SILENT:
SHELL = /bin/bash

.PHONY: help
help: ## Print info about all commands
	@echo "Helper Commands:"
	@echo
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[01;32m%-20s\033[0m %s\n", $$1, $$2}'
	@echo

.PHONY: nextjs
nextjs: ## Create a nextjs app
	APPTYPE="nextjs" APPNAME=$(app-name) APPPATH=$(app-location) NODEVERSION=$(node-version) ./app-creator.sh

.PHONY: react
react: ## Create a react app
	APPTYPE="react" APPNAME=$(app-name) APPPATH=$(app-location) NODEVERSION=$(node-version) ./app-creator.sh

.PHONY: node
node: ## Create a modular node app
	APPTYPE="node" APPNAME=$(app-name) APPPATH=$(app-location) ./app-creator.sh

.PHONY: express
express: ## Create an express app
	APPTYPE="express" APPNAME=$(app-name) APPPATH=$(app-location) ./app-creator.sh

.PHONY: rails
rails: ## Create a rails app + postgres
	docker compose -f templates/db/postgres/docker-compose.yml up -d
	APPTYPE="rails" APPNAME=$(app-name) APPPATH=$(app-location) ./app-creator.sh
