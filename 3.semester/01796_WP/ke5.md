[TOC]

# Kurseinheit 5

## Kapitel 14

### Java Server Faces (JSF)

- sieht strikte Trennung von Java und HTML Code vor
- *Faces Servlet* zentrales Servlet, welches  die Funktion des Controllers übernimmt.
- Model wird duch Java Beats realisiert
- JSF unterstützen zwei Seitendeklarationssprachen
  - vor Version 2.0 -> JSP
  - ab Version 2.2 -> Facelets

### FacesServlet

- wird von JSF-Framework bereitgestellt

- entspricht dem Zetralen Controller innerhalb der Model-2-Architektur

- verarbeitet alle Anfragen an eine JSF-Anwendung

  > FacesServlet nimmt Requests (gemäß des Mapping) entgegen, kapselt alle für die weitere Anfrageverarbeitung und Antworterzeugung relevanten Informationen ineinem sogenannten FacesContext-Objekt und übergibt die Kontrolle für die weitere Anfrageverarbeitung an ein Lifecycle-Objekt weiter. [S.179 Kurstext]

### Facelets

- Sprache mit der die Views in JSF definiert werden

### Komponente

- wiederverwendbares Element in JSF
- wird über ein entsprechendes öffnendes und ein schließendes Tag in eine JSF-Seite integriert und ist Teil einer Tag-Bibliothek
- Komponente ist z.b. ein einfaches Texteingabefeld, Kalender, Tabelle

### Expression Language

- Durch EL können Komponenten mit Server-Seifigen Objekten verbunden werden.



### Managed Beans

- ist ein JavaBean
- fungiert als Schnittstelle zwischen Präsentationsschicht und der Anwendungslogik


- zetrale Aufgabe: aufbewaren von Daten aus JSF und Aufruf von Methoden des Anwendungskerns

### Validierung

- prüfung der Eingaben

### Konvertierung

+ zuständig für Konvertierung von Daten  zwischen Client 

### Ereignis

+ Beschreibt Aktion und wird von einem Event Listener abgefangen, wenn dieser eintritt
+ Bezeichner muss mit der Komponente, die das Ereignis ausgelöst hat, verknüpft werden

### Navigation 

> Möchte eine Benutzerin von einer Seite zu einer anderen Seite wechseln, so hat dieser Abauf immer bestimmte Vorbedingungen und bestimmte Nachbedingungen und wird durch einbestimmtes Ereignis ausgelöst. Diese Bedingungen und Ereignisse können in sogenannten Navigationsregeln festgehalten werden. JSF bietet eine implizite und eine explizite Navigation an.In Kapitel 18 werden beide Navigationstypen betrachtet.[S.172 Kurstext]



## Kapitel 15



+ die Bearbeitung eines Request von einem Client wird durch die Spezifikation von JSF vorgegeben.

+ Es werden insgesamt 6 Verarbeitungsschritte durchgeführt. Von HTTP-Anfrage bis Zurücksenden des Antwortdokumentes.

  ![Lifecycle JSF](./img/kap15_lifecycle_jsf.png)

+ **Schritt 1 - Ansicht wiederherstellen**   

  + Im ersten Schritt  wird die JSF-Seite intern wiederhergestellt
  + Alle Elemente der Seite werden in einem *Komponentenbaum* organisiert
  + dieser definiert die Struktur und Zusammenhänge der Elemente
  + Beim ersten Aufruf der Seite vom Client, muss Komponentenbaum aufgebaut werden. Unmittelbar danach wird Schritt 6 des Lebenszyklus durchgeführt, die Ansicht wird gerendert
  + Wenn das Dokument bereits aufgerufen wurde, wird der Komponentenbaum aus dem Zustand wiederhergestellt, der auf dem Server gespeichert ist.

+ **Schritt 2 - Request-Parameter anwenden**

  + Text in einem Texteingabefeld oder das selektierte Element in einem DropDown-Menü sind den Komponenten noch nicht zugewiesen
  + in der zweiten Phase werden diese Zuweisungen durchgeführt
  + Es wird eine Methode auf dem Wurzelelement des Komponentenbaumes aufgerufen
  + Diese Methode ruft rekursiv Methoden der Kindelemente auf
  + Es wird geprüft, ob für die jeweilige Komponente ein Wert in der Anfrage hinterlegt wurde und weist diesen der Komponenten zu.

+ **Schritt 3 - Validierung durchführen**

  + Werte der Request-Paramter werden konvertiert und validiert
  + Treten bei der Konvertierung oder Validierung Fehler auf, wird direkt mit
    Schritt 6 fortgefahren
  + Tritt kein Fehler auf, wird jeder konvertierte und validierte Wert in seiner Komponenten gespeichert

