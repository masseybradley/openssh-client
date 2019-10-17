.PHONY: all
all: build

.PHONY: build
build:
	docker run --rm -it \
		-v ${PWD}:/workspace/source \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v ${HOME}/.docker/config.json:/root/.docker/config.json:ro \
		-v ${HOME}/.skaffold:/root/.skaffold \
		-w /workspace/source \
		--entrypoint skaffold \
		--network host \
		gcr.io/k8s-skaffold/skaffold:028a21bc1a4edff29e1ddae0015089aa43ac812b build -p 5.9p1
	docker run --rm -it \
		-v ${PWD}:/workspace/source \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v ${HOME}/.docker/config.json:/root/.docker/config.json:ro \
		-v ${HOME}/.skaffold:/root/.skaffold \
		-w /workspace/source \
		--entrypoint skaffold \
		--network host \
		gcr.io/k8s-skaffold/skaffold:028a21bc1a4edff29e1ddae0015089aa43ac812b build -p 7.6p1
	docker run --rm -it \
		-v ${PWD}:/workspace/source \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v ${HOME}/.docker/config.json:/root/.docker/config.json:ro \
		-v ${HOME}/.skaffold:/root/.skaffold \
		-w /workspace/source \
		--entrypoint skaffold \
		--network host \
		gcr.io/k8s-skaffold/skaffold:028a21bc1a4edff29e1ddae0015089aa43ac812b build -p 7.4p1
	docker run --rm -it \
		-v ${PWD}:/workspace/source \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v ${HOME}/.docker/config.json:/root/.docker/config.json:ro \
		-v ${HOME}/.skaffold:/root/.skaffold \
		-w /workspace/source \
		--entrypoint skaffold \
		--network host \
		gcr.io/k8s-skaffold/skaffold:028a21bc1a4edff29e1ddae0015089aa43ac812b build -p 7.9p1
