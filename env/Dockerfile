FROM debian:jessie

RUN apt-get update && apt-get upgrade && apt-get install -y git cmake wget unzip

RUN mkdir -p /home/pi && useradd -r -d /home/pi pi && chown -R pi:pi /home/pi
USER pi
WORKDIR /home/pi

RUN mkdir raspberrypi
RUN git clone git://github.com/raspberrypi/tools.git raspberrypi/tools
ENV PATH=$PATH:/home/pi/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin
RUN mkdir rootfs
COPY pi.cmake /home/pi/raspberrypi/pi.cmake

VOLUME /home/pi/raspberrypi/rootfs
