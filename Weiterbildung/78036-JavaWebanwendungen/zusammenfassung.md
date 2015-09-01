# 1. Einführung in Java-Webanwendungen

[toc]

## 1.2 Einführung

Übersicht über Internetanwendungen

- *Netzwerkanwendungen* - Verwenden `TCP/IP` Protokoll zur Datenübertragung; Kommunikation kann über ein höheres Protokoll(z.B. `FTP`) abgewickelt werden
- *Peer-to-Peer* - Rechner im Netzwerk sind  gleichberechtigt; Arbeiten als Server una Client
- *Webanwendungen* - Zugriff über Browser; Angeworderte Information lieft auf dem Server
- *Webservices* - stellt einen Dienstfür den Client bereit; Webservices können unabhängig vom Client entwickelt werden und ihre Dienste zur Verfügung stellen

Webanwendungen sind:

- plattformübergreifend
- zustandslos - ohne dauerhafte Verbindung vom Client zum Server
- dynamisch

>**Webanwendungen** werden über das Netzwerk (z.B. Internet) ausgeführt. *Clientseitig* kommt ein Browser zum Einsatz. *Serverseitig* werden Webseiten je nach Anfrage dynamisch generiert und an den Client zurückgesendet.

Typische Webanwendungen sind:

- Durchführung von Bestellungen/Online-Warenhaus (Kinokarten, Amazon)
- Durchführung von Auktionen (ebay)
- Online-Banking
- Online-Kurse mit Prüfungsfragen und Auswertung
- Kataloge mit Such- und Bestellfunktion
- Informationsdarstellung (Aktienkurse, Wettervorhersage)

## 1.3 Technologieüberblick

- Die Basis zur Kommunikation und Datenübertragung von Webseiten ist das `HTTP`-Protokoll
- `HTTP`-Protokoll basiert auf `TCP/IP` und verwendet Port 80(standardmäßig)
- `URL` (*Uniform Resource Locator*) besteht aus:
  - Übertragungsprotokoll
  - Subdomain
  - Domainname
  - Top Level Domain
  - Portnummer
  - Verzeichnis
  - Datei
  - Parameter

-  `HTTP`-Request und eine `HTTP`-Response  bestehen aus Header und Inhaltsteil
- Header enthält Informationen über Cookies, Länge des Inhalts, Browser-Informationen und Autorisierungsdaten
- `HTTP`-Request besteht aus: 
  - `HTTP`-Methode
  - `URL`
  - Header
  - optional weiteren zu sendenden Daten

- `HTTP`-Methode legt fest, wie Daten an den Server übermittelt werden
	- `POST` - keine Längen beschränkung; Übertragung über Entity-Bereich[^1]
	- `GET` - Längen Beschränkung; Übergaber über URL Paramter
	- `HEAD`

- `HTTP`-Response - besteht aus Rückgabewert, Header und dem Entity-Bereich[^1]


Wichtige `HTTP`-Codes 
Mehr Informationen zu Fehlercodes[^2]

Rückgabewert|Beschreibung
:--:|:--
200 |Alles in Ordnung
302 |Moved Temporarily - die angeforderten Daten wurden vorübergehend zu einem anderen URI verschoben.
400 |Bad Request - Anfrage vom Server nicht verstanden
401 |Unauthorized - keine Berechtigung
403 |Forbidden - kein Zugriff
404 |NotFound - nicht gefunden
500 |InternalServerError - interner Serverfehler
503 |Service Unavailable - nicht verfügbar



Möglichkeiten zur Erstellung dynamischer Webseiten:

- `CGI` (*Common Gateway Interface*) 
- `Perl
- `PHP`
- `ASP` (*Active Server Pages*) 
- `Servlets`, `JSP`, `Struts` und `JSF`
- `Ruby` mit `Rails`


## 1.4 Grundlagen der Webseitenerzeugung

- `<html>` schließt immer den gesamten Inhalt einer Webseite ein. 
- `<head>` definiert den Kopfbereich eines HTML Dokumentes
- `<body>` definiert den sichtbaren Teil einer Webseite in einem HTML Dokument

Eine HTML-Datei hat unter anderem die folgenden Eigenschaften

- Groß- und Kleinschreibung  der Tags ist nicht relevant
- Die Formatierung wird durch den Browser aufgrund der angegebenen Tags durchgeführt. Verschiedene Browser können eine unterschiedliche Darstellung vornehmen.
- Mehrere Leerzeichen werden zu einem Leerzeichen zusammengefasst.
- Zeilenumbrüche oder die Breite von Tabellenspalten werden ohne weitere Angaben vom Browser festgelegt.
- `div`-Tag ist ein Blockelement, Es wird ein Zeilenumbruch erzeugt
- `span`-Tag ist ein Inline Element
- `DHTML` -kein Standard, sondern eine Bezeichnung für die gemeinsame Verwendung von HTML, CSS und JavaScript zur Erzeugung von dynamischen Webseiten.
- **Nachteil** bei der Verwendung von DHTML ist, dass die Objektmodelle der verschiedenen Browser nicht 100%ig kompatibel sind
- `XML` eine erweiterbare Sprache zur Beschreibung von Daten.
- Vorteil von `XML`:

  -  kompakten Spezifikation des Standards 
  -  Möglichkeit, eigene Elemente (Tags) zu definieren

-  `XML` wird heutzutage sehr intensiv zum Austausch von Daten verwendet
-  `XML`-Dokumente haben die folgenden Eigenschaften:

  - Es gibt genau ein Wurzelelement 
  - Jedes öffnende Element besitzt genau ein schließendes Element









[^1]:Der Entity-Bereich enthält die Daten, welche bei einem HTTP-Request bzw. einer HTTP-Response übertragen werden. 
[^2]:http://de.selfhtml.org/servercgi/server/httpstatuscodes.htm