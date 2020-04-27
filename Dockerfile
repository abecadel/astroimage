FROM ubuntu:focal

WORKDIR /app

# Install astrometry
RUN apt-get update && \
    apt-get install -y software-properties-common
RUN apt-add-repository ppa:mutlaqja/ppa -y
RUN apt update
RUN apt install -y python3 python3-pip indi-full astrometry.net
#RUN apt install -y astrometry-data-2mass astrometry-data-2mass-00 astrometry-data-2mass-01 astrometry-data-2mass-02 astrometry-data-2mass-03 astrometry-data-2mass-04 astrometry-data-2mass-05 astrometry-data-2mass-06 astrometry-data-2mass-07 astrometry-data-2mass-08-19 astrometry-data-tycho2 astrometry-data-tycho2-07 astrometry-data-tycho2-08 astrometry-data-tycho2-09 astrometry-data-tycho2-10-19

# Install Python packages
COPY requirements.txt .
RUN pip3 install -r requirements.txt
