FROM ibmcom/powerai:1.5.3-all-ubuntu16.04-py3
MAINTAINER Karthik <sdkarthikk@gmail.com>

ENV PATH="/home/pwrai/anaconda3/bin:/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV PYTHONPATH=/usr/local/lib/python3.6/site-packages/
RUN sudo apt update && apt-get update \
    && sudo apt-get install -y python3-pip python3-dev libhdf5-dev python3-tk \
    && cd /usr/local/bin \
    && sudo ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip

RUN sudo apt-get remove mldl-libavcodec mldl-libdc1394 -y \
    && sudo apt-get update \
    && sudo apt-get install --reinstall  libzvbi0 libxvidcore4 libx265-79 libx264-148 libbluray1 libdc1394-22 libraw1394-11 libavcodec-ffmpeg56 libavformat-ffmpeg56

RUN sudo apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    cmake \
    libgtk-3-dev \
    libhdf5-dev \
    libboost-all-dev \
    git \
    wget \
    unzip \
    yasm \
    pkg-config \
    libswscale-dev \
    libtbb2 \
    libtbb-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavcodec-dev \
    libgtk2.0-dev \
    libjasper-dev \
    libv4l-dev \
    libswscale-dev \
    libatlas-base-dev \
    gfortran \
    libavformat-dev \
    libpq-dev

RUN pip3 install \
    dlib \
    face_recognition \
    statistics

RUN conda update -y -n base conda && \
    conda install -y h5py && \
    conda install -y keras && \
    conda install -y matplotlib && \
    conda install -y numpy && \
    conda install -y pandas && \
    conda install -y scikit-image && \
    conda install -y scipy && \
    conda install -y tensorflow

#RUN pip install prometheus_client
# Copy the current directory contents into the container at /app
ADD . /code

WORKDIR /code
EXPOSE 5000
ENTRYPOINT ["/home/pwrai/anaconda3/bin/python", "server.py"]
