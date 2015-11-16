# Klausur WS 2009/2010

## Aufgabe 1
Wie ist die logische Strukturierung des Dokumentenmodells angelegt?

[ ] objektorientiert
[ ] mengenorientiert
[x] streng hierarchisch

## Aufgabe 2

Welche Vorteile bietet das Modell des Strukturierten Dokumente

[ ] Bei der Informationsverarbetung kann die logische Struktur eines Dokumentes aus Stylesheets konstruiert werden
[x] Mit Hilfe von Stylesheets kann die Darstellung eines Dokumentes an verschienede Präsentationsmedien angepasst werden
[x] Stylesheets ermöglichen die zetrale Verwaltung von Formatierungsinformationen unabhänbgig vom Dokument

## Aufgabe 3
Welche Aussagen über die Realisierungen der Dokuemntenmodelle von Latex und Microsoft sind richtig?
[ ] Alle Versionen von Word verwenden eingebettetes Markup für Repräsentation von Strukturelementen.
[x] Markup bei Latex ist nicht rein deklarativ
[x] Markup bei Latex kann neben Struktur- auch Formatierungsinformationen enthalten

## Aufgabe 4
Welche Bestandteile gehören zum Kodierungsmodell der Zeichenkodierung in Unicode?
1. ein abstrakter Zeichensatz
2. eine Codetabelle
3. ein Kodierungsformat
4. ein Kodierungsschema
5. eine Übertragungssyntax, die über so genannten "glatten Text" hinaus geht

## Aufgabe 5
Wie gross is der Koderaum von US-ASCII?
[x] 0-7F
[ ] 0-FFFF
[ ] 0-10FFFF
[ ] 0-7FFFFFFF

## Aufgabe 6
Welche der folgenden Aussagen treffen auf das Unicode-Kodierungsformat UTF8 zu?
[x] Die Kodierungseinheit ist 8 Bit lang.
[x] Für die Darstellung einer Codeposition muss immer die kleinstmögliche Zahl von Kodierungseinheiten gewählt werden.
[x] UTF8 stellt die ersten 128 Codepositionen kanonisch mit einem Byte dar.
[ ] UTF8 ist nicht US-ASCII transparent+

## Aufgabe 7
Für jedes der beiden Unicode Kodierungsformate UTF-8 und UTF-16 lässt sich in einem Strom von Positionsdarstellungen von jeder Kodierungseinheit aus der Anfang der zugehörigen Positionsdarstellungen mit beschränktem Backup finden.
Um wie viele Kodierungseinheiten muss bei UTF8 hpöchstens zurückgegangen werden?
[] 1
[] 2
[] 3
[] 8

## Aufgabe 8
X;L-Elementenamen und Attributnamen müssen einigen Regeln genügen.
WElche der folgenden Elementnamen genügen den Regeln für XML-Namen.
[x] kurs0815
[ ] 7zwerge
[x] _winter-urlaub
[ ] variable xy

##Aufgabe9
Wann genau ist ein XML-Dokument wohlgeformt?
[ ] Ein XML-Dokument ist wohlgeformt genau dann, wenn es eine DTD enthält und die genügt
[x] Ein XML-Dokument ist wohlgeformt genau dann, wenn es der XML-Grammatik genügt
[ ] Ein XML-Dokument ist wohlgeformt genau dann, wenn es wenn es mit der Zeile `<?xml version="1.0" encoding="UTF-8">` beginnt
[x] Ein XML-Dokument ist wohlgeformt genau dann, wenn es genau ein Wurzelement besitz

## Aufgabe10
```
<?xml version="1.0" encoding="UTF-8">
<nsA:wurzel xmlns:nsA="http://www.fuh.de">
  <nsA:element1 attribut1="attr1">
    <nsB:element2 xmlns:nsA="http://www.beispiel.org" xmlns:nsB="http://www.hagen.de">
      <element3 nsA:attribut3="1337"/>
    </nsB:element2>
  </nsA:element1>
  <element4 xmlns:nsC="http://freilichtmuseum-hagen.de">
    <element5 xmlns="http://www.beispiel.de">
      <element6 attribut="attr6">
    </element5>
  </element4>
</nsA:wurzel>
```

|Element/Attribut | Namensräume|
|-- |--|
| wurze1| http://www.fuh.de|
| element1| http://www.fuh.de|
| attribut1| leer|
| element2| http://www.hagen.de|
| element3| |
| attribut3| http://www.beispiel.org|
| element4| |
| element5| http://www.beispiel.de|
| element6| http://www.beispiel.de|
| attribut6| |

## Aufgabe 11


##Aufgabe 12

Welche Vorteile bieten XML-Schemata gegenüber DTD
[x] XML-Schemata sind selbst XML
[ ] XML-Schemata sind in Form von xQuery- Ausdrücken formuliert
[x] XML-Schemata bieten vielfältiges Typkonzept
[ ] XML-Schemata-Dateien sind stets kleiner als entsprechende DTD-Dateien


##Aufgabe 13

Durch welche der folgenden Attribute werden XLinks beschrieben?
[] xlink:type
[] xlink:href
[] xlink:xmlns
[] xlink:alt


##Aufgabe 14

## Aufgabe15
Welche der folgenden Zeichenketten stellen eine gültige URI dar?

[x] `http://localhost:8080/text.html`
[ ] `mein.server/text.xml`
[x] `mailto://John.Doe@fuh.de`
[ ] `mailto//John.Doe@fuh.de`


# Aufgabe 16













