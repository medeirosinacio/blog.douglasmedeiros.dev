#!/usr/bin/make

CONTAINER_NAME=blog.douglasmedeiros.dev
.DEFAULT_GOAL := help

setup: ## Setup the project
	mkdir -p .well-known/appspecific/ && touch .well-known/appspecific/com.chrome.devtools.json
	make check-docker
	docker stop $(CONTAINER_NAME) > /dev/null 2>&1 || true
	if [ "$(shell uname -m)" = "arm64" ]; then make setup-arm; else make setup-x86; fi

setup-x86: ## Setup the project for x86
	docker run -t --rm \
	  --name $(CONTAINER_NAME) \
      -v ./:/app \
      -w /app \
      --dns 8.8.8.8 \
      -p 80:4000 \
      -p 4000:4000 \
      -p 35729:35729 \
      jekyll/builder:3.8 \
      /bin/bash -c "bundle install --path=./.gem-cache && bundle exec jekyll serve --force_polling --host 0.0.0.0 --livereload"

setup-arm: ## Setup the project for ARM
	docker run -t --rm \
	  --name $(CONTAINER_NAME) \
      -v ./:/app \
      -w /app \
      --dns 8.8.8.8 \
      -p 80:4000 \
      -p 4000:4000 \
      -p 35729:35729 \
      -e RUBYOPT="-W0" \
      arm64v8/ruby:2.7 \
      /bin/sh -c "apt update && apt install nodejs -y && bundle install --path=./.gem-cache && bundle exec jekyll serve --force_polling --host 0.0.0.0 --livereload"

check-docker: ## Check if Docker is installed
	@docker --version > /dev/null || (echo "Docker is not installed. Please install Docker first." && exit 1)

optimize-images: ## Optimize images using Docker
	make check-docker
	docker run -it --rm \
    	-v ./:/app -w /app \
    	node:alpine sh -c "chmod +x /app/bin/optimize-images.sh && /app/bin/optimize-images.sh"

##@ Transcrição

transcribe: ## Transcreve um arquivo de áudio com Whisper (uso: make transcribe FILE=audio.m4a)
	@if [ -z "$(FILE)" ]; then \
		echo "\033[31mErro: informe o arquivo com FILE=caminho/do/audio.m4a\033[0m"; \
		exit 1; \
	fi
	@echo "\033[36mVerificando dependências...\033[0m"
	@which ffmpeg > /dev/null 2>&1 || (echo "\033[31mffmpeg não encontrado. Instale com: brew install ffmpeg\033[0m" && exit 1)
	@/Users/douglas.medeiros/Library/Python/3.9/bin/whisper --version > /dev/null 2>&1 || \
		python3 -m pip install -q openai-whisper
	@echo "\033[36mTranscrevendo $(FILE) com modelo large...\033[0m"
	@echo "\033[33mAtenção: o modelo large leva ~2h para áudios de 20-25min na primeira execução (download + processamento).\033[0m"
	@OUTDIR=$$(dirname "$(FILE)"); \
	/Users/douglas.medeiros/Library/Python/3.9/bin/whisper "$(FILE)" \
		--model large \
		--language Portuguese \
		--output_format txt \
		--output_dir "$$OUTDIR"
	@echo "\033[32mTranscrição concluída! Arquivo salvo no mesmo diretório do áudio.\033[0m"

##@ Docs

help: ## Print the makefile help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
