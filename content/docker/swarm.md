+++
title = "swarm"
description = "Swarm mit Raspberry Pi und Docker-Swarm"
date = "2018-05-26"
draft = false
weight = 20
+++

## Swarm mit Raspberry Pi und Docker

* [Docker Swarm Mode auf einem Host](https://www.kuerbis.org/2018/04/howto-nginx-proxy-und-nginx-proxy-companion-im-docker-swarm-mode-auf-einem-host/) | deutsch | 1. April 2018 | Ralf Geschke
* [How to run a Raspberry Pi cluster with Docker Swarm](https://howchoo.com/g/njy4zdm3mwy/how-to-run-a-raspberry-pi-cluster-with-docker-swarm)

Kommandos auf mehreren pi's ausführen

* [Etwas auf mehreren pi's installieren](https://howchoo.com/g/njy4zdm3mwy/how-to-run-a-raspberry-pi-cluster-with-docker-swarm#install-docker-on-each-node) | deutsch | vom 08.01.2017
* [Raspberry Pi 3 Model B Docker Schwarm Rechencluster](https://42project.net/docker-schwarm-cluster-raspberry-pi-3)

Über den Befehl `docker info` kann man unter dem Punkt *swarm* sehen das dieser noch *inactive* ist.

## Teil 1 - Docker swarm initialisieren

    docker swarm init --advertise-addr 192.168.178.2

Um einen weiteren manager hinzuzufügen ruf man
    docker swarm join-token manager
und befolgt die Anweisungen. Für einen worker entsprechend
    docker swarm join-token worker

    docker swarm join --token SWMTKN-1-3xwnj7ptf9jsn95ehyljc1v4ul9rae69glpo1hhpp3ubirgam7-dcldyqvb7gjwlhgaf7qibhoo4 192.168.178.2:2377

## Teil 2 - Test / Demo

[Docker Swarm Visualizer](https://github.
com/ManoMarks/docker-swarm-visualizer#docker-swarm-visualizer) ist ein demo image zu anzeige von Services in einem docker swarm.
Zum start:

    $docker service create \
     --name=viz \
     --publish=8080:8080/tcp \
     --constraint=node.role==manager \
     --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
     alexellis2/visualizer-arm:latest

Dies wird sicher einige Minuten dauern, da das image erst heruntergeladen werden muss. In der zwischenzeit kann man auf einer zweiten Konsole den Status prüfen:

    ````
    sudo docker service ls
    ```

Bis der Service gestartet wurde wird dort **REPLICAS value 0/1** stehen. Sobald der Service bereit ist (es wird **1/1** angezeigt), ist die Webseite unter [192.168.178.5:8080](192.168.178.5:8080) (irgend eine IP aus dem swarm) erreichbar

[Ansehen auf Docker Hub](https://hub.docker.com/r/alexellis2/visualizer-arm/tags/)
Quelle: https://howchoo.com/g/njy4zdm3mwy/how-to-run-a-raspberry-pi-cluster-with-docker-swarm  engl. aber ok

### Wo finde ich den swarm token

    docker swarm join-token manager
oder
    docker swarm join-token worker