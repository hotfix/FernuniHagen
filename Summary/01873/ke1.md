# Zusammendfassung KE1

## Das Modell der strukturierten Dokumente

* Durch das *Modell der Strukturierten Dokumente* wird eine Unterteilung in textuellem Inhalt, logischer Struktur und grafischem Format möglich
* *Die Quellrepräsentation* des Dokuments bezieht sich auf den textuellen Inhalt und logische Struktur. Gesteuert von unabhängigen Formatvorgaben, so genannten Stylesheets.
* Das Modell bietet hohes Maß an Flexibilität
  * *logischer Struktur* - unterstützt Anwendungen der Dokumentenverwaltung oder die Informationbeschaffung nach bestimmten logischen Kriterien
  * *Stylesheets* - ermöglichen flexible gesStaltung eines oder mehrere Dokumente

* Die Modellierung ist eine vereinfachte und auf das im aktuellen Kontext Wesentliche reduzierte und - unter geeigneten Gesichtspunkten - systematisierte Darstellung.
* Modelle können unterschiedlichen Zwecken dienen: etwa der Entwicklung einer gemeinsamen Sicht und Terminologie, der Vermittlung erprobter Vorgehensweisen und Techniken, dem rationalen Beweisen oder Widerlegen von Hypothesen oder der Ableitung von Handlungsempfehlungen.

## Dokument
* *Historisches Dokument* - Laut Brockhaus Lexikon von 1894 sind  *physische Objekte*, *Gegenstände*, die als einmalige Träger eines in menschliche Sprache gekleideten und schriftlich festgehaltenen Gedankens oder Sachverhalts fungierten. z.B. Reisepass/ Personalausweis -> Kann nicht kopiert werden
* *Dokument neuer Art* - sind Informationsträger. Schriftform ist wesentlich, aber das Trägermedium und die Art nebensächlich. Auf den sprachlichen Ausdruck kommt es an.

* *"Das Fälschen eines Personalausweises oder einer Banknote beinhaltet immer auch eine Fälschung des Trägermediums und betrifft Dokumente im ursprünglichen Sinne."* **KE1 S.9**
* *"Kopieren hingegen – sei es Fotokopieren oder Abschreiben – generiert immer ein zweites Exemplar des Dokuments, selbst wenn sich die Erscheinungsform dabei total ändert"* **KE1 S.9**


* Sprachlich formulierte Gedankengänge, Ideen, Fakten oder Aussagen werden erst dann zu Information, wenn sie von jemandem aufgenommen und verarbeitet werden.

* *Modernes Dokument* - elektronisch gespeicherte Dokumente und je nach Anwendungszweck unterstützen unterschiedliche Präsentationsmedien.

## Vorteile des Dokumentenmodells
* Durch ändern der Formatierung entsteht Flexibilität
* logisch Strukturierung unterstützt Anwendungen der Dokumentenverwaltung => automatische Generierung von Katalogeinträgen möglich; wiederfinder der Informationen nach bestimmten logischen Kriterien.
* Dokumentenstruktur kann als Navigation genutzt werden 
* Weitere Vorteile bei der Verwaltung von Dokumenten
  * Gesamter Dokumentenbestand mit einer Struktur
  * Für jedes Präsentationsmedium ist nur ein einziges Stylesheet nötig
* Zum vollen Modell der strukturierten Dokumente gehört dazu, dass die Namen der Strukturelemente frei wählbar. Sprachvorrat darf nicht fest vorgegeben werden.
* Eine Strukturvorgabe hat Vorteile
  * Dokumente automatisch auf ihre strukturelle Korrektheit überprüft
  * Editierhilfen können solche Vorgaben auswerten

## Zeichenkodierungen
* Die einzelnen Bestandteile des Kodierungsmodells
  * ein abstrakter Zeichensatz
  * eine Codetabelle
  * ein Codierungsformat
  * ein Kodierungsschema
  * eine Übertragungssyntax, die über so genannten „glatten Text“ hinaus geht

* ein abstrakter Zeichensatz
  * Menge abstrakter Zeichen
  * Informationseinheit zur Representation , Oraganisation oder Kontrolle von Text
  * beinhaltet *keine* Ordnung
  * werden festgelegt um Texte einer bestimmten Sprache zu kodieren
  * Glyphen auf Präsentationeben sind Zeichen auf der Kodierungsebene+
  * Glyphenbilder: Grafische Ausprägungen eines Buchstaben

* eine Codetabelle
  * Weist den abstrakten Zeichen im Zeichensatz eine Codepostion zu
  * Code Raum einer Zeichenkodierung ist ein Abschnitt der natürlichen Zahlen, der alle Codepositionen enthält
  * Codepositionen werden in Hex angegeben, wodurch eine natürliche  Beziehung zu Bitmustern hergestellt wird.
  * Coderaum von US-ASCII umfasst 128 Positionen, von 0 bis 7F; ISO8859-X 256, 0-FF, Unicode 65536,0 -FFFF und 1048576 Position 
  * Unicode enthält Lücken, Diese Positionen sind für spezielle Funktionen vorgesehen und es werden ihnen auch künftig keine Unicode-Zeichen zugeordnet werden
  * Unicode beinhaltet für jedes in seiner Codetabelle kodierte Zeichen die folgenden Daten: die Codeposition des Zeichens; ein typisches Glyphenbild für das Zeichen; einen Namen; semantische Information
  * 5 der 10 Designprinzipien von Unicode sind auf Ebene der Codetabelle: **Unifikation**, **Konvertierbarkeit zwischen Standards**, **Sematik**, **Dynamische Komposition**,**Charakterisierung äquivalenter Kodierungen**

* ein Codierungsformat
  * Festlegung der Bitrepräsentation für Codeposition  
  * Kanonisches Kodierungsformat fester Länge ergibt sich aus Dualzahldarstellung von Codepositionen

* ein Kodierungsschema
  * Damit Daten über Netzwerke zuverlässig ausgetauscht werden können, müssen sie in eine lineare Folge von Bytes gebracht werden. Dieser Vorgang wird auch *Serialisierung* genannt. 
  * Mithilfe eines Kodierungsformats wird der Text als Folge von Kodierungseinheiten dargestellt. *Ein Kodierungsschema wird nun dazu genutzt zu einem Kodierungsformat zusätzlich festzulegen, wie die Kodierungseinheiten in Bytefolgen zu serialisieren sind.*
  * UTF8 = Kodierungseinheit und Kodierungsformat je 8 Bit = Kodierungsschema 8 Bit
  * UTF16 = Kodierungseinheit ein Word daher 2 Möglichkeiten der Serialisierung: *Bid Endian* und *Little Endian*

* eine Übertragungssyntax
  * Funktionszeichen in glattem Text unterzubringen => Verwendung von Escape-Zeichen.