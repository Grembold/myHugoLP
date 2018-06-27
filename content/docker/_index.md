+++
title = "docker"
description = "Projekte rund um das Thema Docker"
date = "2017-09-04T21:03:00+02:00"
draft = false
weight = 20
+++

## Docker

Docker ist eine Art Virualisierung, jedoch nicht von kompletten PCs wie bei den [Virluellen Maschinen](https://de.wikipedia.org/wiki/Virtuelle_Maschine) [VMWare](https://de.wikipedia.org/wiki/VMware) oder [VirtualBox](https://de.wikipedia.org/wiki/VirtualBox), sondern von Software und hieren Diensten. Dabei wird ein einzelnes Programm oder ein Dienst und **alle** dazu nötigen Unterprogramme zu einem Paket, dem so genannten Conteiner, zusammengeafasst und von anderen Programmen auf dem PC isoliert. Man spricht daher auch von [Containervirtualisierung](https://de.wikipedia.org/wiki/Containervirtualisierung) bzw. Anwendungsvirutalisierung.  
Die Verwendung dieser Conainer macht die In- und Deinstallation, sowie dier Verteilung und Bereitstellung für mehrere PCs sehr einfach.

Glücklischer weise gibt es inzwischen Docker auch für den Raspian Pi, so dass mann Container, deren Verwaltung und sogar Verbünde meherere Pis zu einem Schwarm ausprobieren kann.
Hat es nicht geklappt reciht ein remove und die Pi ist wieder sauber.

Wie man den [Pi Installiert und erste Einstellungen]({{< ref "rpi/configuration.md">}}) vornimmt, habe ich bereits beschrieben.

LINK: [Einführung in docker](https://jaxenter.de/docker-swarm-einfuehrung-65263)

### Installation und Projekte mit Docker

{{%children style="h2" description="true"%}}