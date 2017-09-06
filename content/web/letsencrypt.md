+++
title = "Let´s Encrypt"
description = "Mit Let´s Encrypt ein Zertifikat erstellen"
date = "2017-09-06T21:00:00+02:00"
draft = true
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
    -v /home/pi/myHugoLP/public:/var/www/ \
    -v /home/pi/nginx-proxy/certs:/etc/letsencrypt --name certbot bcecchinato/certbot-rpi \
    certonly --webroot -w /var/www/ -d meineDomain.de -d www.meineDomain.de



Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator webroot, Installer None
Enter email address (used for urgent renewal and security notices) (Enter 'c' to
cancel): 

-------------------------------------------------------------------------------
Please read the Terms of Service at
https://letsencrypt.org/documents/LE-SA-v1.1.1-August-1-2016.pdf. You must agree
in order to register with the ACME server at
https://acme-v01.api.letsencrypt.org/directory
-------------------------------------------------------------------------------
(A)gree/(C)ancel: A

-------------------------------------------------------------------------------
Would you be willing to share your email address with the Electronic Frontier
Foundation, a founding partner of the Let's Encrypt project and the non-profit
organization that develops Certbot? We'd like to send you email about EFF and
our work to encrypt the web, protect its users and defend digital rights.
-------------------------------------------------------------------------------
(Y)es/(N)o: N
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for meineDomain.de
Using the webroot path /var/www for all unmatched domains.
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/meineDomain.de/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/meineDomain.de/privkey.pem
   Your cert will expire on 2017-12-01. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le


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

