# CUDA + TensorFlow + OpenAI Gym + RoboSchool + Jupyter

This project hosts a Dockerimage that let's you run TensorFlow code to compete in the OpenAI Gym while staying true to FOSS and not relying on MujoCo. And because we are all beginners here, let's not assume our Python code is perfect from the start --> Jupyter to the rescue

## Size of the image
This image is quiet large. It's because it contains

- CUDA
- FFMPEG + bunch of dependencies for Roboschool
- Lots of Python packages
- x11 xvfb etc so we can SEE the action with VNC
- gcc and g++ compilers for C code
- is Ubuntu based (taken from NVIDIA, I know, an alpine base would be nice)

## Dependencies

You just need a machine with Docker, Nvidia-Docker and the nvidia drivers. This might also be a cloud machine, but be careful they cost quiet a bit per hour with a GPU ;-)

Ah and one more thing. Sorry, I can't pack this, as it's protected by NVIDIA lawyer blabla
Download the cuDNN library files and place them in the same folder as the `build.sh` and `Dockerfile` files.

[Download from here](https://developer.nvidia.com/cudnn) make sure you get the version `cudnn-8.0-linux-x64-v7.tgz`

## installation

```
cd tf_openaigym_gpu_docker
./run_docker_tf_openai_gpu.sh
