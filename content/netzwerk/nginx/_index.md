---
title:          "Revers-Proxy"
description:    "NginX als Revers-Proxy einrichten"
date:           "2017-09-11T16:35:00+02:00"
draft:          false
weight:         20
---

Damit ich verschiedene Dienste oder Webseiten unter einer Domain erreichen und zentral absichern kann, gehen alle Anfragen zunächst an einen nginx revers-proxy. Dieser leitet http Anfragen an verschiedene Server dahinter weiter. Dies bedeutet, das zu Beispiel (www.blume.goip.de) an einen anderen Server weitergeleitet wird als (doc.blume.goip.de) oder (dev.blume.goip.de/gitlab/).  
Unter der URL blume.goip.de wird zum beispiel eine statische Webseite aufgerufen, die nur aus einer Seite besteht. Dies erledigt der WebServer 1 (WEB01).  
Unter der URL doc.blume.goip.de wird zum Beispiele diese Dokumentation aufgerufen, was wiederum Webserver 2 (WEB02) erledigt.   
Da so gut wie jedes Gerät im Heimischen Netzwerk heutzutage eine Webseite hat, könnte man damit auch den eigenen NAS, eine Hausautomatisierung oder die Webseite des Drucker aus dem Internet erreichbar machen.

## NginX als Revers proxy einrichten

@Olaf: hier geht es weiter

[Nginx als Reverse Proxy / Load Balancer](https://jmcblog.de/2012/04/23/nginx-als-reverse-proxy-load-balancer/)

{{%children style="h2" description="true"%}}


### logging für favicon.ico

    location = /favicon.ico {
        log_not_found off;
        access_log off;
    }

* [1](https://decatec.de/home-server/zweite-web-anwendung-neben-owncloudnextcloud-einrichten-am-beispiel-wordpress/)
* [2](https://bob.gatsmas.de/articles/nginx-konfiguration-owncloud-im-unterordner-des-webroot-betreiben)
* [3](http://www.netz39.de/2014/installation-of-wordpress-in-a-subdirectory-with-nginx/)

#### .

