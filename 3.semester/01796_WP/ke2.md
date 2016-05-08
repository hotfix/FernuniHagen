[TOC]

# Kurseinheit 2

## Kapitel 3

Kapitel `CSS`, `PHP`, `JavaScript` wurden überflogen.

## Kapitel 4

### ASP.NET vs Java EE

- `ASP.NET` -  Web Framework zur erstellung dynamisch erzeugten Internetseiten
- `.NET` Framework - stellt neben einer Laufzeitumgebung zur Programmausführung eine Sammlung von Klassenbibliotheken, Progammierschnittstellen und Dienstprogrammen zur Verfügung
- `ASP.NET` unterstützt drei Ansätze für die Erstellung von dynamisch erstellten Internetseiten:
  - `ASP.NET` Web Forms benutzt Steuerelemente und ein Ereignismodell, um eine komponentenbasierte Entwicklung zu unterstutzen
  - `ASP.NET` MVC wird das MVC-Muster unterstützt
  - `ASP.NET` Web Pages unterstützt die Entwicklung von Internetseiten, die eine Komposition aus Programmcode und HTML- Struktur enthalten.
- Java EE -  stellt Sammlung vn Spezifikationen für eine SW Architektur dar.
- Architektur unterteilt sich in vier Schichten:
  - Client-Schicht
  - Web-Schicht
  - Business-Schicht
  - Persistenzschicht
- 2013 umfasste 47 Spezifiktionsdokumente
- JavaEE ist herstellerunabhängig, aber sprachabhängig

### Ajax

- `Ajax` - Asynchronous JavaScript and XML
- Nur teil der Webseite kann aktualisiert, bzw nachgeladen werden
- `Ajax` basiert auf XMLHttpRequest-Objekt, `JS`,`CSS`,`XML`
- XMLHttpRequest-Objekt stellt den Kern von `Ajax` dar.

## Kapitel 5

### Bildformate

- [ ] muss ich hier noch zusammenfassen???

## Kapitel 6

### Webbrowser

- dient zur Anzeige von Dokumenten und Daten, speziell Internetseiten

- Hauptkomponenten eines Webbrowsers:

  - Die Benutzungsschnittstelle - z.b. Adresszeile
  - Das Browser-Modul - Vermittler zwischen BS und RM
  - Das Rendering-Modul - Darstellung einder Webseite. 1. Parsen der Seite in DOM, 2.
  - Das Netzwerk-Modul - HTTP - Anfrage weitergeben
  - Das UI-Backend (UI = User Interface - Benutzungsschnittstelle) - Stellt Informationen zu Standar HTML Elemente bereit
  - Ein JavaScript-Interpreter - üarst JS Code und interpretiert
  - Ein XML-Parser
  - Ein Datenspeicher zur persistenten Speicherung von Daten - Cookies, Bilder

  ![Architektur eines Browsers](./img/kap5_browser.png)