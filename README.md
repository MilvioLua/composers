# Jetson Container Starters

This repository contains helper scripts and compose files to easily start containerized applications on NVIDIA Jetson devices.

## Purpose

Make it simple to run containerized apps (examples and helpers are provided as scripts and compose files) on Jetson platforms using the jetson-containers tooling.

## Prerequisites

Before running any example, make sure you have jetson-containers installed. You can install it with the following commands:

```bash
git clone https://github.com/dusty-nv/jetson-containers
bash jetson-containers/install.sh
```

This will install the helper scripts and tooling used to build and run container images optimized for Jetson.

## Usage

There are a few helper scripts and compose files in this repo. Example usages:

- Run the Stable Diffusion helper script:

```bash
bash run_stable-difusion.sh
```

- Run the NanoOWL tree helper script:

```bash
bash run_nanoowl_tree.sh
```

- Use Docker Compose files (example):

```bash
docker compose -f portainer-compose.yaml up -d
```

Adjust commands as needed for your environment.

## Notes

- This repo was tested on an NVIDIA Jetson Orin Nano.
- The scripts assume you have Docker and the jetson-containers tooling installed and configured on your Jetson device.

## Files of interest

- `run_stable-difusion.sh` — helper to build/run a Stable Diffusion container example.
- `run_nanoowl_tree.sh` — helper script for NanoOWL tree example.
- `portainer-compose.yaml` — Docker Compose file for Portainer/service management.
- `ollama-open-webiui-composer.yaml` — another compose-like configuration included in the repo.

