[TOC]

# Kurseinheit 7

## Kapitel 23

### Einführung

+ *transientes Objekt* - nur im Arbeitsspeicher gespeichertes, flüchtiges, Objekt
+ *persistenten Objekt* - nicht flüchtiges, in der DB gespeichertes Objekt
  + *externe Repräsentation* - in Form eines DB Eintrages
  + *interne Repräsentation* - Form eines Objektes im Arbeitsspeicher
  + Wenn beide Repräsentationen existieren, sind sie *synchron*
+ transiente Kopie des persistenten Objektes - Objekte im RAM mit dem gleichen Zustandd wie ein persistentes Objekt, jedoch nicht mit dessen externer Repräsentation synchronisiert wird.
+ *persistente Klasse* -  Java-Klasse, deren Objekte persistent sein können

### Property-based oder Field-based Access
+ *Field-based Access* - Attribute (Fields) einer Entity-Klasse auf Datenbankfelder abbilden
+ *Property-based Access* - Properties der Entity-Klasse auf Datenbankfelder abbilden

### Lazy Loading
+ Bietet die NMöglichkeit nur benötigte Daten aus der Datenbank zu laden, statt alles was vom dem einem Datensatzt abhängt
+ Lazy Loading hat auch erheblich Nachteile:
  + Nachladen der Daten ist nicht jederzeit möglich, Muss innerhalb derselben Transaktion passieren, in der die Entity geladen wurde


## Kapitel 24

### Session Fassade

> Das Entwurfsmuster Fassade beschreibt allgemein eine Klasse, die eine ausgewählte Teilmenge der Funktionalität eines komplexen Subsystems über eine zentrale Schnittstelle anbietet. Details des Subsystems werden hinter der Fassade verborgen.

+ ​SessionBean als Fassade für einen Teil des Anwendungskerns
+ Zugriffe auf die Anwendungslogik erfolgen über die Fassade, ausschliesslich
+ Session Fassade wird als EJB implementiert und zählt somit zur Anwendungslogik-Schicht.

### Business Delegate
+ Business Delegate sieht eine Schnittstelle auf der Seite des Clients vor
>Alle Zugriffe von Klassen (z.B. Managed Beans) auf die Anwendungslogik erfolgen bei Einsatz dieses Musters nicht als direkte Zugriffe auf EJB-Methoden, sondern in Form Client-lokaler Methodenaufrufe auf einem Business Delegate, welches seinerseits die Aufrufe an die Anwendungslogik-Schicht delegiert

+ zentralisieren  die zum Zugriff auf den Anwendungskern technisch notwendigen Maßnahmen
+ Business Delegate-Objekt kann durch Implementierung von Caching-Maßnahmen wiederholte Netzwerkzugriffe auf entfernte Anwendungslogik vermeiden und damit die Performance der Web-Anwendung steigern
+ übernimmt Aufgaben, die ansonsten in den einzelnen Controller-Klassen angesiedelt wären und zählt somit zur Web-Schicht, und dort zum Controller

### Service Locator
...
+ zählt auch zu Web-Schicht

### Data Transfer Object (DTO)
+ Objekt zur Aufnahme einer Sammlung von Daten, welche dann gemeinsamm zwischen zwei Kommunikationspartnern ausgetauscht werden.
+ reduziert Anzahl benötigter Kommunikationsvorgänge
+ Empfohlener Einsatz für Remote-Zugriffe über ein Netzwerk
+ Oft wird auch zwischen den Schichten eingesetzt
+ DTO wird der niedrigsten Schicht einer Schichtenarchitektur

### Value List Handler
> Nach diesem Muster wird in der Anwendungslogik-Schicht eine Value List Handler-Klasse realisiert. Eine Instanz dieser Klasse startet auf Anforderung eines Clients eine Suche (durch Delegation), speichert das gesamte Suchergebnis in einer lokalen Ergebnisliste und ermöglicht es dem Client, über kompakte Ausschnitte des Suchergebnisses zu iterieren.

+ Auf diese Weise wird die gesamte Ergebnisliste lediglich Server-intern ermittelt und verwaltet und nie als Block überNetzwerk übertragen
+ kann als SessionBean implementiert werden und muss stateful sein