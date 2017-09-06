+++
title = "rpi-hugo"
description = "hugo docker image für raspberry pi"
date = "2017-09-04T21:03:00+02:00"
draft = false
weight = 10
+++

# Docker Image mit Hugo v2.6 für Raspberry pi
Unter [DockerHub] finden sich jede Menge gut images für Docker. Darunter finden sich auch einige, die bereits für den Raspberry übersetzt wurden, denn standartmäßig ist alles nur für Linux 64bit systeme gedacht.
Die Gruppe [hypriot](https://blog.hypriot.com) hat schon seit einigen Jahren sich mit dem Thema Docker ung Raspberry auseinander gesetzt.
So findet sich unter [dockerhub/hypriot](https://hub.docker.com/u/hypriot/) einige tolle repos.

Darunter war auch ein repo für [hypriot/rpi-hugo](https://hub.docker.com/r/hypriot/rpi-hugo/) . Doch leider musste ich schnell feststellen, dass es zu alt ist und seit zwei Jaren auf Version 0.14 stehengeblieben ist.
Zum Glück ist alles open-Source und so fand sich im Github reousitory alle nötigen dateien um ein neues image mit version v2.6 zu erstellen.
Damit auch andere user etwas davon haben, habe ich es unter [grembold/rpi-hugo](grembold/rpi-hugo) wieder in DockerHub abgelegt. 

Hier die wichtigsten befehle für das rpi-hugo repo:

### hugo webseite initialisieren
    mkdir myblog && cd myblog
    docker run -rm -v $(pwd):/www grembold/rpi-hugo new site .

Mit dem ersten Befehl wird ein Verzeichniss erstellt, dindem später alle Dateien für die Webseite gesammelt werden.
Mit dem zweiten Befehl wird das docker image ausgeführt und hugo erstellt im aktuellen Verzeichniss alle nöätigen Dateien und Ordner.
Der Befehl `-rm` löscht den container nach dem ausführen gleich wieder. Mit `-v $(pwd):/www` wird das aktuelle Arbeitsverzeichniss als Volume in den docker container eingehängt. 
Die kryptische Anweisung `$(pwd)` ist dabei eine Umgebungsvariable von linux. Mit `echo $(pwd)` kann man sich den Inhalt anzeigen lassen.

### hugo webseite generieren
    docker run -rm -v $(pwd):/www grembold/rpi-hugo

Dieser Befehl generiert nun aus den Inhalten unter myblog/content/ die HTML-Seiten und legt alle benötigten daten unter myblog/public ab.


### hugo webseite testen
    docker run -d -p 1313:1313 -v $(pwd):/www hypriot/rpi-hugo server -b http://<ip-of-your-rpi>/ --bind=0.0.0.0 -w -D

Hiermit lässt sich die Webseite vorher einmal testen. Dabei werden durch die Option `-D` auch Seiten generiert die noch als Entwurf `draft=true`gekennzeichnet sind generiert.

