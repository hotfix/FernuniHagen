[TOC]

# Kurseinheit 1

## Vorwort

+ *funktionale Programmierung* deutet auf die Verwendung von Funktionen als Programmierkonstrukte
+ Funktionen werden bereits seit langem in der Mathematik eingesetzt
+ Funktionen sind relativ einfach zu begreifende Objekte
+ Funktionsbegridd in der funktionalen Programmierung ist sehr eng an den aus der Mathematik angelehnt
+ Funktion ` f:A → B` ist durch ihren *Definitionsbereich*  A, ihren *Wertebereich* B sowie eine *Abbildungsvorschrift* gegeben.
+ *f* ist Funktionssymbol oder Name der Funktion

+ neuere funktionale Sprachen zeichnen sich insbesondere durch starke, polymorphe Typsysteme sowie (benutzerdefinierbare) Datentypen aus.
+ Typsystem verland, dass jede Funktion einen genau festgelegten Deinitions- und Wertebereich haben muss.

+ *referentiellen Transparenz* - ein und dieselbe Variable an verschiedenen Stellen innerhalb ihres Geltungsbereiches bezeichnet immer den gleichen Wert.
+ Bsp. `i = i + 1` Mathematisch gesehen, nicht erfüllbare Aussage
+ Seiteneffekte = `f` eine Prozedur, die bei jedem Aufruf eine globale Variable um 1 erhöht und den Wert der Variable als Ergebnis liefert , so gilt `f != f`

+ funktionale Sprachen bestehen aus:
  +  Wert- und Funktionsdefinitionen
  +  Zuweisungen an Variablen gibt es nicht


## Kapitel 1  Elemente funktionaler Programmierung

+ funktionales Programm besteht aus einer Menge von Definitionen, welche in einem Ausdruck verwendet werden
+ Abarbeitung eines Programms = Auswerten eines Ausdruckes zu einem Wert

### 1.1 Werte und Ausdrücke

+ *Werte* sind Ausdrücke, die nicht weiter ausgewertet werden können
+ Einfache Werte: Zahlen oder Zeichenketten
+ Konstruirte Werte: Records oder Listen
+ Funktionen sind auch Werte, mit der Besonderheit: sie können auf andere Werte angewandt werden.
+ Alle Werte haben einen eindeutigen Typ
+ *Konstanten* sind Werte die keine Funktionen sind oder enthalten 
+ Auswerten von Ausdrücken - Reduzierung der Ausdrücke auf Werte

#### Ganze Zahlen
```sml
(*Ganze Zahl*)
5;
> val it = 5 : int

(*negative ganze Zahl*)
~5;
> val it = ~5 : int
```