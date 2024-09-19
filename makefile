#!/usr/bin/make

.DEFAULT_GOAL := help

setup: ## Setup the project
	make check-docker
	docker stop blog.douglasmedeiros.dev > /dev/null 2>&1 || true
	docker run -t --rm \
	  --name blog.douglasmedeiros.dev \
      -v ./:/app \
      -w /app \
      --dns 8.8.8.8 \
      -p 80:4000 \
      -p 4000:4000 \
      -p 35729:35729 \
      jekyll/builder:3.8 \
      /bin/bash -c "bundle install --path=./.gem-cache && bundle exec jekyll serve --force_polling --host 0.0.0.0 --livereload --incremental"

check-docker: ## Check if Docker is installed
	@docker --version > /dev/null || (echo "Docker is not installed. Please install Docker first." && exit 1)

##@ Docs

help: ## Print the makefile help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
