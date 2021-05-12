IMAGE_NAME=rspec_consolidator

MOUNTS=-v $(PWD):/tmp/src -w /tmp/src

image:
	docker build -t $(IMAGE_NAME) .

shell: image
	docker run --rm -it $(MOUNTS) $(IMAGE_NAME) bash

console: image
	docker run --rm -it $(MOUNTS) $(IMAGE_NAME) ./bin/console

test: image
	docker run --rm -it $(IMAGE_NAME) rake

guard: image
	docker run --name guard --rm -it $(MOUNTS) $(IMAGE_NAME) guard
