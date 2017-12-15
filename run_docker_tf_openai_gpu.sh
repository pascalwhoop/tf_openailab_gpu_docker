#!/bin/bash

nvidia-docker run --name jupyter -d -v /home/pascalwhoop/Documents/Code/Jupyter/Notebooks:/notebooks -e NB_UID=1000 -e NB_GID=1000 -e VNC_SERVER_PASSWORD=password -p 8888:8888 -p 6006:6006 -p 5900:5900  pascalwhoop/tf-openailab-gpu 
sleep 5
docker exec -it jupyter bash -c "jupyter notebook list"
