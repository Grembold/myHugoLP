+++
title = "HTTP Proxy"
description = "HTTP-Anfragen an andere Server weiterleiten."
date = "2017-09-12T16:35:00+02:00"
draft = false
weight = 50
+++

Das nginx-Modul `ngx_http_proxy_module` erlaubt es anfragen an andere Server weiterzuleiten.

## Beispielkonfiguration

location / {
    proxy_pass       http://localhost:8000;
    proxy_set_header Host      $host;
    proxy_set_header X-Real-IP $remote_addr;
}

 ## proxy_pass
`proxy_pass` legt das Protokoll und die Adresse eines Proxy-Servers und einer optionalen URI fest, an den ein Standort abgebildet/gemapped werden soll. Als Protokoll können "http" oder "https" angegeben werden. Die Adresse kann als Domain Name oder IP-Adresse angegeben werden und ein optionaler Port:

    proxy_pass http://localhost:8000/uri/;

oder als UNIX-Domain-Socket-Pfad, der nach dem Wort "Unix" angegeben und in Doppelpunkte eingeschlossen ist:

    proxy_pass http://unix:/tmp/backend.socket:/uri/;

Wenn ein Domain-Name auf mehrere Adressen auflöst, werden alle in einer Round-Robin-Methode verwendet. Zusätzlich kann eine Adresse als [Servergruppe](http://nginx.org/en/docs/http/ngx_http_upstream_module.html) angegeben werden.

Parameterwert kann Variablen enthalten. In diesem Fall wird, wenn eine Adresse als Domänenname angegeben wird, der Name unter den beschriebenen Servergruppen durchsucht und, falls nicht gefunden, mit einem Resolver ermittelt.

Ein Anforderungs-URI wird wie folgt an den Server übergeben:

* Wenn die Proxy_pass-Direktive mit einem URI angegeben wird, wird dann, wenn eine Anforderung an den Server übergeben wird, der Teil eines normalisierten Anforderungs-URI, der mit dem Standort übereinstimmt, durch einen URI ersetzt, der in der Anweisung angegeben ist:

    location /name/ {
        proxy_pass http://127.0.0.1/remote/;
    }

* Wenn proxy_pass ohne einen URI angegeben wird, wird der Anforderungs-URI an den Server in der gleichen Form übermittelt, wie er von einem Client gesendet wird, wenn die ursprüngliche Anforderung verarbeitet wird, oder die vollständige normalisierte Anforderungs-URI wird bei der Verarbeitung des geänderten URI übergeben:

    location /some/path/ {
        proxy_pass http://127.0.0.1;
    }

## proxy_set_header
Ermöglicht das Neudefinieren oder Anfügen von Feldern an den an den Proxy-Server übergebenen Anforderungs-Header. Der *Wert* kann Text, Variablen und deren Kombinationen enthalten. Diese Richtlinien werden von der vorherigen Ebene geerbt, wenn und nur wenn keine `proxy_set_header`-Direktiven auf der aktuellen Ebene definiert sind. Standardmäßig sind nur zwei Felder neu definiert:

    proxy_set_header Host       $proxy_host;
    proxy_set_header Connection close;

Wenn das Caching aktiviert ist, werden die Header-Felder "If-Modified-Since", "If-Unmodified-Since", "If-None-Match", "If-Match", "Range" und "If-Range" von der ursprüngliche Anforderung nicht an den Proxy-Server weitergegeben.

Ein unverändertes "Host" -Anforderungs-Header-Feld kann wie folgt übergeben werden:

    proxy_set_header Host       $http_host;

Wenn dieses Feld jedoch nicht in einem Client-Request-Header vorhanden ist, wird nichts übergeben. In einem solchen Fall ist es besser, die Variable $ host zu verwenden - ihr Wert entspricht dem Servernamen im Feld "Host" -Anforderungsheader oder dem primären Servernamen, falls dieses Feld nicht vorhanden ist:

    proxy_set_header Host       $host;

Zusätzlich kann der Servername zusammen mit dem Port des Proxy-Servers übergeben werden:

    proxy_set_header Host       $host:$proxy_port;

Wenn der Wert eines Header-Feldes eine leere Zeichenfolge ist, wird dieses Feld nicht an einen Proxy-Server weitergegeben:

    proxy_set_header Accept-Encoding "";


## proxy_redirect

Setzt den Text, der in den Headerfeldern "Location" und "Refresh" geändert werden soll. Angenommen, ein Proxy-Server hat das Header-Feld ` "Location: http://localhost:8000/two/some/uri/"` zurückgegeben. Die Direktive

    proxy_redirect http://localhost:8000/two/ http://frontend/one/;

wird diese Zeichenfolge auf `"Location: http://frontend/one/some/uri/"` umschreiben.
***
Ein Servername kann in der Ersatzzeichenfolge weggelassen werden:

    proxy_redirect http://localhost:8000/two/ /;

dann wird der Name des primären Servers und der Port, falls abweichend von 80, eingefügt.
***
Die Standardersetzung, die durch den `default` angegeben wird, verwendet die Parameter der `location`- und `proxy_pass`-Direktiven. Daher sind die beiden folgenden Konfigurationen äquivalent:

    location /one/ {
        proxy_pass     http://upstream:port/two/;
        proxy_redirect default;
    location /one/ {
        proxy_pass     http://upstream:port/two/;
        proxy_redirect http://upstream:port/two/ /one/;
Der Standardparameter ist nicht zulässig, wenn proxy_pass mit Variablen angegeben wird.

***
Ein Ersatzstring kann Variablen enthalten:

    proxy_redirect http://localhost:8000/ http://$host:$server_port/;

Eine Umleitung kann auch (1.1.11) Variablen enthalten:

proxy_redirect http: // $ proxy_host: 8000 / /;
Die Richtlinie kann mit regulären Ausdrücken (1.1.11) angegeben werden. In diesem Fall sollte die Umleitung entweder mit dem "~" - Symbol für eine Groß- / Kleinschreibung oder mit den "~ *" - Symbolen für die Groß- / Kleinschreibung beginnen. Der reguläre Ausdruck kann benannte und positionale Erfassungen enthalten, und der Ersatz kann sie verweisen:

    proxy_redirect ~^(http://[^:]+):\d+(/.+)$ $1$2;
    proxy_redirect ~*/user/([^/]+)/(.+)$      http://$1.example.com/$2;

Es könnte mehrere proxy_redirect Richtlinien geben:

    proxy_redirect default;
    proxy_redirect http://localhost:8000/ /;
    proxy_redirect http://www.example.com/ /;

Der Aus-Parameter hebt den Effekt aller proxy_redirect-Direktiven auf der aktuellen Ebene auf:

    proxy_redirect aus;
    proxy_redirect default;
    proxy_redirect http://localhost:8000/ /;
    proxy_redirect http://www.example.com/ /;
Mit dieser Anweisung ist es auch möglich, Hostnamen zu relativen Weiterleitungen hinzuzufügen, die von einem Proxy-Server ausgegeben werden:

    proxy_redirect / /;