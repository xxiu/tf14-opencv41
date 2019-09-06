FROM tensorflow/tensorflow:1.14.0-py3
MAINTAINER chxxiu@gmail.com

RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list \
    && sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list 

RUN apt-get update 

RUN  apt-get install -y software-properties-common  
# RUN  export DEBIAN_FRONTEND=noninteractive && apt-get install -y libopencv-dev
RUN add-apt-repository "deb http://mirrors.aliyun.com/ubuntu/ xenial-security main"
RUN apt-get update

RUN apt-get install -y build-essential \
    cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
    libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev 

ADD . /data
