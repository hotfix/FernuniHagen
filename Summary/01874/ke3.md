# Zusammenfassung KE3
## Einleitung Information Retrieval

+ Information Retrieval - Suchvorgänge automatisch in einem Faktendatenbestand oder einer schwach- oder unstrukturierten Kollektion von Wissensressourcen durchzuführen
+ Information Filtering - um bei der Suche nach gespeichertem Wissen relevante Information von irrelevanten trennen zu können.
+ Dabei ist zu beachten, dass Information Filtering und Information Retrieval zwei unterschiedliche, jedoch gleichberechtigte Anschauungen des gleichen Problems darstellen

## Information-Retrieval-Modelle
+ *Information-Retrieval-System* (IRS) extrahiert für eine Problemstellung
relevante d.h. aus Sicht der Benutzer und ihrer Anwendungsaufgabe informationstragende Daten aus einer großen Datenmenge

+ Zur Effektivität eines IRSs gehört demzufolge nicht nur das gesicherte Finden der relevanten Information, sondern auch das gesicherte Ausblenden der nicht relevanten Information.
+ Als klassische numerische Maße für diese Effektivität werden im IR Precision
und Recall verwendet:
  + Precision - das Verhältnis zwischen der Gesamtzahl der auf eine Anfrage vom System als relevant präsentierten Dokumente und der Anzahl der tatsächlich relevanten Dokumente innerhalb dieser Ergebnismenge. 
(Anzahl präsentierte Dokumente/ Anzahl der relevanten Dokumente in der Menge)
  + Recall -  das Verhältnis der Gesamtzahl aller für eine Anfrage relevanten
Dokumente der Dokumentmenge und der Anzahl der vom System im Anfrageergebnis präsentierten relevanten Dokumente. 
(Anzahl der relevanten Dokumente/ Anzahl präsentierten relevanten Dokumente)

+ Systemkomponenten eines IRSs umfassen nach Brown:
  + die Dokumentrepräsentationskomponente mit einer formalen Beschreibung der im jeweiligen Dokument enthaltenen Information
  + die Anfragerepräsentationskomponente, welche die formale Beschreibung des Informationsbedürfnisses unterstützt
  + Wiedergewinnungsmaschine (Retrieval Engine), eine Suchkomponente mittels derer nach bestimmten Regeln, automatisch mit Hilfe von algorithmischen Pattern-Matching-Prozeduren, diejenigen Dokumente gefunden werden, die für die
Anfrage des Benutzers relevant sind 
+ Ein Information Retrieval Modell bestimmt also: 
  + wie Dokumente repräsentiert werden
  + wie Anfragen repräsentiert werden 
  + wie die Relevanz eines Dokuments für eine Anfrage bestimmt wird 

## Exact-Match-Modelle
+ das älteste und am weitesten verbreitete Modell ist das boole'sche Information-Retrieval-Modell
+ basiert auf exakter Erfüllung einer Anfrage durch ein Dokument.
+ Anfragen werden mit Hilfe der Standardoperatoren boole'scher Logik formuliert
+ Datenbasis wird bezüglich einer Anfrage in zwei Untermengen unterteilt:
  + die Menge der als voll zutreffend zugelassenen 
  + die Menge der als nicht zutreffend verworfenen Dokumente

+ Unterscheidung der Dokumente in der Ergebnismenge findet nicht statt
=> es ist nicht mehr zu erkennen, ob ein Dokument außerhalb der Ergebnismenge nur einen Term oder alle Terme nicht erfüllt
+ In einem boole'schen System wird jedes Dokument durch einen Satz von inhaltlichen Indizes repräsentiert, der sich aus Termen des für die Indexierung gewählten Vokabulars zusammensetzt. In der Regel erfolgt auch die
Indexierung ungewichtet, d. h. ein Term wird entweder als in einem Dokument vorhanden oder nicht vorhanden vermerkt.
+ Nachteile: 
  + keine Rückführung der Wörter auf ihre Grundform. Die Begriffe werden
in der Form des Vorkommens im Text in die Repräsentation übernommen. Dadurch findet eine Suche nach dem Wort »Haus« keine Dokumente, die nur das Wort »Häuser« enthalten.
  + Es findet keine Gewichtung der Wörter statt, bspw. nach dem Ort des Vorkommens oder der Häufigkeit des Vorkommens.

  + Es erfolgt keine Zerlegung von Mehrwortgruppen. Dokumente die nur das Wort »Bundeskanzlerwahl« enthalten, werden mittels einer Suche nach »Wahl« nicht gefunden
  + Die Formulierung der Suchanfrage ist relativ aufwendig
  + Über die Größe eines Suchergebnisses lässt sich keine klare Vorhersage treffen. Alles oder Nichts
  + Das Ergebnis der Anfrage ist eine unstrukturierte Menge.

## Best-Match-Modelle
+ Bei den auf bestmöglicher Erfüllung beruhenden Modellen werden die Vektorraum-, die Wahrscheinlichkeitstheorie und die Theorie der Fuzzy-Logik
herangezogen für die Entwicklung eines Modells
+ IR-Funktionen und die Anfrageformulierungen die gleichen wie beim herkömmlichen boole'schen Retrieval, jedoch werden auch gewichtete
Dokumentbeschreibungen und Anfrageformulierungen zugelassen
+ Zentrale Frage dieses Modells ist also die Bewertung der Relevanz, die ein Term für die Beschreibung eines Dokumentinhaltes hat.
+ Im Best-Match-Retrieval wird die Forderung nach exakter Erfüllung der Anfrage aufgegeben und dafür eine Sortierung der Dokumente nach dem Grad ihrer Erfüllung der Anfrage eingeführt.

