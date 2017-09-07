+++
title = "Let´s Encrypt"
description = "Mit Let´s Encrypt ein Zertifikat erstellen"
date = "2017-09-06T21:00:00+02:00"
draft = false
weight = 20
+++

### certbot installieren
Wie das Docker image isntalleirt wird habe ich bereits [hier]{{< relref "docker/certbot.md" >}} beschrieben. Nun geht es darum ein Zertifikat für die eigene Daomein zu erhalten.

### Let´s Encrypt Zertifikate für nginx installieren

{{% alert theme="warning" %}}Erst wenn Sie sicher sind, dass alles klappt, entfernen Sie zuletzt die Option --staging und wiederholen das Kommando nochmals zur Installation der endgültigen Zertifikate.{{% /alert %}}

Das Abrufen der Zertifikate läuft folgender massen ab:
* Der eigene Webserver läuft und ist unter meineDomain:80 erreichbar.
* Certbot erstell im www-Verzeichniss des Servers einen versteckten Ordner `.well-known` und einige Dateien
* certbot prüft bei Let´s Encrypt, ob diese Dateien errecihbar sind.
* ist dies erfogreich, wird das Zertifikat unter `/etc/letsencrypt/meineDomain`abgelegt.

Damit dies nun über das Docker Image funktioniert, müssen wir diesem zwei Verzeichnisse mitgeben. Das erste ist das www-Verzeichniss vom Webserver und das zweite ein verzeichniss, indem der certbot die erstellten Zertifikate ablegen kann.


    docker run --rm -v $CERTS_DIR:/etc/letsencrypt -p 80:80 --name certbot napnap75/rpi-certbot:latest certbot certonly --standalone --standalone-supported-challenges http-01 -t -n --agree-tos -m $EMAIL -d $HOST

Startet den certbot im "interaktiven" modus  
    docker run -it --rm \
    -v /home/pi/magic-broccoli/public:/var/www/ \
    -v /home/pi/nginx-proxy/certs:/etc/letsencrypt --name certbot bcecchinato/certbot-rpi \
    certonly --webroot -w /var/www/ -d blume.goip.de -d doc.blume.goip.de -d dev.blume.goip.de


### Zertifikat und Konfiguration testen
HTTPS-Konfiguration noch über die Seite https://www.ssllabs.com prüfen lassen.


### Zertifikate automatisch erneuern lassen

 "Volumes": {
                "/etc/letsencrypt": {},
                "/sys/fs/cgroup": {},
                "/var/lib/letsencrypt": {}



### Quellen
* https://letsencrypt.org/
* https://certbot.eff.org/docs
* https://certbot.eff.org/#debianjessie-nginx
* https://kofler.info/lets-encrypt-zertifikate-fuer-web-und-mail-unter-ubuntu-16-04/
* https://blog.doenselmann.com/nginx-und-lets-encrypt-auf-raspberry-pi/

