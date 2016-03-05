# 8. JavaServer Faces (JSF)

## 8.1 Einführung


> **JSF** ist ein Framework für die serverbasierte Erstellung von Benutzeroberflächen für Webanwendungen. 
> - Die Benutzeroberflächen werden meist über HTML und CSS erzeugt und dann in einem Browser auf der Client-Seite betrachtet.
> - Mittels so genannter UI-Komponenten wird die Funktionalität und Verwaltung der Daten definiert, die dargestellt bzw. bearbeitet werden sollen
> - Renderer übernehmen die Erzeugung des Codes (standardmäßig HTML) für die Darstellung der Komponenten.
> - Durch die Trennung von Darstellung (Renderer) und Verwaltung (UI-Komponente) können auch unterschiedliche Ausgaben wie HTML oder WML erzeugt werden, ohne die Programmlogik zu beeinflussen. 
> - Textdaten (andere Daten sind bei der Eingabe über ein HTML-Formular nicht möglich) werden bei der Übertragung vom Client zum Server in die benötigten Datentypen konvertiert, geprüft (validiert) und in einem Modell über JavaBeans dauerhaft verwaltet.
> - Weiterhin unterstützen JSF die Ereignisverarbeitung, z.B. beim Klick auf einen Button einer Webseite.

- Die Basis von JSF ist das Servlet-API 
- Darauf setzt das JSF-API auf, sodass Sie innerhalb von JSF-Anwendungen immer Zugriff auf die bereits bekannten Funktionalitäten von Servlets besitzen
- Die JSF-Tags basieren auf JSP und werden über zwei Tag-Bibliotheken bereitgestellt.

> Im Sprachgebrauch von JSF ist ein **Faces Request** eine Anfrage an eine JSF-Seite. Diese Anfrage bewirkt die im Folgenden exemplarisch dargestellte Verarbeitung.


1. Der **Faces Request** leitet die Verarbeitung ein. Dabei wird eine HTML-Seite angefordert, die über JSF dynamisch generiert wird.
2. In der Phase **Restore View** wird entweder ein bereits vorhandener View (die Struktur einer JSF-Seite) wiederhergestellt oder ein neuer View beim ersten Aufruf der Seite erzeugt. Das Ergebnis ist ein vollständiger View.
3. In der Phase **Apply Request Values** aktualisieren die UI-Komponenten ihren internen Status und können beispielsweise die Parameter des Requests auslesen. Im Ergebnis besitzen die UI-Komponenten einen aktuellen Zustand.
4. Jetzt folgt die **Validierungsphase**, in der die Konvertierer und Validierer der Komponenten aufgerufen werden. Im Fehlerfall wird die JSF-Seite in ihrer ursprünglichen Form angezeigt und die Verarbeitung abgebrochen. 
5. Mit **Update Model Values** werden die Modelldaten, also z.B. die Werte der hinter einer Komponente liegenden JavaBean, auch Backing Bean (vgl. Kapitel 8.3) genannt, aktualisiert. 
6. Die Phase **Invoke Application** dient der Verarbeitung von noch ausstehenden Ereignissen.
7. In der Phase **Render Response** wird der Antwortkomponentenbaum erstellt und gerendert. Dies führt zur Faces Response: eine Antwort-JSF-Seite, deren Zustand abgespeichert wird.

## 8.2 Erstellen einfacher JSF-Anwendungen

- Fehlersuche kann analog zu der Servlets oder JSP Seiten erfolgen.

## 8.3 JSF und die Verwendung von JavaBeans

> JavaBeans oder im Sprachgebrauch von JSF - **Backing Beans** ** - stellen die Verbindung der UI-Komponenten einer JSF-Anwendung zu den dahinter liegenden Daten her. Die Daten können dazu aus der Bean gelesen oder nach dem Absenden einer HTML-Seite an den Server in den Beans gespeichert werden. 

- JavaBeans werden im Zusammenhang mit JSF auch als **Model Objects** bezeichnet. 
- Eine JSF-Seite besitzt in der Regel **genau eine** korrespondierende Bean, welche den Zustand der Seite verwaltet.
- JavaBean, auch Backing Bean genannt, verfügt über folgende Eigenschaften:
  - Für den Zugriff auf die Eigenschaften werden getter Methoden verwendet
  - Für das Setzen der Eigenschaften werden setter-Methoden verwendet
  - Die Annotation `@ManagedBean` registriert die Bean für die JSF-Anwendung.
  - Mit der Annotation @SessionScoped wird die Bean genau einmal je HTTP-Session erzeugt
  - Durch die Annotation @ManagedProperty werden den Eigenschaften der Bean direkt Werte zugewiesen
  - Zugriff auf die Bean erfolgt mit Hilfe von Unified EL

## 8.4 Navigationsregeln definieren

- Die einfachste Möglichkeit der Seitennavigation ist die Angabe der Zieldatei direkt in der (X)HTML-Datei
-  Die Navigationsregeln werden in der Datei faces-config.xml, die vom FacesServlet genutzt wird, definiert
-  Es gibt mehrere Vorteile bei der 2. Methode
  - Die Navigation wird vorwiegend in der Konfigurationsdatei festgelegt und ist damit leichter wartbar, da diese Informationen hier zentralisiert vorliegen.
  -  Tools können die Konfigurationsdatei nutzen, um eine grafische Definition von Navigationsregeln zu ermöglichen.
- Möglichkleiten statischer Verlinkung
  - über `<a>` Tag
  - `<h:link value="Test-Seite" outcome="Test.xhtml" />`
  - über `<h:outputLink>` 
```xml
  <h:outputLink value="/faces/Test.xhtml"> 
  <h:outputText value="Test-Seite" /> 
</h:outputLink>
```

- Die Navigation über JSF erfolgt in der Regel über Aktionen

# 8.5 Ereignisse

- Das JSF-API definiert Event- und Listenerklassen um auf Ereignisse zu reagieren.
  - Action-Event 
  - ValueChange-Event 
  - System-Events 
  - DataModel-Event 

- Um auf Ereignisse in einer UI-Komponente zu reagieren, 
  - benötigt man eine Listenerklasse, die das entsprechende Interface implementiert
  - der Listener wird bei der Komponente registriert

- ActionEvents treten beim Klicken einer Schaltfläche oder eines Links vom Typ `<h:commandLink>` auf.

- Änderungen von Daten führen zum Auslösen von Ereignissen `ValueChangeEvent`