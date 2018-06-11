FROM debian:jessie

LABEL maintainer=glmxndr@gmail.com \
      version=1.0 \
      qmk.version="preonic-1.0-5761-g08210b3aa - sha:06487da" \
      teensy.version="2.1 - sha:d239f7"

# Dependencies
RUN apt-get update \
 && apt-get install --no-install-recommends -y build-essential make \
    gcc unzip wget zip gcc-avr binutils-avr avr-libc \
    dfu-programmer dfu-util gcc-arm-none-eabi binutils-arm-none-eabi \
    libnewlib-arm-none-eabi git libusb-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && git config --global http.sslVerify false

# QMK
RUN mkdir -p /usr/share/qmk \
 && cd /usr/share \
 && git clone https://github.com/qmk/qmk_firmware \
 && cd qmk_firmware \
 && git checkout 06487daaddf923d635e8a528d1eb644b875a73f6

# TEENSY_LOADER_CLI
RUN mkdir -p /usr/share/teensy_loader_cli \
 && cd /usr/share \
 && git clone https://github.com/PaulStoffregen/teensy_loader_cli \
 && cd teensy_loader_cli \
 && git checkout d239f76f01f922e115c2661a6a3855dfc660a69c \
 && make \
 && ln -s /usr/share/teensy_loader_cli/teensy_loader_cli /usr/local/bin/teensy_loader_cli

WORKDIR /usr/share/qmk_firmware

