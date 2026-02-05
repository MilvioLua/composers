#!/usr/bin/env bash
set -euo pipefail

# run_nanoowl.sh
# Simple wrapper for the steps you listed:
# 1) jetson-containers run --workdir /opt/nanoowl $(autotag nanoowl)
# 2) pip install --index-url https://pypi.jetson-ai-lab.io/jp6/cu126 aiohttp
# 3) cd examples/tree_demo && python3 tree_demo.py ../../data/owl_image_encoder_patch32.engine
#
# Usage:
#   ./run_nanoowl.sh [path/to/engine]
# If ENGINE is not provided, defaults to ../../data/owl_image_encoder_patch32.engine

ENGINE=${1:-../../data/owl_image_encoder_patch32.engine}

echo "Using engine: $ENGINE"

# Resolve image tag using autotag if available, otherwise use IMAGE env var or fallback to a known base
if command -v autotag >/dev/null 2>&1; then
  IMAGE_TAG=$(autotag nanoowl)
  echo "Using image tag from autotag: $IMAGE_TAG"
else
  IMAGE_TAG=${IMAGE:-dustynv/nanoowl:r36.4.0}
  echo "autotag not found; using IMAGE env / fallback: $IMAGE_TAG"
fi

echo "Running: jetson-containers run --workdir /opt/nanoowl $IMAGE_TAG"
jetson-containers run --workdir /opt/nanoowl "$IMAGE_TAG"

echo "Installing aiohttp from Jetson index (this may require network access)"
# Attempt to install from the Jetson AI Lab index as you specified
pip install --index-url https://pypi.jetson-ai-lab.io/jp6/cu126 aiohttp || {
  echo "Install from Jetson index failed; falling back to public PyPI for aiohttp"
  pip install aiohttp
}

# Run the demo
echo "Changing to examples/tree_demo and launching the demo"
cd examples/tree_demo
python3 tree_demo.py "$ENGINE"
