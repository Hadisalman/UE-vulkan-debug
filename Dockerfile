FROM nvidia/vulkan:1.1.121-cuda-10.1-alpha

RUN apt-get update && apt-get install wget unzip sudo -y --no-install-recommends

RUN adduser --force-badname --disabled-password --gecos '' --shell /bin/bash gameuser && \ 
	echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \ 
	adduser gameuser sudo && \ 
	adduser gameuser audio && \ 
	adduser gameuser video

USER gameuser
ENV USER gameuser
WORKDIR /home/gameuser
RUN sudo chown -R gameuser /home/gameuser

RUN wget -c https://github.com/microsoft/AirSim/releases/download/v1.3.1-linux/Blocks.zip && \
	unzip Blocks.zip
