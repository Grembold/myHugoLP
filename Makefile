default: build 

build:
	docker run --rm -v /home/pi/myHugoLP:/www grembold/rpi-hugo

test:
	docker run --rm -p 1313:1313 -v /home/pi/myHugoLP:/www grembold/rpi-hugo server -b http://192.168.178.141 --bind=0.0.0.0 -w -default

version:
	docker run --rm grembold/rpi-hugo version

benchmark:
	docker run --rm -v /home/pi/myHugoLP:/www grembold/rpi-hugo benchmark

check:
	docker run --rm -v /home/pi/myHugoLP:/www grembold/rpi-hugo check

server:
	docker run --rm -v /home/pi/myHugoLP:/www grembold/rpi-hugo server $(arg)
