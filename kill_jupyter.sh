#!/bin/bash

docker stop jupyter
docker container rm jupyter
docker rmi pascalwhoop/tf-openailab-gpu
