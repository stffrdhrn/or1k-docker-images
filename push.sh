#!/bin/bash
# Be sure to login first with:
#   podman login docker.io

REPO=${REPO:-stffrdhrn}
TAG=${1:-latest}

for image in or1k-verilog-env or1k-sim-env; do
  dest="$REPO/${image}:$TAG"
  echo "Pushing $dest"
  podman push $image $dest
done
