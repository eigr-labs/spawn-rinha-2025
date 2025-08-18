version=0.0.1
registry=ghcr.io/eigr

rinha-image=${registry}/rinha-2025:${version}

.PHONY: all

all: build build-image push-image

clean:
	mix deps.clean --all

clean-all:
	mix deps.clean --all && \
	kind delete cluster --name default

build:
	mix deps.get && \
	mix compile

build-image:
	docker build --no-cache -t ${rinha-image} .

push-image:
	docker push ${rinha-image}
