# Zusammendfassung KE3

* `XML` ist ein Abkömmling der Sprache `SGML`
* `XML` hat keine feste Anzahl an Tag's
* `XML` ist einem Meta Auszeichnungssprache mit der andere Auszeichnungssprachen definiert werden können. => `XML`-Sprachen; `XML`-Dialekte
* Wohlgeformtes `XML` = Genügen der Grammatik
* gültiges `XML` = Genügt der `DTD` Grammatik
* ein wohlgeformtes XML enthält einen Baum der aus Elementen besteht
* Ein `XML`-Dokument besteht aus: Tags = Elemente; Attributen; XML-Namen
* Ein Element darf nur ein Attribut mit einem gleichen Namen haben, aber mehrere Kindelemente mit gleichem Namen. Kindelemente können wiederum Kindelemente haben, ein Attribut hingegen nicht.
* `XML`-Dokument sollte mit einer XML-Deklaration beginnen, ist aber nicht verpflichtend
* `XML`-Parser stellt anhand der ersten 5 Zeichen Mutmaßungen über die Kodierung an

* Bei der Prüfung auf Wohlgeformtheit wird nicht untersucht, ob ein Element überhaupt Attribute haben sollte. Das kann der `XML`-Parser ohne zusätzliche Informationen auch gar nicht, da er die Semantik der Ziel-Anwendung nicht kennt. Solche Informationen werden dem Parser durch eine Dokumententyp-Definition zur Verfügung gestellt.
* Die Deklaration einer Dokumententyp-Definition muss innerhalb eines XML-Dokumentes direkt nach einer Deklaration platziert werden
* Nach dem elementNamen folgt das Inhaltsmodell
  * `<!ELEMENT elementName (#PCDATA)>` Parsed Character Data (Normaler Text)
  * `<!ELEMENT elementName EMPTY>` Elemente ohne INhalt (z.B. nur Attribute)
  * `<!ELEMENT elementName ANY>` Elemente mit beliebigem Inhalt
  * `<!ELEMENT elementNAme (titel,autor,Inhalt)>` Element mit Kindelementen
* Kardinalitäten
  * `*` 0-n Vorkommen
  * `+` 1-n Vorkommen
  * `?` 0-1 Vorkommen

## DTD
* Die Regeln zur strukturellen Definition eines Dokumenttyps bilden zusammen eine Dokumentgrammatik (Dokumenttyp-Definition)
* Durch die Verwendung einer `DTD` und eines `XML`-Prozessors kann ein Dokument gegen die `DTD` validiert/geprüft werden
* `DTD`s verwenden reguläre Ausdrücke zur Beschreibung der Folge der Kinder eines Knotens

* Wichtige Eigenschaften, die ein `XML`-Dokument charakterisieren, sind die folgenden:
  * *Validität* => Ein `XML`-Dokument heißt zulässig, valide oder gültig bezüglich eines XMLSchemas, falls es dieses Schema erfüllt oder einer `DTD` entspricht.
  * *Wohlgeformtheit* => Ein Dokument heißt wohlgeformt, falls alle Start- & End-Tags richtig und der XML-Syntax entsprechend angeordnet sind und alle Element-Attribute eindeutig sind.
  * *Parser* => Die Wohlgeformtheit eines Dokuments garantiert, dass das Dokument durch einen XML-Parser geparst werden kann.

## XML-Schema Definition
* Um `XML`-Schemata zu definieren, die eine größere Ausdruckskraft besitzen als Schemata, die durch `DTD`s definiert werden, sind `XSD`s nützlich
* Durch rekursive Typvergabemechanismen erreichen `XSD`s gegenüber `DTD`s eine höhere Ausdruckskraft
*  Mit `XSD` sind genauere und strengere Prüfungen möglich
* `XSD`s sind neben `DTD` eine Möglichkeit Strukturen von XML-Dokumenten zu beschreiben
* `XSD` bietet auch die Möglichkeit, den Inhalt von Elementen und Attributen zu beschränken, z. B. auf Zahlen, Datumsangaben oder Texte, beispielsweise mittels regulärer Ausdrücke.
* `XSD`s werden in einer XML-Syntax formuliert

## XLink
* Ein `XLink` wird im einfachsten Fall durch Attribute in einem Element des Dokuments, von dem aus verwiesen werden soll, realisiert.
* Als verwendetes Präfix hat sich `xlink` eingebürgert

## XPath und XPointer
* Aus `XPointer` und `XSLT` entstand als Kombination die `XML`-Anwendung `XPath`.
* `XPath` ist eine Sprache zur Lokalisierung von Teilen eines `XML`-Dokuments und arbeitet auf einer Baumansicht eines `XML`-Dokuments, wobei verschiedene Knoten unterschieden werden:
  * Wurzelknoten
  * Elementknoten
  * Attributknoten
  * Textknoten für Text innerhalb von Elementen
  * Namensraumknoten
  * Verarbeitungsanweisungsknoten
  * Kommentarknoten
* Dabei entsteht ein `XPath`-Ausdruck aus einer Folge von Lokalisierungsschritten. Jeder Lokalisierungsschritt selektiert eine Teilmenge der Knoten eines Dokuments, wobei das Ergebnis eines Lokalisierungsschritts der Ausgang für den nächsten Lokalisierungsschritt ist.
* `XPath`-Anfragen ermöglichen es somit, die Suche nach einem bestimmten Muster auf einem ausgewählten Kontextknoten auszuführen, um dann relativ zu der Ergebnis-Knotenmenge zusätzliche Operationen anzuwenden.
