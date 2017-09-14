+++
title = "IT-Struktur"
description = "Übersicht des Datenfluss rund ums Web"
date = "2017-09-08T16:35:00+02:00"
draft = false
weight = 10
+++


## Datenfluss
Unter IT-Struktur zeige ich, wie ich mein Netzwerk und den Datenfluss für die "öffentlich" erreichbaren teile aufgebaut habe.

![netzstruktur](/images/netzstruktur.png)

Ich habe einen ganz normalen Internet-Anschluss mit einer Fritzbox und ein paar *Servern* (meist RaspberryPi) auf der anderen Seite.  
Da sich die öffentliche IP-Adresse der Fritzbox täglich ändert, habe ich mich bei einem dynDNS anbieter angemeldet und bis so über blume.goip.de immer erreichbar.



die Fritzbox so konfiguriert, dass die weiterleitung über einen Domainnamen erfolgt.

#### Kostenlose DynDNS Anbieter aus Deutschland
* goip.de
* ddnss.de




### Quellen
* [autrunk@wordpress](https://autrunk.wordpress.com/2016/11/14/set-up-nginx-as-reverse-proxy-with-caching/)
* [antiun](https://antiun.github.io/odoo-reverse-proxy-howto/#slide-3)
* [codingpedia](http://www.codingpedia.org/ama/how-to-configure-nginx-in-production-to-serve-angular-app-and-reverse-proxy-nodejs)


{{%children style="h2" description="true"%}}

