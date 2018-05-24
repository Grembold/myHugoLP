+++
title = "yum"
description = "yum ist der standard package manager für CentOS"
date = "2017-09-24T18:36:24+02:00"
draft = true
weight = 41
+++


### Pakete installieren
Installation von RPMs: `yum install Paketname`

### Pakete update (einzelnde bereits installierte)
Update einzelner Pakete (nur bereits installierte Pakete): `yum update Paketname`

### Update aller Pakete
Update aller auf dem System installierten Pakete: `yum update`

### Pakte entfernen
Entfernt ein Paket komplett: `yum remove Paketname` (Achtung: Dieser Befehl deinstalliert nicht nur das einzelne Paket, sondern auch seine Abhängigkeiten!)
Deinstallation eines Pakets: `yum erase Paketname`

### Pakete suchen
Sucht nach einem Paket: `yum search Suchwort`
Welches Paket enthält die Datei oder welches Feature ist vorhanden: `yum provides dateiname`
Gibt es dieses Paket überhaupt: `yum list *Suchwort*`

### Informationen anzeigen
Verfügbare Pakete anzeigen: `yum list available`
Updatebare Pakete anzeigen: `yum list updates`
Installiere Pakete anzeigen: `yum list installed`
Paketinformation: `yum info
Übersicht aller bekannten Repositories `yum repolist`

### Aufräumen
Heruntergeladene Pakete wieder löschen: `yum clean packages`
System aufräumen : `yum clean all`

### Links
Hier ein paar generelle Links zum Thema yum:
* https://www.administrator.de/wissen/mini-howto-paketmanager-yum-32.html
* http://www.fedorawiki.de/index.php?title=Yum
* http://www.phy.duke.edu/~rgb/General/yum_HOWTO/yum_HOWTO/
 
Systemupgrade über yum:
* http://www.fedorawiki.de/index.php/Systemupgrade_%C3%BCber_yum

RPMforge installieren (über 5000 Extrapakete for CentOS z.B. htop)
* http://wiki.centos.org/AdditionalResources/Repositories/RPMForge