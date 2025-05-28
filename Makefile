.EXPORT_ALL_VARIABLES:

TAG = 0.1.0

all: lint build

build:
	docker compose build

lint:
	docker run --rm -i hadolint/hadolint < Dockerfile
	isort -v .
	flake8

tag:
	@echo ${TAG}
