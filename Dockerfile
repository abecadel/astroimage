FROM ubuntu:focal

WORKDIR /app

# Install astrometry
RUN apt-get update && \
    apt-get install -y software-properties-common apt-utils
RUN apt-add-repository ppa:mutlaqja/ppa -y
RUN apt update
RUN apt install -y python3 python3-pip indi-full astrometry.net
RUN apt install -y astrometry-data-2mass astrometry-data-tycho2

# Install Python packages
COPY requirements.txt .
RUN pip3 install -r requirements.txt
