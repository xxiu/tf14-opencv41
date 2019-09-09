FROM tensorflow/tensorflow:1.14.0-py3
MAINTAINER chxxiu@gmail.com

RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list \
    && sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list 

RUN apt-get update && apt-get install -y  build-essential \
        vim \
        cmake \
        git \
        pkg-config \
        libgtk2.0-dev \
        pkg-config \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libpq-dev \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /data

RUN git clone -b 4.1.1  https://github.com/opencv/opencv.git \
    &&  git clone -b 4.1.1 https://github.com/opencv/opencv_contrib.git \
    && cd opencv \
    && mkdir build \
    && cd build \
    && cmake -D CMAKE_BUILD_TYPE=Release \
        -D BUILD_EXAMPLES=OFF \
        -D INSTALL_C_EXAMPLES=ON \ 
        -D INSTALL_PYTHON_EXAMPLES=ON \ 
        -DOPENCV_EXTRA_MODULES_PATH=/data/opencv_contrib/modules \
        -DCMAKE_INSTALL_PREFIX=/usr/local ..\
    && make -j4 \
    && make install \
    && rm -rf /data/* 
 
 
