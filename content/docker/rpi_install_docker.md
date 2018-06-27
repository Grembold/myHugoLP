+++
title = "Installation"
description = "Installation von Docker auf dem Raspberry Pi"
date = "2018-05-26"
draft = false
weight = 10
+++

## So installiert man Docker auf dem Pi

Docker installiert man auf dem Pi am besten über das offizell von Docker bereitgestellt Skript.

    curl -sSL get.docker.com | sh

Anschliessend fügt man den Benutzer pi noch zur Gruppe docker hinzu.

    sudo usermod -aG docker pi
    sudo reboot

und aktiviert Docker als dienst.

    sudo systemctl enable docker
    sudo systemctl start docker

Wenn alles geklappt hat, prüft man noch die Version mit `docker version` und bekommt:

    '''sh
    pi@server4:~ $ docker version
    Client:
     Version:      18.05.0-ce
     API version:  1.37
     Go version:   go1.9.5
     Git commit:   f150324
     Built:        Wed May  9 22:24:36 2018
     OS/Arch:      linux/arm
     Experimental: false
     Orchestrator: swarm

    Server:
     Engine:
      Version:      18.05.0-ce
      API version:  1.37 (minimum version 1.12)
      Go version:   go1.9.5
      Git commit:   f150324
      Built:        Wed May  9 22:20:37 2018
      OS/Arch:      linux/arm
      Experimental: false
    '''

Die [aktuelle Releases findet man hier.](https://github.com/docker/docker-ce/releases).

## Erster Container

Nun startet man seinen ersten Container mit:

    sudo docker run hello-world

QUELLE:

* [Raspberry Pi 3 Model B Docker Schwarm Rechencluster](https://42project.net/docker-schwarm-cluster-raspberry-pi-3/) | deutsch | 08. Januar 2017
* [How to install Docker on your Raspberry Pi](https://howchoo.com/g/nmrlzmq1ymn/how-to-install-docker-on-your-raspberry-pi) | englisch |  nicht so gut

## Fehm, Docker und Raspberry pi

* [VIDEO FHEM + Docker auf dem Raspberry Pi 3 | haus-automatisierung.com](https://youtu.be/_5F6kL7pLkg)
