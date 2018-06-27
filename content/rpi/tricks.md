+++
title = "tricks"
description = "Tipps und Trick im Umgang mit dem Pi"
draft = false
weight = 40
#alwaysopen = true
date = "2018-09-08T16:35:00+02:00"
+++

## Kommandos auf mehreren pi's ausführen

Hat man mit der Zeit mehr als einen Pi so möchte man manchmal Befehle auf allen ausführen, um beispielsweise alle auf Updates zu prüfen. Hierfür gibt es einen netten Trick:

    for host in pi1 pi2 pi33 docker4; do ssh pi@$host sudo apt update; done

Quelle:

* [Etwas auf mehreren pi's installieren](https://howchoo.com/g/njy4zdm3mwy/how-to-run-a-raspberry-pi-cluster-with-docker-swarm#install-docker-on-each-node) | deutsch | vom 08.01.2017