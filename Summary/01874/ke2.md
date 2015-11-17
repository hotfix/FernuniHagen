# Zusammenfassung KE2

## Semantische Heterogenität
+ semantische Heterogenität kann in drei verschiedene Typen von Konzepten klassifiziert werden:
  + semantisch äquivalente Konzepte: verschiedene Begriffe können auf ein und dasselbe Konzept beziehen oder verschiedene Eigenschaften für das gleiche Produkt von zwei Systemen modelliert werden.
  + semantisch unabhängige Konzepte: es kann zu Verständnisproblemen kommen, wenn der gleiche Begriff für unterschiedliche Konzepte verwendet wird. Als Beispiel kann "Käfer" entweder für ein "Tier" oder für ein "Auto" stehen.
  + semantisch abhängige Konzepte: die Heterogenität wird anhand von Generalisierung und Spezifizierung beschrieben. Als Beispiel dazu kann hier der Fall angeführt werden, wenn ein System nur Früchte kennt, ein anderes aber Äpfel, Orangen und Bananen etc. unterscheiden kann. Ebenso können Skalierungskonflikte auftreten, wenn etwa ein System "Kind" als Menschen im Alter zwischen 5 und 12 Jahren klassifiziert, ein anderes System zwischen 3 und 10 Jahren klassifiziert und ein drittes System "Kind" als Menschen unter 140 cm klassifiziert.

## Ontologien
+ Ontologie - ( *gr. óntos = Sein, lógos = Lehre* ) bezeichnet das Studium der Kategorisierung von Dingen, die existieren oder in einigen Interessensgebieten bestehen können
+ Forschungsarbeiten auf dem Gebiet der Künstlichen Intelligenz haben den Begriff der Ontologie aus der Philosophie für die Repräsentation und maschinelle Verarbeitung von komplexen Wissensstrukturen adaptiert
+ *"An Ontology is an explicit specification of a conceptualisation."* Tom Gruber
+ Ontologie stellt ein Vokabular zur Darstellung eines Wissensbereichs bereit, indem es Prädikate verwendet, die die Beziehungen zwischen den Entitäten herstellen
+ eine Ontologie besteht aus mehreren Bestandteilen:
  + **Konzepte** (Klassen): Konzepte fassen real existierende Instanzen mit gemeinsamen Eigenschaften zusammen 
  + **Instanzen** (Begriffe): Instanzen stellen die eigentlichen Objekte dar.
  + **Relationen** verbinden Konzepte und Instanzen miteinander


+ Um eine Nachhaltigkeit beim Einsatz von Ontologien zu gewährleisen, da die Erstellung einer Ontologie mit der Standardisierung der Terminologie sehr mühsam ist, haben sich verschiedene Top-Level-Ontologien entwickelt, die sehr allgemeine Konzepte beschreiben.

+ Grad der Formalität:
  + Total-informell
  + Semi-informell
  + Semi-formal
    + Regelsysteme
    + Framekonzepte
    + Semantische Netzwerke
  + Rigoros formal

+ Webstandards zur Darstellung des Wissen implementierungsabhängig von einer Programmiersprache : XML, XML-Schema,RDF, RDF-Schema, DAML+OIL, OWL
  + RDF (Resource Description Framework) ist ein Datenmodell für Ressourcen und Relationen zwischen diesen. Es stellt eine einfache Semantik für das Datenmodell zur Verfügung, die in XML repräsentiert werden kann.
  + RDF-Schema stellt ein Vokabular zur Beschreibung der Eigenschaften und Klassen von RDF-Ressourcen mit einer Semantik für verallgemeinernde Hierarchien solcher Eigenschaften und Klassen bereit
  + OWL: Die Web Ontology Language ist eine Spezifikation des W3C und basiert historisch auf DAML+OIL. Sie fügt mehr Vokabeln zur Beschreibung von Eigenschaften und Klassen hinzu (Disjunktheit, Kardinalität, Äquivalenz etc). Innerhalb der OWL-Familie kann man drei Dialekte mit zunehmender Ausdrucksstärke unterscheiden: OWL Lite, OWL DL, OWL Full

## Die Rollen von Ontologien bei der Informationsintegration 

+ Folgende Rollen können Ontologien in der Informationsintegration einnehmen:
  + Ontologien werden hauptsächlich zur Repräsentation und Visualisierung von zum Teil unterschiedlich strukturierten Informationen eingesetzt.
  + Ontologien können als ein Anfrage-Modell eingesetzt werden, das die Suche und das Browsing von Informationen vereinfacht, indem die Struktur der Ontologie selbst genutzt wird.
  + Ontologien werden auch als Verifikationsmodell genutzt, denn durch die Spezifikation wird die Softwareentwicklung mit Ontologien konsistent

+ Es gibt drei verschiedene Architektur-Ansätze, wie die zum Teil unterschiedlich strukturierten Informationsquellen (HTML- Seiten, Datenbanken, Textdateien) mit einer einheitlichen Semantik für den Nutzer dargestellt werden können
  + Single-Ontology-Ansatz - eine globale Ontologie mit gemeinsam zu nutzendem Vokabular für ein bestimmtes Fachgebiet.
  + Multiple-Ontology-Ansatz - jede Ressource ist durch eigene Ontologie repräsentiert
  + Hybrid-Ansatz - jede Ressource ist durch eigene Ontologie repräsentiert, jedoch alle basieren auf dem gleichen Vokabular