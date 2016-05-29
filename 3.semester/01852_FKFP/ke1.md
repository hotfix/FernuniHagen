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
```Lisp
(*Ganze Zahl*)
5;
> val it = 5 : int


(*---------------------------------------
Funktionen auf ganze Zahlen: +, -,*, div, mod 
Typ der Operationen: int * int -> int
- int * int: Typ der Argumente
- rechts vom Pfeil, Typ der Ergebnisse
-> oder * sind Typkonstruktoren
---------------------------------------*)
```
+ Diese Funktionen haben eine Infix-Notation

```Lisp
(* unäre Operation auf ganzen Zahlen *)
(*negative ganze Zahl*)
~5;
> val it = ~5 : int

(*Absolutbetrag einer ganzen Zahl*)
abs(~5);
> val it = 5 : int
```
+ Beide Funktionen sind vom `int -> int`
+ `~` und `abs` sind Präfix-Funktionen




+ Funktionsapplikation eine *linksassoziative* Operation, d.h `f g x` wird impliziert als `(f g) x` geklammert									

#### Reelle Zahlen

```lisp
(*Beispiel für Reele Zahlen*)

2.3;
> val it = 2.3 : real

1.5E~2;
> val it = 0.015 : real

2E1;
> val it = 20.0 : real
(*Beachte: 20.0 <> 20*)
```

+ Werte sindaber erst dann vergleichbar, wenn sie den gleichen Typ besitzen.

```lisp
(*---------------------------------------
Funktionen auf reelen Zahlen: 
+, -,*, /, ~, abs 
Typ der Operationen: 
real * real -> real
real -> real
---------------------------------------*)
```

+ Zur Konvertierung zwischen reellen und ganzen Zahlen gibt es die beiden Funktionen: 
  + `real: int -> real` 
  + und `floor: real -> int`

#### Zeichen und Zeichenketten
+ Typ `string` umfasst Zeichenketten, diese werden als Folge von Zeichen dargestellt, die durch Anführungszeichen dargestellt sind.
+ Typ `char`enthält einzelne Zeichen
+ Funktione `ord: char -> int`liefert den Code einzelnes Zeichens
+ Funktione `chr: int -> char`liefert das Zeichen zu dem Code im Bereich von 0 bis 255

```
ord #"a";
> val it = 97 : int

chr(97);
> val it = #"a" : char
```
+ Funktion `str: char -> string` wandelt ein Zeichen in einelementige Zeichenkette um
+ Funktion `^: string * string -> string` dient zur Konkatenierung von Zeichenketten zu einer Zeichenkette.

```
"A" ^ "BC" ^ str #"D";
> val it = "ABCD" : string
```
+ Funktion `ize: string -> int` liefert die Länge einer Zeichenkette zurück
+ Funktion `substring: string * int * int -> string` liefert einen Teil einer Zeichenkette zurück. Die Position beginnt bei 0

```
substring ("01234",1,3);
> val it = "123" : st		ring
```

####Wahrheitswerte
+ Eine Funktion, die immer dann undefiniert ist, wenn irgendeines ihrer Argumente undefiniert ist, nennt man auch *strikt*.
+ `orelse` und `andalso` sind nicht strikt 

### 1.2 Tupel, Records und Listen
+ Tupel ist eine Folge von Werten mit unterschiedlichen Typen.
+ Sind keine Elementare Werte, sondern bilden eine Datenstruktur, die orthogonal zu allen anderen Werten verfügbar ist.
+ Einzelne Elemenete eines Typels werden *Komponenten* gennant
``` 
(1-1,true,0.0,1>2);
> val it = (0,true,0.0,false) : int * bool * real * bool
```
+ Es existieren auch einstellige Tupeln `(20)`oder Nulltupel `()`
```
();
> val it = () : unit
```
+ Komponenten können anhand der Posiiton angesprochen werden, die Prosition beginnt bei 1
```
#1 (1-1,true,0.0,1>2);
> val it = 0 : int
#1 (#2 (1.1,(2,3.3)));
> val it = 2 : int
```
+ Zwei Typel können auch Gleichheit getestet werden, wenn der Test für die Verwendeten Komponenten zur Verfügugn steht.
```
((1,false)=(2-1,false),("A",1)<>("A",1));
> val it = (true,false) : bool * bool
```

+ Tupel ist ein spezieller *Record*
+ Komponenten von Record sind nicht geordnet und werden über Namen indentifiziert
```
{Name="Martin",Age=34};
> val it = {Age=34,Name="Martin"} : {Age:int,Name:string}

#Pos {Ort="Hagen",Pos=(12,4)};
> val it = (12,4) : int * int
```
+ Ein *k-Tupel* ist  einfach ein Record, in dem die Namen der Komponenten die Zahlen 1, . . . , k sind.
+ Tupel bieten eine Abkürzende Schreibweise für Record, z.B.
```
1=9,3=3.0,4=(),2=true}=(9,true,3.0,{});
> val it = true : bool
```

+ Vorteile von Listen gegenüber Mengen:
  + Reihnenfolgen festgelegt werden
  + Dublikate können verwaltet werden
+ Alle Elemente einer Liste haben den selben Typ(homogen).

