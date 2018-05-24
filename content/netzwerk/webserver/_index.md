---
title:          "WebServer"
description:    "Einen Webserver mit NginX einrichten"
date:           2017-09-14T18:00:00Z
draft:          true
weight:         30
---

Hugo Blog

Fhem

SmartVisu

WebCluster mit Docker Swarm

Monitoren wie lange der eingene Server verfügbar war
Beispiel [trashserver.net](https://status.trashserver.net/)
[UpTimeRobot](https://uptimerobot.com/)

----
[Web Server Survey](https://news.netcraft.com/archives/2017/08/29/august-2017-web-server-survey.html)


----
(FreeFileSync)[https://www.freefilesync.org/] solte ich mir mal ansehen, um die Daten mit der NAS bazugleichen.

So, damit ich das nicht immer wieder vergesse.
Im Repository dieser webseite sind die Themes als git submoldule eingebunden.
Damit die aktuallisiert werden , muss folgenden ausgeführt werden

    git submodule foreach git pull


Will man ein neues theme hinzufügen, som muss man mit
    $ git submodule add https://github.com/sethmacleod/docdock.git themes/docock
in das eigene repository laden und anschließend in die initgit.sh integrieren
    $ git submodule init
    $ git submodule update