# 6. Zusammenarbeit zwischen Servlets und JSP

## 6.1 Trennung von Präsentation und Verarbeitung (MVC-Modell)


- MVC-Modell - 	Model-View-Contoller-Modell
- **Das Model** (Modell) enthält die darzustellenden Daten und liefert die Regeln, wie die Daten verwendet werden. 
- **Der View** (Anzeige bzw. Präsentation) ist verantwortlich für die Beschaffung der Daten aus dem Modell, deren Darstellung und, falls es Änderungen im Modell gibt, für die Aktualisierung der Darstellung. 
- **Der Controller** (Steuerung) ist für die Verarbeitung der Benutzereingaben zuständig. Er nimmt die Benutzeraktionen entgegen, wertet diese aus und agiert entsprechend. Der Controller steuert den Ablauf der Anzeige bzw. des Views.
 
- Die bessere Steuerung einer Anwendung durch ein zentrales Servlet bietet das MVC2-Modell, eine für Webanwendungen optimierte Variante des MVC-Modells. Darin werden Anfragen **vor** der Weiterleitung an die JSP-Seiten vorverarbeitet. Das **Servlet**, auch *Front Controller* genannt, kann 
  - die Benutzerauthentifizierung vornehmen, 
  - Parameter und Formulardaten in JavaBeans verpacken,
  - die Navigationslogik implementieren.

- Die MVC-Architektur, die durch das MVC2-Modell implementiert wird, bietet bei der Entwicklung von Anwendungen zahlreiche Vorteile, die nicht nur auf Webanwendungen bezogen sind:
  - Es existiert eine klare Trennung zwischen der Anzeige der Daten, der Logik und Datenhaltung. Dadurch können mehrere Entwickler, basierend auf ihre jeweilige Qualifikation, besser eingesetzt werden.
  - Durch die Aufteilung einer Anwendung in mehrere Schichten lassen sich diese besser austauschen. Wird eine andere Datenbank oder Speichervariante benötigt, reicht es aus, die davon betroffene Schicht anzupassen. 
  - Die Anwendungsteile werden übersichtlicher, da sie nur einen beschränkten Teil der Gesamtfunktionalität implementieren. => Bessere Wartbarkeit und wiederverwendbarkeit
  - Durch die Verwendung eines zentralen Kontroll-Servlets müssen sich die anderen Anwendungsteile um bestimmte Operationen wie Authentifizierung oder die Implementierung der Navigationslogik gar nicht oder nicht mehr so intensiv kümmern.

## 6.2 Implementierung der MVC-Architektur

- In Webanwendungen gibt es zwei Varianten, wie eine Anfrage an eine andere Seite geleitet werden kann:
  - Die Anfrage wird weitergeleitet (`forward`).
  - Die Anfrage wird umgeleitet (`redirect`).

- Im Unterschied zu einer Weiterleitung erfolgt eine Umleitung über den Client. 
  - Dazu wird ihm der HTTP-Code 302 mit Angabe der neuer Adresse (URL) gesendet. 
  - Danach sendet der Client einen neuen Request unter Verwendung der neuen Adresse. 
 
- Ein **Portal** vereinigt in einer integrierten Darstellung (hier als Webseite) verschiedene Informationen, Funktionen und Dienste. Diese sind meist durch einen Benutzer in der Art und Weise der Darstellung konfigurierbar

## 6.3 Servlets und JSP- Beispielanwendung

