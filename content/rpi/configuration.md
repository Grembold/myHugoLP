+++
title = "SSH Konfiguration"
description = ""
weight = 2
+++

Um sich mit dem pi zu verbinden, ohne ein passwort eingeben zu müssen. Muss zunächst eine Verschlüsselung eingerichtet werden.
Hierzu gibt es je Verbindung einen öffentlichen und einen privaten schlüssel.
Der öffentliche Schlüssel muss auf dem pi hinterlegt werden, wohingegen der private auf dem PC/Gerät verbleibt mit dem die Verbindung zu pi aufgebaut werden soll.

Zum generieren der Schlüssel gibt es verschiedene möglichkeiten

### Schlüssen mit "putty" erstelen.
In der Programmsammlung von [putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/releases/0.70.html) ist auch ein Key-Generator enthalte 'puttygen.exe'.
Mit diesem lässt sich ein öffentlicher (kommte auf den pi) und ein privater (verbleibt auf dem Gerät) erstellt werden.

### öffentlichen Schlüssel auf pi übertragen
Zunächst müssen wir und auf dem pi mit dem Benutzer anmelder, unter dem später auch die Verbindung laufen soll.
In unserem Fall melden wir auns also unter pi an.
Für diesen Benutzer müssen wir zunächst in seinem Homeverzeichniss einen Ordner und eine Datei erstellen.

	mkdir ~/.ssh
	touch ~/.ssh/authorized_keys
	nano ~/.ssh/authorized_keys

Mit dem letzten Befehl öffnen wir diesen Datei und kopieren den Inhal des public key hinein. Dabei müssen wir darauf achten, dass alles in einer Zeile geschrieben steht.