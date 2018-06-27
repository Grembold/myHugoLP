+++
title = "Rpi einrichten"
description = "Grundkonfiguration des Pi"
draft = false
weight = 10
#alwaysopen = true
date = "2017-09-08T16:35:00+02:00"
+++
# Grundkonfiguration

Der erste Schritt für jeden Pi ist ersteinmal das Raspbian image auf eine SD-Karte zu spielen.
Da es hierzu unzälige anleitungen gibt, sei es hier nur erwähnt und abgehakt.

* [x] Betriebssystem auf SD-Karte spielen

Der zweite Schritt ist die raspi-config Erste einstellungen vornehmen

    sudo raspi-config

* [x] Passwort des users pi ändern
  + `2 change user password`
* [x] Dateisystem erweitern
  + `9 Advanced Options`
    - `A1 Expand filesstem`
* [x] Boot-Option auswählen
  + `3 Boot Options`
    - `B1 Console`
* [x] Sprach- und Zeiteinstellungen
  + `#4 Internationalisation Options`
    - `I1 Change Local`
    - `[x] de_DE.UTF-8 UTF-8 aktivieren`
    - `[ ] en_EN... deaktivieren`
    - `de_DE als default`
    - `I2 Change Timezone`
    - `Europe -> Berlin`
* [x] Hostname ändern
  + `9 Advanced Options`
    - `A2 Hostname`

Zum Schluss lässtig, aber wichtig, der reboot.

    sudo reboot

## Teil 2 - SSH-Schlüssel neu erstellen

Da wir ein frisches Image verwendet haben und dies alle im Internet verwenden, ist auch der SSH fingerprint bei alles gleich. Also lassen wir diesen einmal neu erstellen

    :::shell
    sudo rm /etc/ssh/ssh_host_*
    sudo dpkg-reconfigure openssh-server
    sudo service ssh restart

## Teil 3 - Software-Aktualisierung

    :::shell
    sudo apt update
    sudo apt upgrade
    sudo reboot

## Teil 4 - RPI Firmware / Linux kernel aktualisieren

Anzeige der aktuellen Linux version
    uname -a
Anzeige der Hardware
    sudo cat /proc/device-tree/model
Update

    :::shell
    sudo rpi-update
    sudo reboot

Sollte von jessy auf stretch gewechselt werden, so müssen die Paketquellen entsprechend angepasst werden. [Siehe hier](https://www.elektronik-kompendium.de/sites/raspberry-pi/2204031.htm)

    sudo nano /etc/apt/sources.list
        deb http://raspbian.raspberrypi.org/raspbian/ stretch main contrib non-free rpi

## Teil 5 - Swap deaktivieren

[Swapping beim Raspberry pi deaktivieren](https://www.elektronik-kompendium.de/sites/raspberry-pi/2002131.htm)
> Speziell beim Raspberry Pi ist Swapping eigentlich kontraproduktiv. Swapping erhöht die Anzahl der Schreibzugriffe auf ein Speichermedium, auf dem sich der Swap-Speicher befindet. Das Betriebssystem und der Swap-Speicher befindet sich beim Raspberry Pi auf einer SD-Card, die nur eine begrenzte Anzahl an Schreibzugriffen verträgt, bevor einzelne Speicherzellen kaputt gehen. SD-Cards eignen sich überhaupt nicht zum Swapping.
> Ein weiterer Grund auf Swapping zu verzichten ist die begrenzte Geschwindigkeit der SD-Card. Das macht das Swapping auf dem Raspberry Pi auch noch langsam.
> Auch SSDs verkraften nur eine begrenzte Anzahl von Schreibzyklen. Auf eine SSD oder SD-Card zu swappen reduziert deren Lebensdauer und kann zu vorzeitigem Datenverlust führen

Zuerst stoppen des Swapping-Dienst

    sudo service dphys-swapfile stop

Anschließend prüfen wir, ob das Swapping abgeschaltet ist:

    free -h

Wenn die Zeile "Swap" nur noch "0"-Werte aufweist, können wir den Swap-Dienst deaktivieren.

    sudo systemctl disable dphys-swapfile

## Teil 6 - Logging in Arbeitsspeicher verschieben

Häufiges schreiben auf die SD-Karte kann dies vorzeitig zertören und im schliommsten fall die Installation unbrauchbar machen. Dies ist mir auch schon einige male in den Jahren passiert. Das Raspberry scheint noch normal zu funktionieren und die Dienste und Programme laufen noch, doch lässt die SD-Karte keine schreibenden Zugriff mehr zu und alle Änderungen sind nach einem Neustart wieder futsch.
Ein Teil im Raspberry der regelmäßig auf die SD-Karte schreibt sind die Dienste (Daemons). Alle abschalten wäre eine Möglichkeit, doch dann hat der Pi gar keine gunktion mehr :-).
Eine andere Möglichkeit ist das Logging-Verzeichniss auf einen anderen Datenträger auszulagern. Ein Speicher der sehr viele schreib-Zugriff verträgt ist der RAM und mit einer virtuellen Festplatte im RAM lässt dich das Logging-Verzeichnis dorthin verschieben.
Nun sind die Daten im RAM bekanntlicher weise nach einem Absturz/Neustart verloren und nun wären auch alle Logs verloren. Dies möchte man natürlich nicht und so erstellt man einen Dienst der regelmässig und beim ordendlichen herunterfahren/neustart alle Logs aus dem Arbeitsspeicher wieder auf die SD-Karte schreibt. Hierdurch wird der schreibzugriff aud die SD-Karte erheblich reduziert.

{%alert%}
In einigen Blogs und Seiten wird das Tool `ramlog` verwednet. Ich musste aber feststellen, dasss es mit der Debian Version Stretch nicht mehr funktioniert. Also `ramlog`und `strechts` sind nicht kompatiebel.{%alert%}

Am einfachsten war für mich das tool [`log2ram`](https://github.com/azlux/log2ram), dessen isntallation auf dem Raspberry ich hier aufführe.

    curl -Lo log2ram.tar.gz https://github.com/azlux/log2ram/archive/master.tar.gz
    tar xf log2ram.tar.gz
    cd log2ram-master
    chmod +x install.sh && sudo ./install.sh
    cd ..
    rm -r log2ram-master

    sudo reboot

Quelle: https://github.com/azlux/log2ram