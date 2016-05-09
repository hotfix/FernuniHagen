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

