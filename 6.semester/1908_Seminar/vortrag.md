# Einfürung

##Folie1

- 1993 Idee neue Sprache
  - mächtiger als Perl und objektorientierter als Python
  - einfachen und pregnante Syntax
- 1995 erste Version als Open Source
- 1996 Version 1.0
- Heute ist Ruby 2.5
- 2000 das erste Buch in englischer sprache
- 2004 RoR Framework

## Folie2

- Vollständig OO
- dynamisch Typisiert
- interpretierte Skriptsprache
- In Ruby sind viele Konzepte aus anderen Sprachen eingeflossen
- Von Anfang an wurde Ruby nach den Prinzipen des Mesch-Maschinnen Interfaces designt
  - **Konsistenz**-Die Sprache wird durch eine Kleine Menge an Regeln definiert
  - **Flexibilität** - Jede Art von Aufgaben ist möglich. Einfache Dingi-einfach, Komplexe- Möglich
  - **Kompaktheit** -Nur norwendige Sprachelemente. Keine Typangaben.

## Folie3

- Typzuordnung erfolgt dynamisch zur Laufzeit.
- der Typ wird  nicht anhand der Klasse, sondern durch das Besitzen von Methoden oder Eigenschaften bestimmt

## Folie4

- Konstanten sind in Ruby nicht wirklich konstant
- Der Wert einer Konstanten kann nach der Initialisierung verändert werden.
- Im Unterschied zu lokalen Variablen werden die Konstanten in Ruby großgeschrieben und müssen bei der Definition initialisiert werden.

## Folie 5

- Bedingungsausdrücke unterscheiden sich kaum von anderen gängigen Programmiersprachen
- Neben dem if- Ausdruck kennt Ruby den aus Perl bekannten unless-Ausdruck
  - Dieser verhält sich zum if-Ausdruck ähnlich wie die until-Schleife zur
    while-Schleife.
  - Der then-Anweisungsteil bei dem unless-Ausdruck wird also nur
    dann ausgeführt, wenn die Bedienung nicht zutrifft
- Der case-Ausdruck, welcher in Programmiersprache C oder Java als switch-Anweisung
  bekannt ist, existiert auch in Ruby. Die Syntax ist dabei sehr ähnlich mit anderen Programmiersprachen.
- ​
- Eine weitere sehr nützliche Eigenschaft, die Ruby aus Perl übernommen hat, sind
  die sogenannte Anweisungsmodifizierer. Es handelt sich dabei um eine if- oder eine
  unless-Anweisung, die an das Ende einer normalen Anweisung angehängt wird. So
  wird der Ausdruck nur dann ausgewertet, wenn die if-Bedingung true, bzw. die
  unless-Bedingung false ist.



## Folie6

- Die einzigen Schleifenkonstrukte in Ruby sind while- und until-Schleifen. 
- Diese beide Schleifenarten gibt es in Ruby ebenfalls als Anweisungsmodifizierer - while kann also wie unless am Ende einer normalen Anweisung eingesetzt werden
- Die einfachste Schleifenart ist die Endlosschleife
- In Ruby wird diese durch den loop-Iterator realisiert.
- Mit den Anweisungen break, do, next und retry kann der Ablauf der Schleife gesteuert werden

## Folie7

- Ein von Smalltalk übernommenes Sprachmitteln sind die sogenannten Codeblöcke. 
- In Ruby sind diese Codeblöcke mehr als nur eine Gruppe von Anweisungen, gelegentlich werden sie als namenlose Funktionen bezeichnet
- Ein Block kann Parameter aufnehmen oder auch selber als Parameter übergeben werden
- Die Ausführung des Blocks erfolgt nicht, wenn Ruby auf ihn trifft. Erst in der Methode kommt es zu dem Aufruf des Blocks, wenn diese ein `yield` enthält.
- Der letzte ausgewertete Ausdruck des Blocks wird als Wert zurückgeliefert
- Zu beachten ist, dass die Methodendeklaration keinen Block als Eingangsparameter
  enthält
- Es ist also notwendig vor dem Aufruf der yield-Anweisung sicher zu stellen,
  dass der Methode ein Block übergeben wurde.

## Folie 8

- Codeblöcke sind in Ruby keine Objekte, sondern syntaktische Strukturen
- Ruby bietet mehrere Möglichkeit, ein Objekt zu erzeugen, das einen Block darstellt.
- Diese Objekte werden Procs oder Lambdas genannt.
- Beide sind zwar Instanzen der Klasse `Proc`, verhalten sich jedoch unterschiedlich
- Lambdas haben ein methodenähnliches und Procs dagegen ein blockähnliches Verhalten
- Lambdas führen im Gegensatz zu Procs Parameterüberprüfung durch. Wird eine falsche
  Argumentenanzahl an das Lambda-Objekt übergeben, so kommt es zu der wrong
  number of arguments- Exception. Proc dagegen führt den Block normal aus.
