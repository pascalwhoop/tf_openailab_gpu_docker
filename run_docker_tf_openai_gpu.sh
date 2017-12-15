#!/bin/bash

docker build --tag pascalwhoop/tf-openailab-gpu ./
nvidia-docker run --name jupyter -d -v /home/pascalwhoop/Documents/Code/Jupyter/Notebooks:/notebooks -e NB_UID=1000 -e NB_GID=1000 -e VNC_SERVER_PASSWORD=password -p 8888:8888 -p 6006:6006 -p 5900:5900  pascalwhoop/tf-openailab-gpu 
echo "build succeeded, wait a bit for X to start, then getting the jupyter notebook URL with token"
sleep 3
docker exec -it jupyter bash -c "jupyter notebook list"