```
[1,2,3];
> val it = [1,2,3] : int list

```
+ Leere Liste wird mit `[]` oder `nil` bezeichnet

#### Funktionen auf Listen

```
(* Funktion hd berechnet das Erste Element einer Liste*) 
hd [1,2,3];
> val it = 1 : int

(* Funktion tl berechnet die Liste ausser dem ersten Element *)
tl [[1,2],[3],[]];
> val it = [[3],[]] : int list list

(* Funktion :: (cons) ermöglicht das Anfügen eines Elemntes am Anfang einer Liste *)
"L"::["i","s"];
> val it = ["L","i","s"] : string list

(* Funktion @ ermöglicht das Konkatenieren zweier Listen *)
["L","i","s"] @ ("t"::nil) @ ["e","n"];
> val it = ["L","i","s","t","e","n"] : string list

(* Funktion rev kehrt die Reihnfolge der Elemte einer Liste um*)
rev [[3,1],[4],nil,[2,0]];
> val it = [[2,0],[],[4],[3,1]] : int list list

(* Funktion explode zerlegt eine Zeichenkette in eine Liste einzelner Zeichen*)
 explode "Bombe";
 > val it = [#"B",#"o",#"m",#"b",#"e"] : char list
```


### 1.3 Variablen und Definitionen

+ Bezeichner für Werte heissen *Variablen*
+ Zuordnung von Objekten zu einem Bezeichner nennt man *Bindung*
+ Einen *Umgebung* ist durch Folge von Bindungen gegeben
+ **pattern Matching** - mit einer Definition mehrere Variablen auf einmal binden.

```
val (Vorname,Spitzname) = ("Heinrich","Heini");
> val Vorname = "Heinrich" : string
> val Spitzname = "Heini" : string

val first::second::rest = [1,2,3,4,5];
> std_in:9.1-9.37 Warning: binding not exhaustive
>           first :: second :: rest = ...
> val first = 1 : int
> val second = 2 : int
     > val rest = [3,4,5] : int list
```

+ freie Variablen in Funktionen beziehen sich stets auf den Wert, der zum Zeitpunkt der Definition der Funktion gültig ist und nicht zum Zeitpunkt der Funktionsanwendung! (*statisches Binden*)
```
val x = 0;
val y = true;

fun f x = if y then x else x + 1;

y = false;
f 4; (*Result: 4*)
```
+ für lokale Definitionen kann der  `let` - Ausdruck verwendet werden
+ `let dec in exp end`
+ ein `let`-Block verdeckt Variablendefinitionen lediglich temporär, Definitionen, die außerhalb von ihm liegen, bleiben prinzipiell unberührt:
```
val x = "unberuehrt";
> val x = "unberuehrt" : string
> 
let val x=size x
  in
    x*9 
end;
> val it = 90 : int

"x blieb " ^ x;
> val it = "x blieb unberuehrt" : string

```

+ locale Deklarationen mit Hilfe von `local dec' in dec end `
```
 local val x=15
 	   val y=12
 	in
 	   val y=x div 3
       val x=2*y
 end;
 > val y = 5 : int
 > val x = 10 : int

```

### 1.4 Funktionen
+ Funktion kann wie folgt definiert werden:
```
(*anonyme Funktion*)
fn r => 3.1415 * r * r;
> val it = fn : real -> real

val circleArea = fn r => 3.1415 * r * r;
> val circleArea = fn : real -> real


fun circleArea r = 3.1415 * r * r;
> val circleArea = fn : real -> real

```

+ Alle Funktionen haben nur ein Argument und liefern auch nur ein Resultat zurück
+ Für Definition einer Funktion mit mehreren Argumenten gib es zwei Möglichkeiten:
  +  Argumente zu einem Tupel gruppieren
  +  Man definiert die Funktion als Abstraktion des ersten Arguments, und zwar so, daß das Ergebnis eine Funktion ist, die auf die restlichen Argumente anwendbar ist.
+ Durch impliziete Angabe des Typs, kann der Typ erwzungen werden

```
fun sqr (x:int) = x * x;
> val sqr = fn : int -> int

fun sqr (x:real) = x * x;
> val sqr = fn : real -> real
```
+ ML  bietet die Möglichkeit mehrere Funktionen parallel zu definieren. Dies kann z.b. sinnvoll sein bei einer wechselseitigen Rekursion
```
fun even n = n=0 orelse n>1 andalso odd (n-1)
and odd n = n=1 orelse even (n-1);
> val even = fn : int -> bool
> val odd = fn : int -> bool

```

###1.5 Typen und Polymorphismus

+ Konstantetypen in SML sind: `unit`, `bool`,`int`,`real`,`char`,`string`
+ Operationen auf Typen nennt man *Typkonstruktoren*.
+ Eigene Typ Definition geschiet über Deklaration: `type var = τ`
+ mittels **type** deklarierte Typen keine abstrakten Typen darstellen
+ zwei Typen sind genau dann von gleicher Struktur, wenn die sie beschreibenden Typausdrücke bis auf die konstanten Typen wie `int`, `bool` usw. gleich sind
+ *impliziter Polymorphismus* - der Typ muss nicht expliziet angegeben werden
+ *flacher Polymorphismus* - 