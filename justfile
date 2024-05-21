GIT_SHA := `git rev-parse HEAD`
IMAGE_DOMAIN := "ghcr.io/Levana-Protocol/localosmosis"

# List all recipies
default:
	just --list --unsorted

# Build image
build:
	docker image build . -f Dockerfile -t {{IMAGE_DOMAIN}}:{{GIT_SHA}}

# Run
run:
	docker run --rm --tty --interactive --name osmolocaltest --net=host -p 26657:26657 -p 1317:1317 -p 9090:9090 -p 9091:9091 localosmo:{{GIT_SHA}}

# Debug exec
debug-exec:
	docker run --rm --tty --interactive --name osmolocaltest --entrypoint=/bin/sh {{IMAGE_DOMAIN}}:{{GIT_SHA}}

# Push image
push-image:
	docker push {{IMAGE_DOMAIN}}:{{GIT_SHA}}
