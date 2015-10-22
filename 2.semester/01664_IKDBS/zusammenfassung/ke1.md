# 1. Architektur eines DBS  
## 1.1 Konzept des Datenbanksystems
Probleme der traditionellen Dateiverwaltung mittels Dateisystems

+ **Redundanz** (*redundancy*) - gleiche Daten in verschiedenen Dateien, führt zu hohem Verwaltngs- und Verarbeitungsaufwand, wird nicht zentral kontrolliert.
+ **Inkonsistenz** (*inconsistency*) - logische Übereinstimmung der Inhalte kann schwer aufrechterhalten werden, da Änderungen in allen Dateien übernommen werden müssen. Änderungen müssen aufeinander abgestimmt werden, so dass verschiedene Programme nicht zum gleichen Zeitpunkt auf unterschiedliche Werte eines Feldes zugreifen.
+ **Daten-Programm-Abhängigkeit** - enge Abhängigkeite zwischen Programm und Datenorganisation. Bei Änderung des Dateiformates müssen die Programme auch angepasst werden. Erweiterung des Programms kann neue Anforderungen an Dateiaufbau stellen -> Resturkturierung von Dateien
+ **Inflexibilität** - Dateien sind anwendungsspezifisch, Realisierung neuer Anwendungen, bzw. Auswertung vorhandener Dateien ist problematisch (vor allem wenn es auf mehreren Dateien basiert). 
  
> **Datenbank** (*database*) - ist eine *integrierte* und *strukturierte* Sammlung *persistenter* Daten, die allen Benutzern eines Anwendungsbereiches als *gemeinsame* und *verlässliche Basis* aktueller Information dient.

+ **integriert** (*integrated*) - vereinheitlichte und anwendungsneutrale Gesamtsicht auf Daten, die den natürlichen Gegebenheiten und Zusammenhängen der Anwendungswelt entspricht.
+ **strukturiert** (*structured data*) - logische, redundanzfreie Zusammenstellung der  Daten
+ **persistent** (*persistent data*) - Daten sind dauerhaft auf den externen Speichermedien verfügbar.
+ **gemeinsame Basis** (*shared data*) - Daten stehen für alle Benutzer und Programme zur jeweils eigenen Zwecken zur Verfügung. Auf die gleichen Daten kann von verschiedenen Benutzen gleichzeitig zugegriffen werden (*concurrent access*).
+ **verlässliche Basis** (*reliable data*) - Für die Sicherheit der Datenmuss gesogt werden.

> Ein **Datenbankmanagementsystem** (*database management system*), ist ein All-Zweck-Softwaresystem, das den Benutzer bei der Definition, Konfiguration und Manipulation von Datenbanken für verschiedene Anwendungen applikationsneutral und effizient unterstützt.

> Ein **Datenbanksystem** (*database system*) fasst die beiden Komponenten `DBMS` und `DB` zusammen: `DBS` = `DBMS` + `DB`

+ Kernaufgabe von DBS - strukturierte Informationen entgegen nehmen; effizient speichern und verwalten; auf Anforderung bereitstellen

> Ein **Datenmodell** (*data model*) ist ein mathematischer Formalismus, der aus einer Notation zur Bechreibung der interessierenden Daten und aus einer Menge von Operationen zur Manipulation dieser Daten besteht.

+ Datenmodell erlaubt , die Struktur der Datenbank zu beschreiben und Daten in verständlichen Begriffen zur Verfügung zu stellen.

## 1.2 Anforderungen an DBS
Anforderungen aus dem Blickwinkel der Implementierung:

+ **Datenunabhängigkeit** (*data independence*) 
+ **Effizienter Datenzugriff**
+ **Gemeinsame Datenbasis**
+ **Nebenläufiger Datenzugriff** (*concurrent access*)
+ **Fehlenden oder kontrollierte Redundanz** (*redundancy*)
+ **Konsistenz der Daten** (*consistency*)
+ **Integrität der Daten** (*integrity*)
+ **Datensicherheit** (*security*)
+ **Bereitstellung von Backup- und Recovery-Verfahren** 
+ **Stellen von Anfragen** 
+ **Bereitstellen verschiedener Benutzerschnittstellen**
+ **Flexibilität**
+ **Schnellere Entwicklung  neuer Anwendungen**

## 1.3 Das 3-Ebenen-Modell

