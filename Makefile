export DOCKER_COMMIT ?= $(shell git rev-parse HEAD 2> /dev/null)

build:
	docker build --rm=false -t docker-base-python:latest -f Dockerfile .

tag:
	docker tag docker-base-python:latest yayalice/docker-base-python:$(DOCKER_COMMIT)
	docker tag docker-base-python:latest yayalice/docker-base-python:latest

push:
	docker push yayalice/docker-base-python:$(DOCKER_COMMIT)
	docker push yayalice/docker-base-python:latest
