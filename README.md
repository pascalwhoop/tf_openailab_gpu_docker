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
#builds and runs the image, binding your path to the container, so you can access them from jupyter
./build.sh path/to/your/notebooks 
```

## Important links

- [Nvidia Docker CUDA base Image](https://gitlab.com/nvidia/cuda)
- [RoboSchool](https://github.com/openai/roboschool)
- [Jupyter Docs to Start Notebooks](https://jupyter.readthedocs.io/en/latest/running.html)
- [SO Answer on how to install cudnn](https://stackoverflow.com/questions/43978832/cuda-nn-path-issues-in-installing-tensorflow-gpu-on-ubuntu-16-04#43994305)
- [TensorFlow Install instructions](https://www.tensorflow.org/install/install_linux)
- [Jupyter Docker image (deps stolen from here](https://hub.docker.com/r/jupyter/datascience-notebook/)
