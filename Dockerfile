FROM ubuntu:focal

WORKDIR /app

# Install astrometry
RUN apt-get update && \
    apt-get install -y software-properties-common apt-utils
RUN apt-add-repository ppa:mutlaqja/ppa -y
RUN apt update
RUN apt install -y git indi-full libindi-dev gsc python3 python3-pip python3-dev astrometry.net swig libcfitsio-dev libnova-dev 

# Install Python packages
COPY requirements.txt .
RUN pip3 install -r requirements.txt
