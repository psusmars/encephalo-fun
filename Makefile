docker_user = "$(shell id -u):$(shell id -g)"
build:
	docker build . -t psusmars/encephalo-fun:latest
run:
	docker run --user $(docker_user) \
		-v `pwd`:/src \
		-it --rm \
		--env="DISPLAY" \
		--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
		psusmars/encephalo-fun:latest /bin/bash