+ **Schritt 4 - Model aktualisieren**

  + Aktualisierung der Managed Beans, die mit der JSF Seite verknüpft sind
  + Mit Hilfe der Setter-Methoden werden die Eigenschaften einer Managed Bean mit den entsprechendenWerten belegt

+ **Schritt 5 - Anwendung ausführen**

  + Aufruf der Methoden des Anwendungskerns und der Ereignisbehandlungsmethoden
  + Festlegung der nächsten aufgerufenen Seite, durch Rückgabewerte oder durch definierte Navigationsregeln.

+ **Schritt 6 - Antwort rendern**

  + Erzeugung eines Komponentenbaums und übergabe der Werte aus Managed Beans an die zugehörige Komponenten
  + rendering des Komponentenbaums, d.h. die Elemente des Baumes werden in ein XHTML-konformes Element übersetzt. 
  + Status des Baumes wird für spätere Aufrufe gespeichert.
  + Nach der Erstellung des Ausgabedokumentes wird dieses an den Client gesendet

  ​

## Kapitel 16

### Facelets als Seitendeklarationssprache
+ JSP wurde von JSF abgelöst!
+ ​eine JSF Seite ist ein XHTML Dokument
+ besteht aus XHTML und JSF spezifischen Tags

### Die HTML-Tag Library
+ HTML Tag Bibliothek können in folgende Gruppen unterteilt werden
  + Eingabekomponenten
  + Ausgabekomponenten
  + Befehlskomponenten
  + Auswahlkomponenten
  + Formularkomponenten
  + DataTable-Komponenten
  + Bildausgabekomponenten
  + Panel-Komponenten
  + Nachrichtenkomponenten

### Die Core-Tag Library

+ einhaltet Elemente, die Basisfunktionalitäten von JSF zur Verf¨ugung stellen

### Validatoren
``` xml
<f:validateRequired />
<f:validateLength minimum="5" maximum="10" />
<f:validateLongRange minimum="20" maximum="1000" />
<f:validateDoubleRange minimum="1.5" maximum="3.7" />
<f:validateRegex pattern="[0-9]" />
<f:validator validatorID="myCustomValidator" />
```

+ JSF Anwendung kann sich in unterscheidlichen Stufen befinden: z.B. Entwicklungsstufe oder Produktionsstufe
+ Stufe wird in web.xml festgelegt
+ Fehleingaben werden in der Entwicklungsstufe angezeigt
+ Für die Anzeige der Fehleingaben in Produktionsstufe kann `<message>`-Element verwendet werden
+ Fehlermeldung kann im Attribut `validatorMessage` übersteuert werden

## Kapitel 17
###Wichtige Scopes für Managed Beans

+ Request Scope - Z.B. Für absenden des Formulars
+ Conversation Scope - z.B. zum Ausfüllen eines mehrseitigen Formulars
+ Session Scope - z.B. zum Verwalten eines Warenkorbes
+ Application Scope - z.B. ein Besuicherzähler
  +  wird beim start der Webanwendung erzeugt
  +  Instanz ist für alle Benutzer verfügbar

## Kapitel 18
### Navigation in JSF
+ Man unterscheide, explizite Navigation und implizite Navigation (ab JSF 2.0)
+ Spezifiziert wird eine Navigation durch vier Elemente: 
  + *eine Vorbedingung* - von wo aus startet die Navigation
  + *ein Ereignis* - löst eine Navigation aus
  + *eine Bedingung* - feststellung ob Navigation beendet wird ode rnicht
  + *eine Nachbedingung* - Ziel der Navigation

+ statische vs. dynamische Navigation

### Explizite Navigation
+ Navigationsregeln müssen in der  ´faces-config.xml´ Datei eingetragen werden
+ Navigationsregel wird innerhalb der Konfigurationsdatei durch das Tag `<navigation-rule>` eingeleitet und durch das Tag `</navigation-rule>` abgeschlossen.
+ Es können mehrere Navigationsregeln definiert werden.
+ Vorbedinung wird zwischen `<from-view-id> ... </from-view-id>` definiert
+ Es können mehrere Navigationsfälle definiert werden. dafür werden `<navigation-case> ...</navigation-case>` Tags verwendet
+ Navigationsfall kann wiederum folgende Tags beinhalten:
  + `<from-action> ... </from-action>`
  + `<from-outcome> ... </from-outcome>`
  + `<to-view-id> ... </to-view-id>`

+ für die Navigation wichtige Befehlskomponenten sind: `commandButton` und `commandLink`

### Implizite Navigation
+ vereinfachung der Implementierung der Navigationsregeln
+ Im `action` kann ein Seite angegeben werden, JSF erkennt diese
+ Nachteil ist, dass die Navigationregeln dezentral definiert werden

## Kapitel 19
