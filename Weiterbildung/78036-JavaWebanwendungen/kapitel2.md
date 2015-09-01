# 2. Einrichten und Test der Entwicklungsumgebung

## 2.2 Installation des Webservers

- Tomcat kann mit folgenden Befehlen gestoppt und gestartet werden:

```bash
NET START "Tomcat7"

NET STOP "Tomcat7"
```

## 2.3 Aufbau einer Webanwendung

- Um eine Webanwendung zu erstellen, sind die folgenden Schritte notwendig:

  - Erstellung eines neuen Verzeichnisses unter `[Tomcat]\webapps`
  - Erstellung eines Unterverzeichnisses WEB-INF, in dem eigenen Projektverzeichnis, `[Tomcat]\webapps\test\WEB-INF`
  - Erstellung einer Datei `web.xml`, die den Anforderungen eines Web Application Deployment Descriptors genügt, unter dem Verzeichnis `[Tomcat]\webapps\test\WEB-INF`. Ist Voraussetzung dafür, dass es sich bei dem erstellten neuen Verzeichnis um eine Webanwendung handelt.
  - Hinzufügen weiterer Dateien in das Verzeichnis `[Tomcat]\webapps\test\`. Evtl. mit weiteren Untergliederungen.
  - Weitere Einstellungen in den Konfigurationsdateien des Servers vornehmen.

- Bei der Vergabe von Verzeichnisnamen ist die **Groß- und Kleinschreibung** relevant
- Hauptverzeichnis der Webanwendung wird auch als *Dokumentwurzel*

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

## 2.6 Administration






 