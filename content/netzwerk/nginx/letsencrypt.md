+++
title = "Let´s Encrypt"
description = "Mit Let´s Encrypt ein Zertifikat erstellen"
date = "2017-09-06T21:00:00+02:00"
draft = false
weight = 20

# Type of content, set "slide" to display it fullscreen with reveal.js
type="page"

# Creator's Display name
creatordisplayname = "Olaf Blume"
# Creator's Email
creatoremail = "olaf-petersen@gmx.com"
# LastModifier's Display name
lastmodifierdisplayname = "Olaf Blume"
# LastModifier's Email
lastmodifieremail = "olaf-petersen@gmx.com"
+++



### certbot installieren
Wie das Docker image installiert wird habe ich bereits [hier]{{< relref "docker/certbot.md" >}} beschrieben. Nun geht es darum ein Zertifikat für die eigene Domain zu erhalten.

### Let´s Encrypt Zertifikate für nginx installieren

{{% alert theme="warning" %}}Erst wenn Sie sicher sind, dass alles klappt, entfernen Sie zuletzt die Option --staging und wiederholen das Kommando nochmals zur Installation der endgültigen Zertifikate.{{% /alert %}}

Das Abrufen der Zertifikate läuft folgender massen ab:
* Der eigene Webserver läuft und ist unter meineDomain:80 erreichbar.
* Certbot erstell im www-Verzeichnis des Servers einen versteckten Ordner `.well-known` und einige Dateien
* certbot prüft bei Let´s Encrypt, ob diese Dateien erreichbar sind.
* ist dies erfolgreich, wird das Zertifikat unter `/etc/letsencrypt/meineDomain`abgelegt.

Damit dies nun über das Docker Image funktioniert, müssen wir diesem zwei Verzeichnisse mitgeben. Das erste ist das WWW-Verzeichnis vom Webserver und das zweite ein Verzeichnis, indem der certbot die erstellten Zertifikate ablegen kann.

	docker run --rm -v $CERTS_DIR:/etc/letsencrypt -p 80:80 --name certbot napnap75/rpi-certbot:latest certbot certonly --standalone --standalone-supported-challenges http-01 -t -n --agree-tos -m $EMAIL -d $HOST

  
Startet den certbot im "interaktiven" modus

	docker run -it --rm \
	-v /home/pi/magic-broccoli/public:/var/www/ \
	-v /home/pi/nginx-proxy/certs:/etc/letsencrypt --name certbot bcecchinato/certbot-rpi \
	certonly --webroot -w /var/www/ -d blume.goip.de -d www.blume.goip.de -d doc.blume.goip.de


### Zertifikat und Konfiguration testen
HTTPS-Konfiguration noch über die Seite https://www.ssllabs.com prüfen lassen.

### Zertifikate automatisch erneuern lassen  

	"Volumes": {
				"/etc/letsencrypt": {},
				"/sys/fs/cgroup": {},
				"/var/lib/letsencrypt": {}


### Zertifikate sichern
Nun hat man es endlich geschafft und hält die eigenen TLS-Zertifikate in der Hand ... naja im Ordner. Doch Wo legt man diese hin, damit sie nicht verloren gehen. Sicher man kann sich ja jetzt jeder Zeit wieder neue machen und spätestens nach 3 Monaten ist dies auch nötig, doch möchte man das ein kleines `certbot renew`reicht und man nicht alles von vorn machen muss.
Der Certbot hat alles nötige in ein Verzeichnis gepackt, dies müssten wir nur noch zippen und fertig, ... doch ganz so leicht ist es dann doch nicht.
Die Zertifikate und ordner sind nur für den root lesbar und sollten es auch bleiben. Mit einem einfachen Zip würden die Benutzerrechte verloren gehen. Daher muss das Verzeichnis zunächst mit tar als eine Datei zusammenfasst werden und kann handlich komprimiert werden. 

	sudo tar cf - certs/ | 7z a -si blume.goip.de.cert.20170908.7z


Das Entpacken eines solchen Archives läuft dann wieder in umgekehrter Reihenfolge ab (`Achtung`: Das Zielverzeichnis ZIELPFAD muss vorhanden sein!):

	sudo 7za x -so ERGEBNIS.tar.7z | tar xf - -C ZIELPFAD --numeric-owner


### Quellen
* https://letsencrypt.org/
* https://certbot.eff.org/docs
* https://certbot.eff.org/#debianjessie-nginx
* https://kofler.info/lets-encrypt-zertifikate-fuer-web-und-mail-unter-ubuntu-16-04/
* https://blog.doenselmann.com/nginx-und-lets-encrypt-auf-raspberry-pi/

