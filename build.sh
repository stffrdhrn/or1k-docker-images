#!/bin/bash

podman build base -t or1k-base:latest
podman build stripped -t or1k-base-stripped:latest
podman build verilog -t or1k-verilog-env
podman build sim -t or1k-sim-env
