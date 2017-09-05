default: build 

build:
	docker run --rm -v /home/pi/myHugoLP:/www grembold/rpi-hugo

version:
	docker run --rm grembold/rpi-hugo version

benchmark:
	docker run --rm -v /home/pi/myHugoLP:/www grembold/rpi-hugo benchmark

check:
	docker run --rm -v /home/pi/myHugoLP:/www grembold/rpi-hugo check

server:
	docker run --rm -v /home/pi/myHugoLP:/www grembold/rpi-hugo server $(arg)
