# Dockerized Synology Decrypt Tool
# https://github.com/welkineins/docker-ubuntu-xfce-vnc-desktop
# 1. Download Docker
# 2. Build with `docker build -t {image tag} .`
# 3. Run `docker run -t -i -v {local absolute directory}:{container directory} {image tag name} /bin/bash`

FROM ubuntu:14.04
MAINTAINER Andrew Paradi 'me@andrewparadi.com'

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
# RUN apt-get update && apt-get install -y x11vnc xvfb wget && mkdir ~/.vnc
#
# RUN x11vnc -storepasswd 1234 ~/.vnc/passwd

RUN apt-get update \
	&& apt-get install -y supervisor \
		openssh-server vim-tiny \
		xfce4 xfce4-goodies \
		x11vnc xvfb \
		firefox \
	&& apt-get autoclean \
	&& apt-get autoremove \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /root

COPY startup.sh ./
COPY supervisord.conf ./

EXPOSE 5900
EXPOSE 22

# RUN mkdir ~/syno && cd ~/syno && \
# wget http://global.download.synology.com/download/Tools/SynologyCloudSyncDecryptionTool/013/Linux/i686/SynologyCloudSyncDecryptionTool-013.tar.gz && \
# tar xvzf SynologyCloudSyncDecryptionTool-013.tar.gz && \
# bash -c 'echo "~/syno/SynologyCloudSyncDecryptionTool" >> /.bashrc'

ENTRYPOINT ["./startup.sh"]

# End
