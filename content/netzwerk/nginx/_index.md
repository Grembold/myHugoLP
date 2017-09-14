---
title:          "NginX Revers-Proxy"
description:    "NginX als Revers-Proxy einrichten"
date:           "2017-09-11T16:35:00+02:00"
draft:          false
weight:         20
---

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

