FROM jpconstantineau/arduino-cli:latest 

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y libc6:i386 && rm -rf /var/lib/apt/lists/*
RUN ./arduino-cli core update-index
RUN pip3 install adafruit-nrfutil
RUN ./arduino-cli core install adafruit:nrf52
