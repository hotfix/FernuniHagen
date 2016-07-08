[TOC]

# Kurseinheit 2

## Kapitel 2 Verzögerte Auswertung

### 2.1 Parameteru ̈bergabe und Auswertungsstrategien
+ *call-by-value* realisiert die strikte Semantik von Funktionen, d.h. irgendein undefiniertes Argument, macht die gesamte Funktionesanwendung undefiniert.
> **strenger Auswertung** - Ausdrücke werden sofort ausgewertet. Zum Beispiel bei der Berechnung einer Funktion werden bei strikter Auswertung erst die Argumentausdrücke ausgewertet, bevor der Funktionsrumpf ausgewertet wird.
> **Bedarfsauswertung** oder **verzögerte Auswertung** - Ausdrücke werden erst ausgewertet werden, wenn deren Wert in einer Berechnung benötigt wird.


+ *applicative order* - entsprechende Auswertungs- bzw. Reduktionsstrategie von Ausdrücken. Wird auch *eager evaluation* bezeichten
+ In funktionalen Sprachen  wird ein Ausdruck zu einer *weak normal form* order *weak head normal form* ausgewertet
+ Sowohl applicative order als auch normal order und lazy evaluation werten Funktionsargumente von links nach rechts aus.
+ Ausnahmen von der call-by-value Parameterübergabe sind : *andalso* oder *orelase*. Grund:  nicht strikt im 2. Argument. Argumente werden nur dann ausgewertet, wenn es zur Berechnung des Gesamtausdrucks notwending ist. => *call-by-name* 
+  Vorteile von *call-by-name* - Effizienzgewinne durch Nichtauswerten nicht benötigter, komplizierter Ausdrücke. Zum anderen werden durch die Nicht-Striktheit bei der Fallunterscheidung terminierende rekursive Funktionsdefinitionen +berhaupt erst möglich [KE2 S.4].
+  Definierende Ausdrücke von Funktionen werden nicht bei der Funktionsdefinitionausgewertet, sondern bei der Applikation.  Somit kann man die Auswerung verzögern, indem man daraus eine Abstraktion macht.
```
 /*folgende Funktion*/
 fun f (x,y) = if x=0 then 0 else x*y*y
 
 /*Beim Aufruf von f (0,y)  wird y immer ausgewertet
 Man kann y in eine Abstraktion über dem Nulltupel () "verpacken".
 Der Funktionsaufruf würden dann wie folgt aussehen: 
 f (0,fn ()=>y)
 
 Jetzt mus in der Funktion f alle Auftreten von y durch eine Applikation auf () ersetzt werden.
 fun f (x,y) = if x=0 then 0 else x*y ()*y ();
 
 */
```
**Links zum Nachlesen:**
+ https://de.wikipedia.org/wiki/Lambda-Kalk%C3%BC
+ https://de.wikipedia.org/wiki/Currying
+ https://en.wikipedia.org/wiki/Evaluation_strategy
+ 