Drei Abstraktionsebenen:

+ **physische/interne Ebene** (*physical/internal level*) - basiert auf einem physischen/internen Schema, das die physischen und persistenten Speicherstrukturen der Datenbank beschreibt. Wird beschrieben *wie* Daten gespeichert werden
+ **konzeptuelle Ebene** (*conceptual level*) - basiert auf einem konzeptuellen Schema.  Beshreibt Entitäten, Datentypen,Beziehungen und Integritätsbedinungen. Hier wird modelliert *was* für Daten gespeichert werden.
+ **externe Ebene** (*external level, view level*) umfasst externe Schemata und Benutzersichen. Jede Benutzersicht beschreibt die Datenbanksicht einer Benutzergruppe und verbirgt den Rest der Datenbank von ihr.

+ **Transformationsregeln** (*mappings*) - definieren die Beziehungen zwischen jeweils zwei aufeinanderfolgenden Ebenen. Legen fest wie die Objete der Ebenen aufeinander abgeboldet werden,

Vorteil des 3-Ebenen-Modells ist die **Datenunabhängigkeit** 

+ **Datenunabhängigkeit** (*data independence*)- Daten auf den Höheren Ebenen bleiben unbeeinflusst von den Änderungen auf den darunter liegenden Ebenen.
  + **logischen Datenunabhängigkeit** - Änderungen des konzeptuellen Schemas haben keine Auswirkungen auf externe Schema
  + **physische Datenunabhängigkeit** - Änderungen des internes Schemas haben keine Auswirkungen auf konzeptuelle Schema

