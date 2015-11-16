# Zusammendfassung KE4

## XSL-Transformationen

* `XSLT` ist ein Teil der extensible Stylesheet Language
* `XSLT`  ist auch ein `XML`-Dokument
* `XSLT` beinhalte Regeln, nach denen ein anderes XML-Dokument Transformiert werden kann. Zielformat ist frei solange sich die Struktur des Dokuments mit `XSLT`-Regeln beschreiben lässt
* `XSLT`-Dokument = Stylesheet
* ein Stylesheet enthält Vorlagen, bzw. Templates, die jeweils aus einem Muster und Inhalt bestehen.
* Ein `XSLT`-Prozessor, d. h. eine Anwendung, die ein `XML`-Dokument nach Maßgabe eines `XSLT`-Stylesheets transformiert, sucht im `XML`-Dokument nach Vorkommen der Muster dieser Templates. Findet er ein passendes Template-Muster, gibt er den Inhalt des Templates aus.
* `XSLT` ist eine Programmiersprache um Inhalte eines XML-Dokumentes zu transformieren 
* Die Umwandlung selbst wird mit `XSLT`-Prozessoren vorgenommen, die diese Syntax verstehen und umsetzen können (`XSLT`-Prozessoren sind bereits in vielen Web-Browsern integriert)
* Die Anwendungsgebiete von `XSLT` sind:
  * Transformation zum Zwecke der Darstellung, *Presentation Oriented Publishing* (POP)
  * Transformation wird zum Datenaustausch, *Message Oriented Middleware* (MOM)

## Funktionsweise von XSLT
* Transformation besteht aus einer Reihe von einzelnen Transformationsregeln
* `XSLT` benutzt den Namensraum mit der URI `http://www.w3.org/1999/XSL/Transform`
* Als Präfix wird üblicherweise xsl benutzt
* Das Wurzelelement eines `XSLT`-Stylesheets heißt `xsl:stylesheet`, synonym `xsl:transform`
* Mindest Umfang: `<?xml version = "1.0" ?> <xsl:transform version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"> </xsl:transform> `
* `XSLT`unterscheidet 7 Arten von Knoten eines `XML`-Dokuments: Wurzel; Element; Attribut; Text; Kommentar; Steueranweisung; Namensraum
* Für jede Art Knoten gibt es eine vorgegebene Regel, die greift, wenn im Stylesheet keine Regel für diese Art Knoten definiert ist. Diese Regeln lauten:
  * Für Element- und Wurzelknoten werden die Kindelemente untersucht
  * für Text- und Attributknoten wird der Text bzw. der Attributwert ausgegeben
  * für Kommentar- und Steueranweisungsknoten wird nichts ausgegeben
  * für Namensraumknoten werden alle Namensraum-Deklarationen automatisch in das Ausgabedokument eingefügt

## Grundlegendes XSLT-Template
* `XSLT` hat 13 direkte Kindelemente und 21 Anweisungselemente
* Das grundlegende Element zur Verarbeitung ist `xsl:template` mit dem wichtigsten Attribute `match`
* Der Inhalt von `xsl:template` gibt an, was ausgegeben werden soll.

## XQuery
* `XQuery` als Lösung für Anforderungen wie Suchen, Berechnen, Zusammenfügen, Hinzufügen und Co in mehreren XML-Dokumenten
* `XQuery` = Abfragesprache für XML-Dokumente, und benutzt eine an `XSLT` und SQL angelehnte Syntax und verwendet `xPath` sowie das `XML`-Schema für sein Datenmodell und seine Funktionsbibliotek

* `XML`-Quelldokumente werden dabei in einem ersten Schritt extern geparst und eventuell zusätzlich validiert und dann vom `Query`-Prozessor in eine Instanz des `XQuery`/`XPath`-Datenmodells überführt.
* `XQuery` definiert zwei Phasen der Verarbeitung: 
  * *statische Analysephase* - hängt vom Abfrageausdruck selbst und vom statischen Kontext ab. Während dieser Phase wird die Abfrage in eine interne Darstellung, den so genannten Operationsbaum überführt. Der statische Kontext wird verwendet, um Schematypnamen, Funktionsnamen, Namensraumpräfixe und Variablennamen zu erhalten.
  * *dynamische Auswertungsphase* - ist die Phase, während der der Wert eines Ausdruckes berechnet wird. Sie beginnt nach Vollendung der statischen  Analysephase und kann nur starten, wenn keine Fehler während der statischen Analysephase ermittelt wurden.

## XQuery - Datenmodell

