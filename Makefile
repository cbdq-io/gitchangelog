.EXPORT_ALL_VARIABLES:

TAG = 0.1.2

all: lint build test

build:
	docker compose build

lint:
	docker run --rm -i hadolint/hadolint < Dockerfile
	isort -v .
	flake8

tag:
	@echo ${TAG}

test:
	docker compose run --remove-orphans --rm gitchangelog > CHANGELOG.md