![1664_ke1_k1_img12.png](https://draftin.com:443/images/31938?token=Y6GrzrCWuXHp946Uwe5hMS83PBBJYvn3Xh63eeJBCH6a4tD50ICm3wKc9mrhjeOjqWPkEaxi0BQvjEyzdBG3Aq0) 

## 1.4 Softwarearchitektur eines 

DBMS ist hierarchisch in Schichten aufgebaut (*Schichtenarchitektur*).
+ Oberschicht baut auf der direkt unterliegenden Schicht auf und Benutzt über die Schnittstelle die Objekte und Operationen dieser Schicht.
+ Interne Struktur der unterliegenden Schicht bleibt verborgen

![1664_ke1_k1_img13.png](https://draftin.com:443/images/31939?token=QXkvn0pHvcD6Jmh4zM3ewpidJyRMqPQhiiinP-wZXqjeivKXk4Et9zFc5J4hpiLGSOTlMDdajjUo1xNQ7ZxscsI) 

1. Schicht: **Geräte- und Speicher-Manager** (*disc space manager, data manager*) 
  - Verwaltung der HW- Betriebsmittel; 
  - Ausführung der Speicherzugriffe; 
  - Zuständig für die Bereitstellung und Freigabe von Speicherplatz zur Darstellung von Daten auf externen Speichermedien und für physische Lokalisierung eines angeforderten Datums.
1. Schicht: **Systempuffer-Manager** 
  - unterteilt verfügbaren Haupspeicherbereich in Folge von Seiten und Rahmen
  - Eine Seite auf einem Block; Lesen und Schreiben mit einem Zugriff möglich
  - Lesen von Seiten in den Puffer; Schreiben von Seiten aus dem Puffer auf Platte
  - An die obere Schicht werden *Segmente* gestellt
1. Schicht:
  + **Zugriffspfad-Manager** 
    - Verwaltet externe Datenstrukturen zur Abspeicherung der Kollektionen von Datensätzen und zum Zugriff auf Kollektionen von Datensätzen
    - Beispiel: sequenzielle Speicherstrukturen, wie Indexstrukturen: `B*`-Baum
    - Operationen beinhalten: Erzeugen/Löschen der Speicherstrukturen; Speichern, Auffinden, Ändern, Löschen der Datensätze innerhalb dieser Strukturen
  + **Record-Manager** 
  - ist für die interne Darstellung logischer Datensätze zuständig
  - Operationen: Aufbau und Zerlegung interner Datensätze und Zugriff auf deren Komponenten
1. Schicht:
  + **Recovery-Manager** - Versetzung der Datenbank in den Konsistenten Zustand vor einer Transaktion;
  + **Transaktion-Manager** - Übernimmt die Verwaltung der Transaktionen; Transaktionen werden zeitlich verzahnt ausgeführt
  + **Sperr-Manager** - Verwaltet Anforderungen auf Sperren und gewährt Sperren auf die Datenbankobjekte, wenn diese verfügbar sind; Sperrinformationen werden in einer Sperr-Datei gespeichert.
1. Schicht:
  + **Autorisierungs-Manager** - Führt Zugriffskontrollen für Anfragen und Kommandos;Ermittelt ob der Benutzer auf die Abgefrage Daten zugreifen darf.
  + **Integritäts-Manager** - Prüft die Integritätsbedienungen der Änderungen
  + **Update-Prozessor** - Bearbeitet die Änderungsanfragen
  + **Anfrage-Optimierer** - Optimiert den Ausführungsplan einer übergebenen Anfrage
  + **Anfrage- und Kommando-Ausführer** - Erzeugen die Zugriffspläne für den Code
1. Schicht: bietet nach Obenhin eine mengenorientierte Schnittstelle an
  + Anwendungsschnittstelle  - für ungeübte Benutzergruppen; sind bereits in  Anwendungsprogrammobjectcode übersetzt  
  + **DDL-Übersetzer** - verarbeite Schema Definitionen in DDL und Speichert 
  + Anfragenschnittstelle - für professionelle Benutzer; Anfragen mittels deskriptiven, nicht-prozeduralen Hochsprache
  + **Anfrage Parser** - führt eine lexikalische Analyse; Syntaxanalyse; Überführung in ein Syntaxbaum
  + **DML-Präprozessor** - filtert die  DML-Kommandos und füht dem DML-Übersetzer zu.
  + **DML-Übersetzer** - Übersetzt die Kommandos in Objektcode
  die Beschreibung der Scemata in Systemkatalog ab
  + **Ausgabe-Generierung**

+ **Systemkatalog-Manager** - Steht zu fasst allen Komponenten in Verbindung; verwaltet Systemkatalog
+ Systemkatalog - enthält Meta-Daten über Struktur der Datenbank

----------


# 2. Externespeicher und Systempufferverwaltung 

## 2.1 Primär- und Sekundärspeicher

+ **Primärspeicher** - Hauptspeicher; Cache-Speicher; Hier kann die Zentraleinheit eins Rechners direkt arbeiten.; Schneller aber flüchtiger Speicher
+ **Sekundärspeicher** - Speicher mit großer Kapazität, niedrigen Kosten und langsameren Datenzugriff; Nicht flüchtiger Speicher; Kann von der Zentraleinheit nicht verarbeitet werden
+ Auf dem *Sekundärspeicher* werden Daten in *Blöcken* gespeichert
+ Blöcke - zusammenhängende Folge von Bytes; Einheit in der Daten geschrieben gelesen werden; Umfasst Vielfaches von 512 Bytes; ist zwischen 1-8 KB gross.
+ Blöcke werden in konzentrischen Ringen(Spuren) angeordnet .
+ Spuren sind in Sektoren unterteilt
+ Direkter Zugriff im Hauptspeicher = Direkter Zugriff auf der Platte: ABER!
  +  Zugriff zu einer Position auf der Platte ist komplizierter
 `Zugriffszeit =  Suchzeit + Latenzzeit +Übertragungszeit`
+ *Suchzeit* = Positionierung des Lese/Schreibkopfes auf die richtige Spur mit dem richtigen Block
+ *Latenzzeit* =  Wartezeit, die für Rotation des Lese/Schreibkopfes auf den gewünschten Block benötigt wird
+ *Übertragungszeit* = Zeit die zum Lesen/Schreiben tatsächlich aufgewendet wird

## 2.2 Das physische Datenmodell

+ Physisches Datenmodell beschreibt Implementierungseinzelheiten in Bezug auf Aufbau der Daten,
Datenspeicherung und Zugriffspfaden
+ Dateien - Speichereinheit in der Datenbank.
+ Vorteile von Dateien als Einheiten der Externenspeicherverwaltung:
  + nur benötigte Dateien für direkten Zugriff müssen gehalten werden
  + Speicherplatz für temporär benötigte Dateien kann freigegeben werden
  + Zugriffsanforderungen spezieller Anwendungen können durch Zuordnung von Dateien auf unterschiedlich schnellen Speichermedien unterstütz werden
  + Kürzere Adresslängen für zur Adressierung der Objekte sind ausreichend
  +  Logisch zusammengehörende(gleich/ähnlich strukturiert) Daten können in einer Datei abgespeichert werden

+ Datei ist eine Folge von Datensätzen und physisch als eine Folge von Blöcken organisiert.  Auf einem Block könne mehrere Datensätze abgebildet werden.

## 2.3 Datensatzformate

+ *Datensatz* = Sammlung von zueinender in Beziehung stehenden *Werten*.
+ *Wert* = ein oder mehrere Bytes = *Feld* eines Datensatzes
+ *Datensatzformat* - wird durch Sammlung von Feldwerten und eine Zurdnung von Datentypen zu Feldnamen festgelegt.

### 2.3.1 Datensätze fixer Länger

+ Jeder Datensatz hat gleiche Größe in Bytes
+ Felder eines Datensatzes können aufeinanderfolgend gespeichert werden
+ *Offset* = Summe der Längen der Felder von der Basisadresse
![1664_ke1_k2_img21.png](https://draftin.com:443/images/32098?token=YLQV2e4288P35cdgzjHDHjek0KtPidRDtFU8yfV8cpG6qWOe24EsHn2MY6cO-nkvJEzsz2JOdZNcyPdG32lfzLg) 

+ Datensatz- und Feldinformation sind im Systemkatalog gespeichert
+ Einfach zu verwalten; schnelle Suchverfahren; Speicherplatzverschwendung; ungünstigere Zugriffszeiten, da der zu durchsuchende Speicherbereich, bzw. Zahl der zu übertragenden Blöcke zum Aufsuchen einer bestimmten Satzmenge größer wird.

### 2.3.2 Datensätze variabler Länger

+ einige Felder des Datensatzes haben variable Länge
+ Mögliche Organisation:
  + aufeinanderfolgende und durch Separatoren getrennte Speicherung von Feldern
  + *Separatoren* -spezielle Symbole, die in Daten nicht vorkommen.
  + *Terminatorsymbol* markiert das Ende eines Datensatzes
  + => Erfordert Durchlauf eines Datensatzes um ein Feld zu finden
+ weitere Mögliche Organisation:
  + Jedes Feld beginnt mir einem Zähler(= Anzahl beanspruchte Bytes)
  + => Auch hier wird ein Durchlauf benötigt 
![1664_ke1_k2_img22.png](https://draftin.com:443/images/32100?token=rkaF23ICfOJmHmxCn2Y-kVXZ4xmaEqU0ctvuhJwGP8v5vjUyyyUx8xqsQYqdyc-2d-ciHrvS9-vIQc7e5NCAtY8) 

+ andere mögliche Organisation:
  + Am Anfang von Datensatz Speicherplatz für Verzeichnis von Integer-Offsets oder Zeigern zu reservieren.
  + i-te Zahl ist Startadresse des i-ten Feldwertes relativ zum Beginn des Datensatzes
  + Ende des Datensatzes muss auch gespeichert werden
  + Kosten nur durch das Offset Verzeichnis; direkter Feldzugriff möglich; Probleme treten bei Änderungen auf, Beim Wachsen des Feldwertes müssen nachfolgende verschoben werden.

### 2.3.3 Datensätze sehr großer Länger

+ Problem, wenn ein Datensatz so groß ist, dass es nicht mehr auf eine Seite passt
+ Großer Datensatz kann in viele kleine unterteilt werden; Jeder kleine enthält einen Zeiger auf den nächsten.
+ Im Feld wird nur die wichtigste Information eines Datensatzes. Genaue Repräsentation erfolgt in Folge von speziellen Datenseiten; Es  wird eine zusätzliche Seitenreferenz gespeichert

### 2.3.4 Ausrichtung von Feldwerten

+ allgemeines Problem: Forderung nach der Ausrichtung der Feldwerte. d.h. die absolute Anfangsadresse eines Feldwertes durch die Anzahl der Bytes zur Darstellung des zugehörigen Types ganzzahlig teilbar sein muss.
+ Einschränkung gibt es für Integer, Real, Long Real Werte
+ absolute Anfangsadresse des Datensatzes muss durch die größte Anzahl an Bytes teilbar sein.

### 2.3.5 Zeiger

+ Datensatzreferenz erfolgt mit Hilfe von Zeigern
+ **physische Zeiger** - Datensatzzugriff ist schnell; Nicht erwünscht, weil das Verschieben eines Datensatzes innerhalb einer Seite nicht möglicht(alle Zeiger auf diesen Datensatzes müssten gefunden werden)
+ **seitenbezogene Zeiger** - Paar `(s,p)`; `p` Indexposition auf Seite `s`.; Es wird die relative Position angegeben; Zum verschieben muss nur die Indexposition geändert werden.
+ **logische/symbolbezogene Zeiger** - Datensatz bekommt eine logisch Adresse, welche nichts über die Abspeicherung aussagt; Realisierung durch indirekte Adressierung; Zeiger verweist auf Indexposition einer Zuordnungstabelle, deren
Eintrag die Position des Datensatzes im Speicher angibt. Nachteil: Zusätzlicher Zugriff und oft Tabelle zu groß für Hauptspeicher.

+ **Fixierte Datensätze** - Zeiger unbekannter Herkunft zeigen auf die Datensätze; können nicht verschoben werden
+ **unfixirteDatensätze** - können innerhalb oder zwischen Seiten verschoben werden
+  **baumelnde Zeiger** - Entstehen, wenn fixierte Datensätze gelöscht werden und neue Datensätze eingefügt werden, verweisen die Zeiger dann auf falsche oder fehlende Datensätze
 => für jeden Datensatz eine Löschmarkierung verwalten, freigewordener Speicherplatz kann dann aber nicht verwendet werden.

## 2.4 Seitenformate

+  Seite=Sammlung von Slots, jeder Slot enthält einen Datensatz 
+ Ein Datensatzidentifikator (DID) besteht aus Paar `(s,n)`, `n` verweist auf den Slot und `s` Nummer der Seite mit dem Datensatz ist 

### 2.4.1 Seitenformate für Datensätze fixer Länge

+ Wenn Datensätze gleicher Länge , dann auch alle Slots gleich groß.
+ *Gepackte Organisation:* N Datensätze in den ersten N Slots abzulegen; Unflexibel
+ *Ungepackte Organisation:* Informationen über freie Slots werden über Bitmap -Verzeichnisse verwaltet. Die Suche des i-ten Elementes erfordert Durchlauf durch das Verzeichnis, Datensätze müssen nicht verschoben werden. Auf Verzeichnis kann verzichtet werden, wenn es ein spezielles Feld gibt, das einen Zeiger auf den 1.freien Slot enthält. Dieser enthält wiederum einen Zeiger auf den nächsten freien Slot uw.

![1664_ke1_k2_img24.png](https://draftin.com:443/images/32250?token=VGASyRoYyx3ockDT1e5kO6R2KV7Q8gRQw4lRxtlzWg-nbXrMCHCBORJnXsXSKgcEECvpnbt-U9NhUmPXQqvcjko) 

### 2.4.2 Seitenformate für Datensätze variabler Länge

+ Damit es nicht zur *Fragmentierung* kommt, müssen Datensätze auf einer Seite verschoben werden.
+ unfixierte Datensätze( externe Zeiger Spielen keine Rolle) kann gepackte Organisation mit Terminatorsymbol oder Längenangabe am Datensatzanfang.
+flexibelste Organisation wird durch *Datensatzidentifikator-Konzept* beschrieben; in relationalen DBS ist es *Tupelidentifikator-Konzept*; Jedem DS wird ein eindeutiger, stabiler DID zugeordnet, bestehend aus Seitennummer und Index:
![1664_ke1_k2_img25.png](https://draftin.com:443/images/32251?token=s5SM337nuqEIv-v646G1tVOlxiRIGci2VnrM5yPHUul4dHNX-3Zdz_Q2XWfourpi7ceSwFxOAN-0o0RqGa-DOXs) 
+ Freispeicherverwaltung durch Zeiger auf 1.freien Slot. Ist ein Datensatz zu groß zur Aufnahme in die Seite, wird diese komprimiert->maximaler Speicherplatz. Passt er immer noch nicht hinein->Auslagerung
auf Überlaufseite (max 1)->Zugriff mit max. 2 Seitenzugriffen

### 2.4.3 Seitenformate für Datensätze sehr großer Länge

+ Zwei Strategien: 
  + 1. Zerlegung des Datensatzes in eine Folge von mittels Zeigern verketteten, kleineren Datensätze und über Anzahl von Seiten verteilt wird (*spanned records*). 
  + 2. Nur die wichtigsten Informationen werden abgespeichert und genaue Repräsentation auf Folge von speziellen Datenseiten

## 2.5 Abbildung von Datensätzen in Seiten
+ *Clustering* -  logisch verwandte Datensätze, physisch nahe beieinanderliegend auf einem externen Speichermedium angeordnet.
+ Clusterung ist wichtiger Faktor für Effizienz, weil dann die zusammengehörige Datensätze entweder schon alle im Systempuffer sind oder zumindest die Suchzeit klein ist, weil der R/W-Kopf kaum bewegt werden muss.
+ Auch zusammengehörige Dateien können sinnvoll geclustert werden, z.B. bei Lieferanten- und Warensendungen-Dateien können Zusammengehörige Datensätze verzahnt gespeichert werden.


## 2.6 Dateien
+ Datei - logisch gesehen Folge von Datensätzen gleichen Formates.
+ Physisch gesehen: als Folge von direkt adressierbaren Blöcken organisiert
+ Metadaten über eine Datei stehen auf der ersten Seite im Dateikopf.
+ Operation auf Dateien: Suchen und Ändern
+ Operationen zur Lokalisierung und Zugriff auf Datensätze:
  + **Auffinden** - Erstes Datensatz, welche Selektionskriterien erfühlt. Die Seite mit dem Datensatz wird in Systempuffer geladen,  dort wird der DS lokalisiert und zum aktuellen DS
  + **lesen** - kopiert den aktuellen Datensatz aus dem Systempuffer in eine Variable.
  + **nächsten finden** -  Suche nach dem nächsten Datensatz analog dem ersten.
  + **löschen** -  Löschen des aktuellen Datensatzes aus Systempuffer und ggf. aktualisieren der externen Datei.
  + **verändern** - Ändern der Feldwerte des aktuellen Datensatzes aus Systempuffer und ggf. aktualisieren der externen Datei.
  + **einfügen** - feststellen der Seite, in die eingefügt werden muss, Seite in den Systempuffer laden. Datensatz  einfügen und ggf. aktualisieren der externen Datei.

+ Mengen der konzeptuellen Ebene werden auf Dateien gespeichert: Relationale DBMS: Jede Relation<-> einer Datei. In objektorientierten DBMS: Klassen <-> Datei, Objekte<->Datensätze, Attributwerte<->Feldwerte.

## 2.7 Grundlegende Dateiorganisationen

`b`=Anzahl Datenseiten; `r`=Anzahl Datenseiten/Seite(Blockungsfaktor); `d`=Zeit zum R/W einer Seite; `c`=Zeit zum Verarbeiten eines Datensatzes; `h`=Zeit für Berechnung der Hash-Funktion

### 2.7.2 Haufendateien

+ platziert Datensätze in einer Datei in ungeordneter chronologischer Reihenfolge; neue Datensätzen kommen am Ende der Datei.
+ Zwei mögliche Realisierungen: 
  + *doppelverkettete Listen*  - DBMS richtet Tabelle mit (Haufendateiname, Adresse der 1.Seite=Kopfseite)-Einträgen ein. Freier Speicherplatz innerhalb einer Seite muss verwaltet werden als auch alle Seiten mit freiem Speicherplatz, z.B. durch doppelt verkettete Listen für a) freie Seiten und b) volle Seiten
  + *Verzeichnise von Seiten* - DBMS muss sich Ort der 1.Verzeichnisseite des heap file merken.Jeder Eintrag zeigt auf eine Seiten in der Haufendatei. Freispeicherverwaltung mittels Biteintrags oder Zählers pro Eintrag mit Bytezahl des freien Speicherplatzes.
+ Durchlaufkosten: `b(d+rc)`
+ Suche mit Gleichheitsbedinung: `0,5+b(d+rc)` falls Bedingung bzgl Schlüsselfeld, sonst gesamte Datei durchsuchen.
+ Suche mit Bereichsbedingung: `b(d+rc)` gesamte Datei muss durchlaufen werden.
+ Einfügen eines Datensatzes: `2d+c` letzte Seite laden,Datensatze einfügen und zurückschreiben
+ Löschen eines Datensatzes: `c+d`, Datensatz ist aufzufinden von der Seite zu löschen und muss zurückgeschrieben werden.

### 2.7.3 Sequenzielle Dateien
+ Datensätze können physisch in sortierter Reihenfolge angeordnet sein
+ Sortiert wird anhand von *Ordnungsfeld* oder *Sortierfeld* 
+ Wenn *Sortierfeld*  = Schlüsselfeld, dann spricht man vom Sortierschlüssel
+ Durchlaufkosten: `b(d+rc)` 
+ Suche mit Gleichheitsbedinung: `d*log(b)+c*log(r)` Seite finden + Datensatz auf Seite finden (beides binär). Gibt es mehrere Datensätze für die Bedingung, sind diese auf derselben Seite gespeichert.
+ Suche mit Bereichsbedingung: Kosten für Suche nach erstem+letztem Datensatz für diese Bedingung. Wenn beide Datensätze auf gleicher Seite, sind Konsten unwesentlich höher als bei der Suche mit Gleichheitsbedinung.
+ Einfügen eines Datensatzes: `2 x 0,5 b(d+rc)`-richtige Einfügeposition in Datei finden, Datensatz auf der gefundenen Seite platzieren, alle nachfolgenden Seiten laden und zurückschreiben. Sortierreihenfolge nur bei unfixierten Datensätzen aufrechtzuerhalten!
+ Löschen eines Datensatzes: Suchkosten+`b(d+rc)` Seite finden, löschen, zurückschreiben+nachfolgende Datensätze lesen und zurückschreiben zum Heranschieben. Bei Löschmarkierungen nur Suchkosten+`c+d`.

### 2.7.4 Hash Dateien
+ Verteilung der Datensätze einer Datei in Buckets in Abhängigkeit vom Wert des Suchschlüssels. HashFunktion bildet Wert auf Zahl zwischen 0 bis B-1 ab (Streuspeicherung). Verwaltung der Behälter durch ein Behälterverzeichnis=Array von Zeigern, indiziert von 0 bis B-1. Seiten für Behälter i sind durch Zeiger miteinander verbunden. Statische Hash-Dateien haben feste Anzahl von Behältern, falls kein Platz mehr-> Überlaufseite. Dynamische Hash-Dateien haben variable Anzahl von Behältern.
+ Durchlaufkosten: `1,25*b(d+rc)` da Seiten nur zu 80% gefüllt.
+ Suche mit Gleichheitsbedinung: `h+d+0,5*rc`  besser als sequentiell
+ Suche mit Bereichsbedingung: `1,25*b(d+rc)`, wird nicht unterstützt. Es muss die Gesamtdatei durchlaufen werden
+ Einfügen eines Datensatzes: `h+2*d+0,5*rc`  Hash ausrechnen+ Seite lesen und zurückschreiben+ Alle Datensätze lesen ob Datensatz schon vorhanden.
+ Löschen eines Datensatzes: `h+2*d+0,5*rc`

### 2.7.5 Vergleich der Organisationsformen
+ *Haufendatei*  bietet gute Speichereffizienz und schnelles Einfügen und Löschen, schlecht bei Suchoperationen. Beste Struktur bei kompletten Dateidurchläufen
+ *sequenzielle Datei* bietet gute Speichereffizienz, aber langsam Einfügen und Löschen. Ist sehr schnell bei Suchoberationen und ist die beste Struktur für Suchoperationen mit Bereichsbedienung. Nicht real in DBMS vorhanden.
+ *Hashdatei* wegen 80% Belegegung nicht Speichereffizient, ist schnell bei Einfügen und Löschen und sehr schnell bei Suchen mit Gleichheitsbedienung.
![1664_ke1_k2_img26.png](https://draftin.com:443/images/32266?token=ST2geWwaqltbNHtT1SrrpAR925aTUjpZ7mpq33Y1dD-X4TXc8qw5HHo6l_0Sa6u2ZIRMYgbrQ61SzvcVubp8u3k) 

## 2.8 Systemkatalog
+ **Systemkatalog** -- enthält die vollständige Definition der Struktur der Datenbank.
+ Wird vom Systemkatalog-Manager verwaltet
+ Meta-Daten- Im Katalog gespeicherte Informationen
+ Alle Meta-Daten werden in speziellen Relationen, den Systemrelationen abgespeichert.Dadurch ist der Systemkatalog eine Art Miniatur-Datenbank.





