+++
title = "pi-hole"
description = "Wie mann pi-hole als Docker auf dem pi startet"
date = "2017-09-04T21:03:00+02:00"
draft = false
weight = 20
+++

## Pi-hole: Das schwarze loch für DNS anfragen
https://www.nico-maas.de/?p=1525

Für pi-hole gibt es zwar bereits ein docker image, doch auf meinem Raspberry Pi Model B der ersten Generation wollte docker und docker-compose nicht so recht laufen.
Also habe ich dies zum Anlasss genmmen einmal eineneigenen Container zu erstellen.

## Erstellen eies Dockerfiles für pi-hole

Als erstes wird ein Ornder für die Dateien und das Docker image angelegt. Dann wird eine Datei mit dem Namen dockerfile erzeugt.

    mkdir pi-hole
    cd pi-hole
    touch dockerfile

Nach dem Anlegen der Datei wird diese mit einem Editor geöffnet. `nano dockerfile`

### Das Dockerfile

Hier das listting für das dockerfile

    FROM resin/rpi-raspbian:stretch

    RUN apt-get update -qq; \
    apt-get upgrade -qq;

### Docker image erzeugen

Jetzt lassen wir docker das image bauen.

    docker build -t pihole .

Nun das image als container starten

    docker run -it pihole

Nun befinden wir uns innerhalb des containers. Mit

    curl -sSL https://install.pi-hole.net | bash

wird die installation von pi-hole gestartet.
Wenn wir mit einrichten und installation fertig sind, wird daraus wieder ein image gemacht.

    docker commit pihole my/pihole