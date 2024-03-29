FROM ghcr.io/jpconstantineau/docker_arduino_cli:latest 
LABEL org.opencontainers.image.source="https://github.com/jpconstantineau/Docker_Bluefruit_nRF52"

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y libc6:i386 && rm -rf /var/lib/apt/lists/*
COPY arduino-cli.yaml /
RUN arduino-cli core update-index
RUN arduino-cli core upgrade
RUN pip3 install adafruit-nrfutil
RUN arduino-cli core search nrf52
RUN arduino-cli core install adafruit:nrf52
RUN mkdir /test
COPY test.ino /test
RUN arduino-cli compile -v --fqbn adafruit:nrf52:feather52832 --build-path /tmp /test/test.ino
