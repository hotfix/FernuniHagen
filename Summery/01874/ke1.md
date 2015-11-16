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


