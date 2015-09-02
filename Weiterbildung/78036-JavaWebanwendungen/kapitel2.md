# 2. Einrichten und Test der Entwicklungsumgebung

## 2.2 Installation des Webservers

- `Tomcat` kann mit folgenden Befehlen gestoppt und gestartet werden:

```bash
NET START "Tomcat7"

NET STOP "Tomcat7"
```

- `Tomcat` wird auch als `Servlet`- und `JSP`-Container bezeichnet, da in ihm `Servlets` und `JSP`s ausgeführt werden. Die interne Implementierung von `Tomcat`, die seit der Version 4 zum Einsatz kommt, wird als Catalina bezeichnet.

## 2.3 Aufbau einer Webanwendung

- Um eine Webanwendung zu erstellen, sind die folgenden Schritte notwendig:

  - Erstellung eines neuen Verzeichnisses unter `[Tomcat]\webapps`
  - Erstellung eines Unterverzeichnisses WEB-INF, in dem eigenen Projektverzeichnis, `[Tomcat]\webapps\test\WEB-INF`
  - Erstellung einer Datei `web.xml`, die den Anforderungen eines Web Application Deployment Descriptors genügt, unter dem Verzeichnis `[Tomcat]\webapps\test\WEB-INF`. Ist Voraussetzung dafür, dass es sich bei dem erstellten neuen Verzeichnis um eine Webanwendung handelt.
  - Hinzufügen weiterer Dateien in das Verzeichnis `[Tomcat]\webapps\test\`. Evtl. mit weiteren Untergliederungen.
  - Weitere Einstellungen in den Konfigurationsdateien des Servers vornehmen.

- Bei der Vergabe von Verzeichnisnamen ist die **Groß- und Kleinschreibung** relevant
- Hauptverzeichnis der Webanwendung wird auch als *Dokumentwurzel*
- `web.xml` wird auch Deployment Descriptor genannt.

## 2.4 Ein einfaches Servlet

> **Servlets** sind *Java-Klassen*, die beim Aufruf eine `HTML`-Seite generieren. Das Ergebnis wird durch *Tomcat* an den *Client* zurückgegeben.

- Folgende Informationen können aus der Log-Datei entnommen werden:

  - Informationen über Java-Klassen welche Anwendung starten
  - Informationen zum Start der Serviceanwendung
  - Informationen zu den Einstellungen


## 2.5 Eine einfache JSP-Seite

> Eine **JSP-Seite** enthält einerseits `HTML`-Code, andererseits speziell gekennzeichneten `Java`-Code. Aus beiden wird beim Aufruf automatisch ein `Servlet` generiert und das Ergebnis zurückgegeben. Eine `JSP`-Seite ist demnach nur eine andere Möglichkeit, ein `Servlet` zu erstellen

- `JSP`-Seite wird durch den `Servlet`/`JSP`-Container übersetzt

- Vor der Übersetzung wird von Tomcat eine Java-Datei erzeugt, welche das durch die JSP-Seite definierte Servlet enthält.
- Tomcat speichert den Quellcode dieses Servlets in einem `work` Unterverzeichnis

## 2.5 Eine einfache JSP-Seite

- Eine JSP-Seite besteht aus HTML und Java-Code. Beim Aufruf der JSP-Seite  wird daraus ein Servlet generiert

## 2.6 Administration

- Jede Webanwendung läuft innerhalb eines bestimmten Kontexts.

## 2.7 Weitergabe von Webanwendungen

> Ein `WAR`-Archiv (*Web Application Archive File*) ist ein umbenanntes `JAR`-Archiv, das durch die Dateiendung war auf ein Webarchiv hinweist.

- **Vorteil der Verwendung** von `WAR`-Archiven ist die einfachere Weitergabe und Installation auf dem Server

## 2.8 Optimierung des Entwicklungsprozesses

- Mit Hilfe der Manager-Anwendung kann:

  - neue Webanwendungen hinzugefügt
  - alle vorhandenen Webanwendungen aufgelistet
  - eine Webanwendung angehalten oder gestartet werden

- Mit Hilfe von `Ant` lassen sich Webanwendungen vollständig neu übersetzen, verpacken und verteilen
- Vorteile für Trennung von Source- und Installationsdateien :

  - Bei der Verwendung eines Sourcecode-Verwaltungssystem, sollten nur die Source-Dateien aus den Verzeichnissen `src` und `web` aufgenommen werden. Anderen Dateien können bei Bedarf wiederhergestellt werden.
  - Die Datensicherung kann ebenfalls auf die Source-Dateien beschränkt werden.
  - Die Installationsdateien sind sauber von den Quelldateien getrennt, sodass die Weitergabe der Anwendung einfacher wird.

- `Ant` dient dazu, die Aufgaben einzelnen Phasen zu definieren und automatisiert auszuführen

 