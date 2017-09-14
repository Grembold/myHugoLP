+++
title = "Server Ports und Namen"
description = "Wie NginX entscheidet, welcher Server den Request bearbeiten soll."
date = "2017-09-12T16:35:00+02:00"
draft = false
weight = 30
+++

### Virtuelle Server mit Namen
Also NginX (gesprochen engine X) horcht auf verschiedene Port und bearbeitet die etsprechenden anfragen.
Hier für nginx in einer Konfigurationsdatei mitgeteilt auf welche Ports er horchen und wie reagieren soll. Hier ein einfachen Beispiel, bei dem 3 mal auf port*:80 gehorcht wird:

    server {
        listen      80;
        server_name example.org www.example.org;
        ...
    }

    server {
        listen      80;
        server_name example.net www.example.net;
        ...
    }

    server {
        listen      80;
        server_name example.com www.example.com;
        ...
    }

Hier sind 3 Server konfiguriert, die alle auf port 80 hören (`listen  80;`. Danach ermittelt nginx anhand des Feld "Host" aus dem HTTP Anfrage-Header zu welchem Server (`server_name `) die Anfrage groutet werden soll. Wenn dieser Wert zu keinem server namen passt oder die anfrage keine header feld enthält, so leitet nginx die Anfrage an seinen standard server für diesen port. In dieser Konfiguration an den ersten - was das Standardverhalten von nginx ist.
Man kann mit dem parameter `default_server` in der `listen` Anweisung auch explizit festlegen, welcher der standard server sein soll.

    server {
        listen      80 default_server;
        server_name example.net www.example.net;
        ...
    }
{{% alert %}}
Beachte, dass der `default_server` Parameter von `listen`und nicht von `server_name`ist.{{% /alert %}}

###  So verhindern Sie Verarbeitungsanforderungen mit undefinierten Servernamen
Wenn der HTTP-Request ohne "Host" header feld nicht erlaubt sein soll, so kann ein server angelegt werden , der diese anfragen fallen lässt.

    server {
        listen      80;
        server_name "";
        return      444;
    }

Hier ist der Server-Name auf einen leeren String gesetzt worden, so dass er mit HTTP-Request ohne "Host" header Feld übereinstimmt und ein nginx spezischer return code 444 zurückgegeben und die verbindung geschlossen wird.