- Ein weiterer Unterschied zwischen Procs und Lambdas liegt in dem Verhalten bei der
  Ausführung einer Return-Anweisung. Die Ausführung einer Return-Anweisung bei einem
  Proc-Objekt führt zum Verlassen des Kontextes der aktuellen Ausführung. Das bedeutet,
  dass die Anweisungen, die direkt nach dem Blockaufruf kommen, nicht mehr ausgeführt
  werden. Lambda verhält sich in diesem Fall wiederum methodenähnlich und verlässt
  nur den Block. Anweisungen, die in dem Kontext nach dem Block kommen, werden
  ganz normal ausgeführt.

## Folie 10

- Iteratoren sind ein weiteres interessantes Konzept aus der Programmiersprache Smalltalk
- Ein Iterator ist eine Methode, Container Objekte arbeitet.
- Iteratoren gibt es in Ruby in vielen Klassen
- Bekanntester Iterator ist each
- Durch die Verwendung von Codeblöcken und Iteratoren wird eine klare Trennung der Verantwortlichkeiten ermöglicht

## Folie 11

- Methodendefinition in Ruby beginnt mit dem Schlüsselwort def und endet mit dem Schlüsselwort end. 
- Da Ruby eine dynamisch typisierte Sprache ist, ist die Typangabe für Parameter und Rückgabewert nicht erforderlich
- Return Anweisung ist optional, Es wird immer das Ergebnis des Letzten Ausdruckes zurückgeliefert
- Für Methodennamen gibt es in Ruby eine Konvention, die zwar von der Sprache nicht
  erzwungen wird, jedoch in der Ruby-Welt verbreitet ist.

## Folie 12

- In Ruby ist es nicht erlaubt, Methoden zu überladen, d.h. es können keine zwei Methoden
  mit demselben Namen in einer Klasse definiert werden
- Um dies zu umgehen, wurde die Möglichkeit einer Defaultbelegung von Argumenten bei der Definition von Methoden geschaffen.
- So kann dieselbe Methode mit unterschiedlicher Anzahl von Argumenten aufgerufen werden
- Alternativ kann an eine Methode eine variable Argumentenanzahl als Array übergeben
  werden. Hierfür muss die Methode mit einem Parameter, der mit einem * anfangen muss,
  definiert werden: def methode(*args) .. end.
- In der Version 2 von Ruby sind optionale benannte Parameter dazugekommen



## Folie13

- Array – geordnete Liste von Objekten beliebigen Typs
- Der Zugriff auf die Elemente erfolgt mit der Methode [] und der Angabe eines Indexes
- der Index eines Array in Ruby bei 0.
- Darüber hinaus kann in Ruby ein Index auch negativ sein kann.
- Durch die Angabe eines Indexes und der Anzahl der zurückzuliefernden Elemente, ist es
  möglich einen Teilbereich des Arrays zu adressieren
- Hashes sind ungeordnete Listen mit Key-Value-Paaren
- Zugriff über Key -> Key kann ein Belibiges Objekt sein
- Der Zugriff auf die Elemente eines Hashes erfolgt analog zum Array über die []-Methode

## Folie 14

- Eine Klassendefinition beginnt in Ruby mit dem Schlüsselwort class und endet mit
  end.
- Der Name einer Klasse beginnt immer mit einem Großbuchstaben
- Eine Instanz einer Klasse wird über die Klassenmethode new erstellt
- zu diesem Zeitpunkt eine Instanz der Klasse erzeugt
- Im Anschluss wird die private Methode initialize aufgerufen, welche sich ähnlich verhält wie Klassenkonstruktoren in anderen Programmiersprachen.
- Übergebene Argumente an die Klassenmethode new werden dabei an initialize weitergereicht
- Keine Möglichkeit Initialize zu überladen
- In Ruby werden die Klassen nie geschlossen, das bedeutet, eine Klasse kann zur Laufzeit
  jederzeit geändert oder erweitert werden. Wenn der Interpreter auf eine Klassendefinition
  trifft, so prüft er als erstes, ob die Klasse bereits existiert. Ist dies der Fall, so werden
  die Methoden und Variablen aus der neuen Definition in die bereits existierende Klasse
  hinzugefügt. Die Funktionalität der bereits existierende Klassen kann auch modifiziert
  werden, in dem die bestehenden Methoden überschrieben werden.

## Folie 15

