FROM gcr.io/tensorflow/tensorflow:latest-gpu 

LABEL maintainer="Pascal Brokmeier <public@pascalbrokmeier.de>"

# Pick up some OpenAI base dependencies
RUN apt-get update && \ 
        apt-get install -y git wget python-numpy python-dev cmake zlib1g-dev libjpeg-dev xvfb libav-tools xorg-dev python-opengl libboost-all-dev libsdl2-dev swig
RUN git clone https://github.com/openai/gym /gym && \
        cd /gym 

#adding third party dependencies for the OpenAI Gym
WORKDIR "/tmp"
RUN  wget https://www.roboti.us/download/mjpro131_linux.zip && \
	unzip mjpro131_linux.zip && \
	mkdir /root/.mujoco && \
	mv mjpro131 /root/.mujoco/ && \
	rm -rf /tmp/* && \
        pip install 'gym[all]'
COPY mjkey.txt /root/.mujoco/
# we want to be able to SEE what is happening in the Gym so let's allow that with VNC and xvfb
RUN apt-get install -y x11vnc xvfb fluxbox wmctrl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*	

COPY run_jupyter.sh /

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888
# VNC Server
EXPOSE 5900

WORKDIR "/notebooks"

CMD ["/run_jupyter.sh", "--allow-root"]
