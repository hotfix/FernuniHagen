# Zusammendfassung KE1

+ adäquate Repräsentation von Information und Wissen bildet eine
wichtige Grundlage für deren effektive Erfassung, Verwaltung, Vermittlung
und Nutzung.

+ Benutzeraktivitäten werden kaum von Programmen unterstützt, Sie steht also vor folgenden Problemen:
  + Problem der grossen Anzahl der Suchergebnisse bei geringer Relevanz
  + Es ergeben sich kaum bis keine Treffer
  + Suchergebnisse sind stark vom Vokabular abhängig. Wenn die
Suchbegriffe nicht mit den Schlüsselwörtern der relevanten Dokumente
übereinstimmen, werden diese nicht gefunden, obwohl sie in ihrer
Bedeutung übereinstimmen.
  + Es werden nur einzelne Seiten als Suchergebnis geliefert. Dies erfordert weitere Suchanfragen. Ergebnisse müssen manuell und mit einem Aufwand verknüpft werden.
  + Auch bei erfolgreicher Suche müssen die Benutzer in den gelieferten
Dokumenten die interessierende Information manuell und damit mit
erheblichem kognitiven Aufwand herausfiltern.
  + Suchergebnisse sind für andere Programme kaum nutzbar und
müssen manuell integriert werden.

+ die dargestellte Information muss nicht zwangsweise immer vollständig oder auch nur teilweise vom Rechner interpretierbar werden, es reicht in vielen Fällen aus, sie derart maschinell verarbeitbar zu machen, dass mithilfe verschiedener Software-Tools das gewünschte Ergebnis geliefert wird.
* Konzept => Semantisches Web

## Probleme bei der Etablierung eines Semantischen Netzes
+ Problem : die semantische und syntaktische Heterogenität der Informationsquellen und die mangelnde Struktur der Information auf Web-Seiten
+ für eine sinnvolle Nutzung der heterogen Informationsquellen gewährleisten zu können, ist die automatische Zusammenführung ihrer Inhalte unumgänglich
=> +Semantische Integration+
+ eindeutige Darstellung der Semantik der Information in schwach strukturierter Umgebung ist die Voraussetzung um die mit der Heterogenität der Daten verbundenen Probleme zu lösen
+ Probleme, die sich aus der Heterogenität der Daten ergeben:
  + die Syntax – z. B. heterogene Datenformate
  + die Struktur – z. B. Homonyme, Synonyme oder unterschiedliche
Attributnamen in Datenbanktabellen
  + die Semantik – z. B. die beabsichtigte Bedeutung von Ausdrücken in
speziellem Zusammenhang oder Anwendung

## Semantische Integration
+ Syntaktische Homogenität ist notwendige, aber nicht hinreichende Bedingung für die gemeinsame Informationsnutzung. Konflikte treten dabei auf folgenden Ebenen auf:
  + Datenmodellebene
  + Datenschemaebene
  + Dateninstanzebene

## Heterogenitätskonflikte zwischen Datenmodellen (syntaktische Ebene)
+ Datenquellen können sich deutlich in der Darstellung von Daten unterscheiden
+ Abgleichen heterogener Datenquellen erfordert gemeinsames Daten-Modell 
+ Es müssen geeignete Transformationen gefunden werden, um die Daten in das entsprechende Modell zu überführen
+ Mit RDF-S und XML/XML-S als Beschreibungssprache stehen Werkzeuge zur Datenmodellierung zur Verfügung

## Heterogenitätskonflikte zwischen Datenschemata(Strukturelle Ebende)
+ Abgleichen unterschiedlicher schematischer Repräsentationen ein und desselben Objekts oder Merkmals.
+ Mögliche Konflikte:
  + Bilaterlale Konflikte -  betreffen ein Objekt. In unterschiedlichen Informationsquellen durch verschiedene beschreibende Strukturen abgelegt. Man unterscheide: Namenskonflikte; Datentypkonflikte; Integritätskonflikte
  + Multilaterale Konflikte - wenn eine Information, welche in
