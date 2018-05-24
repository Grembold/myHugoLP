default: build 

init:
	docker run --rm -v `pwd`:/www grembold/rpi-hugo new site . --force

build:
	docker run --rm -v `pwd`:/www grembold/rpi-hugo

draft:
	docker run --rm -v `pwd`:/www grembold/rpi-hugo -D

start:
	docker-compose up -d  --force-recreate;

test:
	docker-compose up --force-recreate;
	#docker run --rm -p 1313:1313 -v `pwd`:/www grembold/rpi-hugo server -b http://192.168.178.141 --bind=0.0.0.0 -w -D

version:
	docker run --rm grembold/rpi-hugo version

benchmark:
	docker run --rm -v `pwd`:/www grembold/rpi-hugo benchmark

check:
	docker run --rm -v `pwd`:/www grembold/rpi-hugo check

server:
	docker run --rm -v `pwd`:/www grembold/rpi-hugo server $(arg)