* Sequenz - Grundlegend ist, dass jede Instanz des Datenmodells eine Sequenz ist, wobei eine Sequenz eine geordnete Sammlung von null oder mehr Einträgen ist.
* Atomare Werte - Atomare Werte sind die primitiven Schematypen mit dem Präfix `xs` und benutzerdefinierte Typen. Sie werden durch Konstruktoren erzeugt. Dabei wird dem Wert ein Typ zugeordnet.
* Knoten - Knoten bilden einen Baum, der aus einem Wurzelknoten plus allen Knoten besteht, die direkt oder indirekt vom Wurzelknoten erreichbar sind. Jeder Knoten gehört genau einem Baum, und jeder Baum hat genau einen Wurzelknoten.

## xQuery - Typsystem und Sprachkonzept
* Jeder Ausdruck in `XQuery` hat einen statischen Typ und jede `XDM`-Instanz hat einen dynamischenTyp
* Das Typsystem beinhaltet die Typen `xdt:untypedAtomic`, alle 19 primitiven `XML`-Schema-Typen, alle Benutzerdefinierten atomaren Typen, Empty und None.
* *Elementare Ausdrücke* - sind Literale, Variablenreferenzen, Ausdrücke für Kontextknoten, Konstruktoren und Funktionsaufrufe.
* *Literale* - Literal zeigt einen atomaren Wert (Strings in Anführungszeichen oder Integer, Decimal, Double)
* *FLWOR-Ausdrücke* -  steht für die möglichen Klauseln **F**or, **L**et, **W**here, **O**rder by und **R**eturn
  * For und Let-Klausel dienen der Bindung von Variablen, Beispiel:
`for $rezept in document(“RezeptDB.xml")//Rezept`
` return $rezept//Rezeptname/text()`
  * Where-, Order By- und Return-Klauseln

* Ausdrücke können explizit geordnet oder ungeordnet zurückgegeben werden. Sinn eines ungeordneten Ausdrucks ist es, Ausführungszeit einzusparen. `If-then-else`-Ausdrücke treten vor allem in FLWOR-Ausdrücken auf und werden wie in vergleichbaren Programmiersprachen behandelt
* Funktionen - Boolesche und numerische Werte, für Zeit- und Datumswerte, zur Arbeit mit Zeichenketten

## Fehlende Funktionalität in XQuery
* Standardsemantik für Web-Services
* Try-catch Mechanismus
* Die SQL-Anweisungen GROUP BY
* Volltextsuche
* Updates

## Einführung zu Semantik und RDF
* Das Resource Description Framework ist ein Rahmenwerk, das es ermöglicht strukturierte Metadaten zu kodieren und auszutauschen. Es basiert auf XML
* Grundlage für maschinelle Verarbeitkeit von Web-Inhalten. Sie müssen maschinen-lesbar vorliegen
* Erst die Definition einer Syntax gibt den Daten eine bestimmte Struktur
* Metadaten sind Daten über Daten
* Metadaten drücken den Sinn von Daten explizit aus (Beziehen sich auf Semantik)

* RDF steht für Resource Description Framework und ist unabhängig von einer bestimmten Darstellungsform
* Basis des RDF-Modells ist ein RDF-Tripel, das statement bzw. Aussage genannt wird und besteht aus Subjekt bzw. Ressource, Prädikat und Objekt.
  * Ressource = WebSite, XML-Dokument, Objekt… jeweils mit eindeutigem Bezeichner (URI oder URL)
  * Prädikat = Spezielle Ressource die eine Relation beschreibt die Subjekt und Objekt verbindet. Identifikation ebenfalls über URI
  * Objekt = Ressource oder Literal inkl. URI

* Ein Statement kann als RDF-Grpah dargestellt werden (für Menschen). Für Maschinen als XML mit dem Tag rdf:RDF mit rdf:description Tags
* RDF erlaubt, dass ein Merkmal mehrere Werte annehmen kann. Hierfür stellt RDF Datentypen für Listen und Mengen von Ressourcen, zur Verfügung, die ihrerseits wiederum Ressourcen darstellen. 
  * Nachteil: Nur zweistellige Relationen (Mehrstellige könne nur durch mehrere zweistellige dargestellt werden)


## RDF-Schemata
* RDF-S ist eine primitive Ontologie-Sprache.
* Definiert das Vokabular das in RDF-Datenmodellen verwendet wird und spezifizieren Objektmerkmale (Objektwerte und Objektmerkmale)
* beschreibt welche Werte Objekte annehmen können und die Beziehungen zwischen Objekten
* jedes RDF-Schema seinen eigenen Namensraum via Präfix verwendet, können Ausdrücke aus verschiedenen Modellen in einem RDF-Dokument ohne Konflikte gemischt werden.

## Ontologie

* Bestandteile einer Ontologie:
  * Begriffe
  * Typen
  * Instanzen
  * Relationen
  * Vererbung
  * Axiome
