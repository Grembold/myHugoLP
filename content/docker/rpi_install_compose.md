+++
title = "Installation docker-compose"
description = "Installation von Docker-Compose auf dem Raspberry Pi"
date = "2018-05-31"
draft = false
weight = 15
+++

## Update (20185.08.09)

Docker compose ist ein seperates projekt, das in python geschriben wurde. Seit docker
Version 1.12 ist dies Funktionalität in die Docker-Engine integreirt worde. [Link](https://vsupalov.com/difference-docker-compose-and-docker-stack/)
Seit `docker verion 1.12` ist die intallation von docker-compose nicht mehr nötig und man kann äquivalent den befehl `docker stack`verweden.


## Der Leichte weg (nicht der Beste)

Die Repositories von Raspian enthalten zum Glück inzwischen direkt eine docker-compose version. So kann mit dem gebräuchlichen Mittel `apt` direkt installiert werden

    sudo apt install -y docker-compose
    docker-compose version

Leider zeigt sich, dass man hier eine nicht ganz so frische Version erhält, so dass zur zweiten Variante zu raten ist.

## neue Version erstellen

Sollte die Version aus dem Repository zu alt sein, lässt sich die neuste Version auch direkt auf dem Raspi compilieren.

    sudo apt update
    sudo apt install git
    mkdir docker-compose
    cd docker-compose
    git clone https://github.com/docker/compose.git
    cd compose/
    git checkout release

Auf dem Raspberry pi 1 musste ich den zugrunde liegenden container änder, da es immer weider zur Fehlermeldung `exit with non-zero code: 132`gekommen ist.
In der Datei Dockerfile.armhf habe ich gleich in der ersten Zeile

    FROM  armhf/debian

durch

    FROM resin/rpi-raspbian

ersetzt.

### Build and install docker-compose

Eine docker-compose Binary zu erstellen ist recht einfach. Zuerst wird ein docker image erstellt, das die generierungs Umgebung enthält. Als zweites wird der container gestartet und die docker-comose Binary erstellt. Am Ende liegt die Binary im Unterverzeichnise `dist\`.

    docker build -t docker-compose:armhf -f Dockerfile.armhf .
    docker run --rm --entrypoint="script/build/linux-entrypoint" -v $(pwd)/dist:/code/dist -v $(pwd)/.git:/code/.git "docker-compose:armhf"

Dies dauert gefühlt eine ewigkeit und kann durchaus 1 oder 2 Stunden dauern. Also erstmal aufstehen und etwas spazieren gehen. Ein bishcen frische Luft tut immer gut.
Ist der ganze build durchgelaufen, befindet sich im Verzeichnis `dist/` eine Biärdatei, die auf dein System kopiert wird.

    sudo cp dist/docker-compose-Linux-armv7l /usr/local/bin/docker-compose
    sudo chown root:root /usr/local/bin/docker-compose
    sudo chmod 0755 /usr/local/bin/docker-compose
    sudo reboot

Nun noch ein Test, ob sich die Mühe auch gelohnt hat ;-)

    docker-compose version
    docker-compose version 1.11.0-rc1, build daed6db
    docker-py version: 2.0.2
    CPython version: 2.7.13
    OpenSSL version: OpenSSL 1.0.1t  3 May 2016

Dies kann man mit dem Releas aus GitHub vergleichen. [docker/compose/release](https://github.com/docker/compose/releases).

* Für ältere Versionen gibt es [Hier](https://www.berthon.eu/2017/getting-docker-compose-on-raspberry-pi-arm-the-easy-way/) eine gute Anleitung ein Build in einem Container anzustoßen.