- Ruby ist eine objektorientierte Sprache und bietet also auch die Möglichkeit der Vererbung.
- Bei der Definition einer Klasse kann angegeben werden, dass diese eine andere Klasse
  (Oberklasse) erweitert oder von ihr erbt. Wird keine Klasse explizit angegeben, erweitert
  die neue Klasse implizit die Object -Klasse. In Ruby kann eine Klasse beliebig viele
  Unterklassen haben und nur eine Oberklasse. Die Vererbung wird in Ruby mit Hilfe von
  < - Operator erreicht.
- ​
- Um den Komplikationen der Mehrfachvererbung aus dem Weg zu gehen, unterstützt Ruby standardmäßig nur einfache Vererbung
- Mit Hilfe sogenannter Mixins8 kann das Verhalten der Mehrfach-Vererbung simuliert werden
- Eine Ruby Klasse kann beliebig viele Mixins einschließen und somit auf deren Funktionen zugreifen
- Ein Mixin kann entweder mit dem Schlüsselwort include oder extend in einer Klasse
  eingebunden werden. 
- Mit dem Schlüsselwort include werden die Methoden eines Mixins als Instanzmethoden in der Klasse hinzugefügt 
- und als Klassenmethoden bei extend

## Folie 16

-  sowie auch in anderen Sprachen steht in Ruby das System der Exceptions zur Verfügung.
- Exception Objekt speichert Information über den Fehler
- Tritt ein Fehler auf, wird die Information darüber in einem Exception Objekt so lange durchgereicht, bis dieser Fehlertyp im Programm behandelt wird
- es durchaus möglich auch eigene Exceptionklassen zu definieren. Diese
  sollten von der StandardError oder einer Unterklasse der StandardError erben.
- Um in einem Codeabschnitt die Exceptions behandeln zu können, wird der Codeabschnitt innerhalb eines Blockes zusammengefasst. Das Schlüsselwort rescue mit der Angabe des Fehlertyps innerhalb dieses Blocks dient zum Fangen der aufgetretenen Exception. Wenn der Fehler an dieser Stelle nicht behandelt werden soll, so ist es möglich mit raise den Fehler an die nächsthöhere Ebene weiterzugeben.
- Es kann vorkommen, dass bestimmte Anweisungen auf jeden Fall ausgeführt werden
  sollen. Um dies sicherzustellen, kann das ensure- Statement verwendet werden. Es spielt dabei keine Rolle, ob ein Fehler aufgetreten ist oder der Block normal ausgeführt wurde, der Code hinter dem ensure- Statement wird in jedem Fall ausgeführt

## Folie 17

- Introspektion ist die Möglichkeit, zur Laufzeit die Informationen über eine Klasse oder ein Objekt zu untersuchen
- Zum Beispiel kann zur Laufzeit ermitteln werden, zu welcher Klasse ein Objekt gehört, welche Instanzmethoden oder Variablen ein Objekt besitzt oder wie die Objekthierarchie aussieht
- Wie bereits erwähnt wurde, ist Ruby eine untypisierte
  Sprache und arbeitet nach dem Duck Typing Prinzip . Da es bei diesem Prinzip
  nicht um den Typ geht, sondern ob dieser Typ die Methode, die aufgerufen werden
  soll, versteht, muss im Programmablauf dies sichergestellt werden können. Für diesen
  Zweck steht in Ruby eine weitere Introspektionsmethode:respond_to? . Mit Hilfe
  dieser Methode kann zur Laufzeit ermittelt werden, ob das Objekt die aufzurufende
  Methode kennt.

## Folie 18

- Ruby ist keine Funktionale Programmiersprache. Ruby unterstützt mehre Paradigmen.
-  Eins davon ist die funktionale Programmierung.
- Konstrukte wie Blöcke, Lambdas und Procs ermöglichen einen funktionalen Programmierstil.

Was bedeutet also Funktionale Programmierung in Ruby

- Funktionale Programmierung bedeutet nichts anderes als Programmieren mit Funktionen. 
  - Unter Funktionen werden dabei mathematische Funktionen verstanden, die keine Seiteneffekte haben und so bei gleichen Eingabewerten immer den gleichen Rückgabewert zurückliefern.
- Um Seiteneffekte möglichst zu vermeiden, sollten Variablen wie Konstanten behandelt
  werden. Wird ein Wert einer Variable zugewiesen, darf die Variable im weiteren Programmablauf
  keinen anderen Wert mehr annehmen. Aus diesem Grund ist der Ausdruck,
  wie x = x + 1 in der funktionalen Programmierung nicht erlaubt
- Auch innerhalb der Funktionen sollten Seiteneffekte vermieden werden. Eine Funktion
  darf keine eingehende Argumente verändern und unabhängig davon, wie oft die Funktion
  aufgerufen wird, muss diese immer das selbe Ergebnis zurückgeben.