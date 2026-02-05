jetson-containers run --workdir /opt/nanoowl $(autotag nanoowl)


pip install --index-url https://pypi.jetson-ai-lab.io/jp6/cu126 aiohttp 


ls /dev/video*

cd examples/tree_demo
python3 tree_demo.py ../../data/owl_image_encoder_patch32.engine