+++
title = "RPi-Monitor"
description = "Anzeigen des aktuellen Gesundheits-Zustand des Rpi"
weight = 20
+++

Der aktuelle Zustand der eigenen Hinbeere lässt sich sehr schön über eine Web-Oberfläche anzeigen. Hierfür habe ich einige dieser Tools aufgeführt. Ausprobiert habe ich nur den RPI-Monitor, da er sehr einfach zu installieren war.  

## RPi Monitor
Das Tool von Xavier Berger lässt sich dank umfangreichen Installationsscript sehr leicht installieren. Dies ist auch das einzige Programm das ich sofort zum laufen gebracht habe.
Eine gute Anleitung zu Installation findet man  [hier](https://github.com/ioBroker/ioBroker/wiki/Raspberry-Pi:-RPi-Monitor-installieren) und [hier](https://jankarres.de/2013/11/raspberry-pi-rpi-monitor-installieren/)

* [RPi-Homepage](http://rpi-experiences.blogspot.de/)
* [GitHub Soruce](https://github.com/XavierBerger/RPi-Monitor)
* [GitHub deb Pakete](https://github.com/XavierBerger/RPi-Monitor-deb)

![rpi-monitor](/images/rpi-monitor.png)

## Raspcontrol
Raspcontrol ist ebenfalls ein web control center für den Raspberry pi.
Das Programm ist schon durch einige Hände gegangen und wird vom wahrscheinlich ursprünglichen Entwickler Bioshox nicht mehr gepflegt. [harmon25](https://github.com/harmon25/raspcontrol) hat das Projekt übernommen, doch der aktuellste Stand der Fork von [hdijkema](https://github.com/hdijkema/raspcontrol) zu sein.

Die Installation ist nicht ganz zu einfach wie beim RPi Monitor, lässt sich dennoch in 10 Minuten bewerkstelligen _... 2 Studen später ..._ dachte ich, aber irgendwie klappte es trotzdem nicht.

## Pi Control
Eine von Willy geschriebene Apache Aplikation als Gesundheitscheck des PI

* [pi-control.de](https://pi-control.de/)
* [Willy's Technik-Blog](https://willy-tech.de/)

## RasPi Check
RasPi Check ermöglicht die einfache und unkomplizierte Informationsabfrage eines Raspberry Pi vom Android Smartphone aus. Die App verwendet dabei sine SSH verbindung zum Pi.
Hierbei handelt es sich also um eine Android App und keine WEbseite wie beid den andere Programmen.

* [RasPi Check on Google play](https://play.google.com/store/apps/details?id=de.eidottermihi.raspicheck)
* [eidottermihi/rpicheck on GitHub](https://github.com/eidottermihi/rpicheck)

## eZ Server Monitor
ESM ist ein WebMonitor für alle möglichen Linux distributionen, u.a. auch für den RPi.
Die Anleitung auf der Homepage ist etwas knapp gehalten.

* [eZ Server Monitor](https://ezservermonitor.com/)