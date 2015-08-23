USER=gotbadger

build:
	docker build -t ${USER}/mumble-server .

.PHONY: build
