Dockerfile.nanoowl — build and run instructions

This Dockerfile builds an image on top of `dustynv/nanoowl:r36.4.0`, installs `aiohttp`, copies your nanoowl project into the image and installs it in editable mode so the examples are runnable.

Assumptions
- You will run `docker build` from the root of the nanoowl project (the directory that contains `setup.py`).
- The repository layout includes an `examples/tree_demo` folder and `data/owl_image_encoder_patch32.engine`.

Build the image (run from the nanoowl project root):

```bash
# from the folder that contains setup.py, examples/, data/, etc.
docker build -f /path/to/Dockerfile.nanoowl -t my-nanoowl .
```

If you placed `Dockerfile.nanoowl` inside the nanoowl project root, a shorter command is:

```bash
# when Dockerfile.nanoowl is in the current directory
docker build -f Dockerfile.nanoowl -t my-nanoowl .
```

Run the container (use --device for camera access on Linux if required):

```bash
# This example maps the host's /dev/video0 to the container and runs the default CMD
docker run --rm --device /dev/video0:/dev/video0 --name nanoowl-demo my-nanoowl
```

Override the default command to run with different flags or a different example:

```bash
docker run --rm --device /dev/video0:/dev/video0 my-nanoowl \
  python3 examples/tree_demo/tree_demo.py --camera 0 --resolution 640x480 data/owl_image_encoder_patch32.engine
```

Notes
- If your host requires extra permissions (e.g., access to GPUs on Jetson), add the appropriate runtime or flags when running the container. The base image is targeted for Jetson hardware; build and run on compatible hardware.
- If you want the package installed non-editable (faster start, immutable), change the Dockerfile's `pip3 install -e .` to `pip3 install .`.