### Ranking Modelle
+ im Gegensatz zum boole'schen Modell wird nicht länger die exakte Erfüllung der Spezifikationen einer Anfrage gefordert, sondern es wird eine geordnete Auswahl von Dokumenten aus der Datenbasis berechnet, wobei die Ergebnisdokumente in der Reihenfolge präsentiert werden, in der sie als
für die Anfrage relevant berechnet worden sind.
+ Dokumente können auf zwei Arten geordnet werden
  + weichen Ordnen (Weak Ordering) können zwei Dokumente den gleichen Wert bzw. Rang einnehmen.
  + linearen Ordnen (Linear Ordering) müssen Unterschiede vorhanden sein
+ typisches Maß für Ähnlichkeit ist die Anzahl der sowohl in der Anfrage als
auch im jeweiligen Dokument vorkommenden Terme


### Vektorraum-Modelle
+ Grundlage dieses Modells ist die Idee, dass ein Dokument als Vektor in einem
mathematischen Raum, dem so genannten Inhaltsraum der Dokumentmenge, aufgefasst werden kann
+ Die inhaltliche Verwandtschaft von Dokumenten untereinander oder bezüglich einer Anfrage wird durch den Abstand von Vektoren zum Ausdruck gebracht.
+ Das System antwortet auf eine Anfrage, indem es die Dokumente präsentiert, die räumliche Nähe zur Anfrage aufweisen.
+ das dem Anfragevektor räumlich am nächsten stehende Dokument zugleich das Relevanteste für die jeweilige Anfrage ist
+ Ein Vektorenvergleichssystem führt Vergleiche zwischen Anfrage- und Dokumentvektoren durch und präsentiert ein geordnetes Ergebnis in absteigender Reihenfolge der berechneten Ähnlichkeitswerte.
+ Gewichtung der dokumentenvektoren: Anzahl der Vorkommen eines Begriffes im Text geteilt durch die Anzahl der Dokumente in denen der Begriff vorkommt.


### Clustering-Modelle
+ Um diese Art des IRs zu verwirklichen, wird ein System aus Häufungen von
Dokumenten zu so genannten Clustern ähnlichen Inhalts erzeugt
+ Maße für die Berechnung der Ähnlichkeit von Dokumenten werden etwa
Skalarprodukt oder Kosinus-Maß
+ Vorbedingungen dieses Modells sind 
  + die Festlegung eines Ähnlichkeitsmaßes 
  + die Berechnung einer Ähnlichkeitsmatrix für alle möglichen Dokumentenpaare, 
  + die Berechnung der Cluster etwa durch Anwendung eines Schwellenwertes auf die errechneten Ähnlichkeiten
  + gemeinsame physische Abspeicherung der Dokumente eines Clusters zur Minimierung der notwendigen Ein-/Ausgabe-Operationen.

+ Praktisch sieht es so aus, dass hinsichtlich einer bestimmten Anfrage für jedes Dokument der Ähnlichkeitskoeffizient berechnet wird. Auf der Basis dieser Werte wird die Menge der auszugebenden Dokumente bestimmt, indem
entweder ein vordefinierter Schwellenwert angewendet wird, oder indem die
Dokumente in einer Rangliste angeordnet und ab einer bestimmten Position
verworfen werden

+ Positiv ist bei der Clustering-Methode neben dem verhältnismäßig geringen
Ein-/Ausgabe-Aufwand auch die Tatsache, dass die Dokumente einer Datenbasis nicht als voneinander unabhängige Einheiten aufgefasst werden
+ Negativ schlägt der hohe Rechenaufwand zu Buche, der gerade bei größeren
Dokumentsammlungen ein Clusterbasiertes System rasch an seine Grenzen stoßen lässt.

### Probabilistische Modelle
+ Bezüglich der Erfassung des Inhaltes eines Dokumentes und der Erfassung
des Benutzerinteresses durch eine Anfrage besteht Unsicherheit
+ Abschätzung der Relevanz mit Hilfe von Warscheinlichkeitsrechung

+ Die Funktion der IR-Engine wird daher beim probabilistischen Ansatz darin gesehen, die Texte in der Datenbasis in eine Ordnung zu bringen, die den Grad der Wahrscheinlichkeit widerspiegelt, dass ein Dokument für eine Suchanfrage
relevant ist. Dem Benutzer wird nicht nur Information hinsichtlich der
Relevanzwahrscheinlichkeit angeboten, sondern ihm wird auch die Möglichkeit gegeben, durch interaktives Handeln diese Wahrscheinlichkeiten in seinem Sinne zu manipulieren

### Inferenz-Modelle
+ Inferenznetz-Modell zeichnet sich dadurch aus, dass multiple Einzeleigenschaften der in der Datenbasis gespeicherten Dokumente sehr flexibel in die Suche einbezogen werden können 
+ Das Inferenznetz-Modell beruht auf so genannten Bayes-Netzen.

## Relevance-Feedback-Modelle
## Intelligente Modelle
## Neuronale Modelle 
