.PHONY: image-base image-stripped image-verilog image-image \
  run-sim run-verilog pull help

# Use default versions from docker
OR1K_TOOLCHAIN_VERSION :=
OR1K_TOOLCHAIN_SITE    :=
OR1KSIM_VERSION        :=

BUILD_ARGS :=
BUILD_ARGS += $(if $(OR1K_TOOLCHAIN_VERSION),--build-arg OR1K_TOOLCHAIN_VERSION=$(OR1K_TOOLCHAIN_VERSION),)
BUILD_ARGS += $(if $(OR1K_TOOLCHAIN_SITE),--build-arg OR1K_TOOLCHAIN_SITE=$(OR1K_TOOLCHAIN_SITE),)
BUILD_ARGS += $(if $(OR1KSIM_VERSION),--build-arg OR1KSIM_VERSION=$(OR1KSIM_VERSION),)

DOCKER := podman
DOCKER_EXTRA_ARGS :=
DOCKER_RUN := $(DOCKER) run -it --rm

all: image-verilog image-sim

pull:
	$(DOCKER) image pull ubuntu:latest
image-base: base/Dockerfile
	$(DOCKER) build base $(BUILD_ARGS) -t or1k-base:latest
image-stripped: image-base stripped/Dockerfile
	$(DOCKER) build stripped -t or1k-base-stripped:latest
image-verilog: image-stripped verilog/Dockerfile
	$(DOCKER) build verilog -t or1k-verilog-env
image-sim: image-stripped sim/Dockerfile
	$(DOCKER) build sim -t or1k-sim-env

debug-base:
	$(DOCKER_RUN) or1k-base bash
debug-stripped:
	$(DOCKER_RUN) or1k-base-stripped bash

run-sim:
	$(DOCKER_RUN) or1k-sim-env
run-verilog:
	$(DOCKER_RUN) or1k-verilog-env
help:
	@echo "This is the helper file for running the rootfs build."
	@echo "Run one of the targets:"
	@echo
	@echo "  - pull           - pull upstream image for an refreshed image build."
	@echo "  - image-base     - builds the docker image."
	@echo "  - image-stripped - builds the docker image."
	@echo "  - image-verilog  - builds the docker image."
	@echo "  - image-sim      - builds the docker image."
	@echo "  - run-verilog    - runs the docker image"
	@echo "  - run-sim        - runs the docker image"
	@echo "  - help           - prints this help"
	@echo
	@echo "Configured setup:"
	@echo "  DOCKER:     $(DOCKER)"
	@echo "  DOCKER_RUN: $(DOCKER_RUN)"
	@echo "  OUTPUTDIR:  $(OUTPUTDIR)"
	@echo "  CACHEDIR:   $(CACHEDIR)"
