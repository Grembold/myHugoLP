+++
title = "certbot-rpi"
description = "Raspberry Pi compatible Docker base image with Let´s Encrypt"
date = "2017-09-06T21:00:00+02:00"
draft = false
weight = 20
+++

Um sein aktuelles SSL-Zertifikat für meine Webseite zu erhalten, ist es am einfachsten auf ein vorhandenes Docker Image zurückzugreifen.

## Was ist [Let´s Encrypt](https://letsencrypt.org/)?
Let´s Encrypt ist eine Zertifizierungsstelle die die erstellung von kostenlosen TLS-Zertifikaten anbietet. Ziel des Projektes ist es, jeden Internetdienst eine einfache Verschlüsselung anbieten kann.
Dabei ist der Prozess zur erstellung des Zertifikats über den so genannten certbot automatisiert.

[certbot-rpi on DockerHub](https://hub.docker.com/r/bcecchinato/certbot-rpi/)
[certbot-rpi on GitHub](https://github.com/bcecchinato/certbot-rpi)

Hier eine kurze anleitung, wie das Docker Image verwendet wird.

### Pull des Image
    docker pull pull bcecchinato/certbot-rpi

### Aktuelle Version von Let´s Encrypt certbot abrufen
    docker run -it --rm bcecchinato/certbot-rpi --help
