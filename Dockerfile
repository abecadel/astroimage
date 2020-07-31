FROM ubuntu:20.04

WORKDIR /app

# Install astrometry
RUN apt-get update && apt-get install -y software-properties-common apt-utils
RUN apt-add-repository ppa:mutlaqja/ppa -y && apt update
RUN apt-get upgrade -y
RUN apt-get install -y git indi-full libindi-dev gsc python3 python3-pip python3-dev astrometry.net swig libcfitsio-dev libnova-dev scamp source-extractor
#RUN apt-get install -y astrometry-data-2mass astrometry-data-tycho2

# Install Python packages
COPY requirements.txt .
RUN pip3 install -r requirements.txt
