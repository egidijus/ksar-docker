
export
SHELL = /bin/bash

all: build run


prep-sar: 
	cat sa/sar{01..09} >> sa/sar_mega
	cat sa/sar{10..31} >> sa/sar_mega

build:
	wget -q https://github.com/vlsi/ksar/releases/download/v5.2.4-snapshot-72f2da0/ksar-5.2.4-SNAPSHOT-all.jar -O ksar.jar
	docker build -t ksar .

run:
	env |  sort
	docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=${DISPLAY} --rm ksar

test:
	docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix --user=root -e DISPLAY=${DISPLAY} --rm ksar 