einer Quelle durch ein Objekt repräsentiert wird, in einer anderen auf
mehrere Objekte verteilt ist. Man unterscheide: Multilateral attribute correspondences, Multilateral entity correspondances, Missing values
    + Multilateral attribute correspondences - treten auf durch Verteilung von Informationen auf mehrere Merkmale
    + Multilateral entity correspondances
    + Missing values - wenn bestimmte Angaben in einer Informationsquelle fehlen.
  + Meta-level Konflikte - sind bedingt durch die Verwendung unterschiedlicher
Modellierungselemente zur Repräsentation von Information derselben Art. z.B. Attribut Wert <-> Separate Tabelle

## Heterogenitätskonflikte zwischen Daten-Instanzen (semantische Ebene)
+ Konflikte lassen sich nicht durch die Betrachtung der Struktur lösen
+ Man unterscheide:
  + Datenkonflikte - Konflikte, die aus unterschiedlicher Kodierung hervorgehen
    + spricht man von unterschiedlichen Skalen (different scales),
wenn insbesondere numerische Werte auf verschiedenen Maßstäben
basieren
    + Different value ranges - z.b. Bewertung 1-5 Sternen <->  1-5 Schlüssel
    + surjectiv mapping - Wenn ein Wert einer Quelle auf mehrere Werte der anderen Quelle abgebildet wird
    + Schema mapping - 
  + Domänenkonflikte - Konflikte, die aus unterschiedlicher Konzeptionierung des jeweiligen Wissensbereichs erwachsen.
    + Subsumption - eine Repräsentantenmenge Untermenge einer anderen Repräsentantenmenge.
    + Überlappung - müssen sich die jeweiligen Repräsentantenmengen überschneiden

## Lösungsansätze für die Semantische Integration
+ Informationsintegration kann dabei als Verbindung von Daten- und
Funktionsintegration angesehen werden
+ Datenintegration zielt auf die Zusammenführung heterogener Datenbestände ab
+ Funktionsintegration bezeichnet das Verfügbarmachen lokaler Funktionen bzw. Dienste aus den einzelnen Systemen in einer einheitlichen Form
+ zur Verwendung kommen Datenintegrationsysteme, welche auf einer wrapper/mediator Architektur basieren.


## Wrapper und Mediatoren
+ **Wrapper** sind Softwarekomponenten, die den Inhalt einer Datenquelle zur
Vereinheitlichung in einem anderen Datenmodell oder Schema repräsentieren.
Ein Beispiel dafür wäre ein XML-Wrapper für eine relationale Datenbank.
+ **Mediatoren** sind Softwarekomponenten, die der Vereinfachung, Reduzierung,
Kombination und Erklärung von Daten dienen. Sie werden v. a. zur
Bereitstellung einer gemeinsamen Anfragemöglichkeit auf unterschiedliche
Datenquellen genutzt

## Erfassen von Semantik über die Struktur
...

## Zugang über natürlich-sprachliche Verarbeitung des Ursprungstextes
...

## Semantische Modelle
+ Möglichkeiten der Kontext-Wissens-Darstellungen: Die Möglichkeiten reichen mit wachsender semantischer Ausdrucksstärke von der einfachen informellen Beschreibung von Ausdrücken in natürlicher Sprache (Glossar) über einfache
Hierarchien von Ausdrücken oder komplexe Netzwerke über Hierarchien von
Konzepten, komplexen Konzeptbeschreibungen (Ontologien) bis hin zu
streng formalen Ansätzen mit der Ausdrucksstärke von Prädikatenlogik
  + Namen und Bezeichner
  + Termnetzwerke
  + Konzepthierarchien
  + Ontologien

+ Ontologien- sprachlich gefasste und formal geordnete Darstellungenvon Wissen. werden dazu genutzt, „Wissen“ in digitalisierter und formaler Form zwischen Anwendungsprogrammen und Diensten auszutauschen.
+ Konzepte werden mithilfe von RTF-S beschrieben.
+ Ein RDF-Schema enthält Definitionen von Klassen mit entsprechend
zugehörigen Eigenschaften, die durch constraint-properties enger
gefasst werden.

 