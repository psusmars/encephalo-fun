docker_user = "$(shell id -u):$(shell id -g)"
build:
	docker build . -t psusmars/encephalo-fun:latest
run:
	docker run --user $(docker_user) \
		-v `pwd`:/src \
		-it --rm \
		psusmars/encephalo-fun:latest /bin/bash