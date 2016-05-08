[TOC]

# Kurseinheit 1

## Kapitel 2

- *Web-Anwendung* ist eine Client-Server-Anwendung, bei der zur Kommunikation zwischen Client und Server das HypertextTransfer Protocol (HTTP) eingesetzt wird und der Client ein (HTML-)Browser ist.
- Web-Anwendungen haben besondere Spezifika:
  - *Gestaltungsmöglichkeit* - `HTML`,`CSS` und `JavaScript`
  - *Fenster* - nur ein Fenster, Browser
  - *Zulässige Programmabläufe* - schwierig, da Benutzer uber die Angabe einer `URL` grundsätzlich jede beliebige Web-Seite ansteuern und damit letztlich auch an beliebige Positionen im Programmablauf springen können.
  - *Kommunikationsaufwand* - erhöhter Kommunikationsaufwand, da Requests und Responses zwischen Client und Server übertragen werden müssen
  - *Installationsaufwand* - Installation und Wartung nur auf dem Server.
  - *Portabilität* - unproblematisch
  - *Verfügbarkeit* - Internet und Browser benötigt.
- Rich Client vs. Thin Client


- Code on Demand - Java Applets oder JavaScript-Anweisungen

### Protokolle

Die Kommunikation zwischen Client und Server verläuft nach bestimmten Regeln. Diese sind in einem Protokoll definiert. 

| Schicht             | Protokoll |
| :------------------ | --------- |
| Anwendungsschicht   | HTTP      |
| Transportschicht    | TCT/UDP   |
| Vermittlungsschicht | IP        |

- OSI Modell - besteht aus 7 Schichten
  - Anwendungsschicht
  - Darstellungsschicht
  - Sitzungsschicht
  - Transportschicht
  - Vermittlungsschicht
  - Sicherungsschicht
  - Bitubertragung 

### IP und TCP

- `IP` und `TCP` Protokolle sogen für eine zuverlässige Datenübertragung
- `IPv4` verwendet 4 * 8Bits = 32Bits
- `IPv6` arbeitet mit 128Bit und wird in Hex notiert. 8 Blöcke je 4 stellige Hex Zahl
- `IP` Protokoll ist paketorientiert, d.h. Daten werden paketweise ubertragen.  **Ist unzuverlässig und verbindungslos!!**
- `TCP` ist verbindungsorientiert

### HTTP

- `HTTP`-Protokoll basiert auf Austausch von Nachrichten.
  - Client setzt eine Anfrge ab (Request)
  - Server beantwortet die Anfrage (Response)
  - Man Spricht von einer *Pull-Technologie*. Client initiiert die Kommunikation und "<u>zieht</u>" eine Antwort vomServer
- Eine `HTTP`-Nachricht, ob Request oder Response, ist ein einfacher ASCII-Text.
- Übertragungsmethoden:
  - GET - Parameter werden in der `URL` übertragen. Man beachte Längenbeschränkung
  - POST - Parameter werden an Header übertragen
  - Weitere: PUT, HEAD, TRACE, CONNECT

### HTML

- `HTML` - Hypertext Markup Language

### XHTML

- Verwendet Syntax von `HTML` auf Basis von `XML`
- strikte Regeln, wie bei `XML`

### XML

- `XML`- Extensible Markup Language
- geeignet zur Beschreibung hierarchischer Strukturen
- **Vorteil**: Trennung von Struktur und Inhalt sowie die Plattformunabhängigkeit
- Groß und Kleinschreibung Unterscheidung 
- Definition von Dokumententyps erfolgt mit Hilfe Document Type Definition(DTD)
- *wohlgeformt* (well-formed) - Dokument, das die Syntaxregeln von `XML` einhält.
- *gultig* (valid) - Ein wohlgeformtes Dokument, dessen Struktur den Regeln einer angegebenen `DTD` entspricht.

### statischer Inhalt vs. dynamischer Inhalt

- *statischen Inhalten* - auf dem Server abgelegte Dateien, z.B. HTML Dokumente
- *dynamisch erzeugte Inhalte* - liegen in der Form, in der Sie an Client geschickt werden, nicht vor.

### Sessions

- Möglichkeit Session ID in Anfrage einzubinden:
  - URL- Rewriting- Session ID wird in der URL eingesetzt
  - Versteckte Formularfelder
  - Cookies