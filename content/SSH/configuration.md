+++
title = "Konfiguration"
description = ""
weight = 2
+++

Um sich mit dem pi zu verbinden, ohne ein passwort eingeben zu m�ssen. Muss zun�chst eine Verschl�sselung eingerichtet werden.
Hierzu gibt es je Verbindung einen �ffentlichen und einen privaten schl�ssel.
Der �ffentliche Schl�ssel muss auf dem pi hinterlegt werden, wohingegen der private auf dem PC/Ger�t verbleibt mit dem die Verbindung zu pi aufgebaut werden soll.

Zum generieren der Schl�ssel gibt es verschiedene m�glichkeiten

### Schl�ssen mit "putty" erstelen.
In der Programmsammlung von [putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/releases/0.70.html) ist auch ein Key-Generator enthalte 'puttygen.exe'.
Mit diesem l�sst sich ein �ffentlicher (kommte auf den pi) und ein privater (verbleibt auf dem Ger�t) erstellt werden.

### �ffentlichen Schl�ssel auf pi �bertragen
Zun�chst m�ssen wir und auf dem pi mit dem Benutzer anmelder, unter dem sp�ter auch die Verbindung laufen soll.
In unserem Fall melden wir auns also unter pi an.
F�r diesen Benutzer m�ssen wir zun�chst in seinem Homeverzeichniss einen Ordner und eine Datei erstellen.

{mkdir ~/.ssh}
{touch ~/.ssh/authorized_keys}

Jetzt �ffnen wir diesen datei {nano ~/.ssh/authorized_keys} und kopieren den Inhal des public key hinein. Dabei m�ssen wir darauf achten, dass alles in einer Zeile geschrieben steht.



F�r Olaf  mit {'--text'} l�st sich ein Befehl f�r copy-und paste freigeben.

