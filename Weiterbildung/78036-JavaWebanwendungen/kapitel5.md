# 5. JSP-Seiten erweitern

## 5.1 JavaBeans einsetzen
- JavaBeans (oder kurz Beans) stellen eine einfachere Möglichkeit dar, Funktionalität auszulagern. Sie werden automatisch instantiiert und stehen je nach Einstellung nicht nur für den einmaligen Aufruf einer JSP-Seite zur Verfügung, sondern z.B. auch während einer gesamten Benutzersession.
- Der Zugriff auf die Daten einer Bean erfolgt über Eigenschaften, die durch spezielle Methodensignaturen bereitgestellt werden
- Vorteile von Java Beans
  - Die Instantiierung kann automatisch erfolgen und der Gültigkeitsbereich kann festgelegt werden.
  - Der standardisierte Zugriff auf die Eigenschaften einer Bean erleichtert Webdesignern die Arbeit.
  - Der standardisierte Zugriff auf die Eigenschaften einer Bean erleichtert Webdesignern die Arbeit.
- Um eine JavaBean zu nutzen, sind folgende Operationen notwendig:
  - Erstellen der Bean
  - Bereitstellen der Bean in der Webanwendung
  - Einbinden der Bean in eine JSP-Seite
  - Optionales Initialisieren der Bean
  - Lesender und schreibender Zugriff auf die Eigenschaften der Bean

> Eine **JavaBean** ** ist eine Java-Klasse, die Eigenschaften definiert, die über spezielle `get`- und `set`-Methoden (auch *Getter* und *Setter* genannt) aus- und eingelesen werden.

- Um eine JavaBean in einer Webanwendung zu nutzen, muss sie in einem Package untergebracht werden. Entweder als Lib im `WEB-INF\lib` oder als Klasse in `WEB-INF\classes`
- Innerhalb einer JSP-Seite wird eine JavaBean über die Aktion `jsp:useBean` verfügbar gemacht.
- Über mehrere Attribute wird gesteuert:
  - unter welchen Namen die Bean angesprochen wird (Attribut id),
  - welchen Gültigkeitsbereich sie besitzt (scope),
  - durch welche Klasse sie implementiert wird (class). 
- Durch die Angabe von jsp:useBean wird nicht in jedem Fall eine neue Instanz erzeugt!! Existiert bereits ein Objekt mit der gleichen id und dem gleichen scope, wird eine Referenz auf dieses Objekt zurückgeliefert

### Zugriff auf Eigenschaften
- Lesend
- schreibend
- Schreibend zur Initialisierung einer neuen Instanz
- Zum Lesen der Eigenschaftswerte einer Bean wird die Aktion `jsp:getProperty` verwendet, die **immer** einen String als Wert zurückliefert
```xml
<jsp:getProperty name="Kunde" property="name" />
```

- Zum Schreiben eines Eigenschaftswerts wird die Aktion `jsp:setProperty` verwendet
```xml
<jsp:setProperty name="Kunde" property="name" value="Klausen" /> 
<jsp:setProperty name="Kunde" property="name" value="<%= ... %>" /> 
<jsp:setProperty name="Kunde" property="nummer" param="IDNummer" /> 
<jsp:setProperty name="Kunde" property="*" /> 
<jsp:setProperty name="Kunde" property="name" /> 
```

- Das Setzen von Eigenschaften kann auch zum Initialisieren der Bean genutzt werden. Dazu werden innerhalb des Tags `<jsp:useBean>` über die Aktionen `jsp:setProperty` die gewünschten Eigenschaften mit Werten belegt.
```xml
<jsp:useBean id="Kunde" scope="session" class="de.fernuni.kap05.Kunde"> 
     <jsp:setProperty name="Kunde" property="name" value="NoName" /> 
     <jsp:setProperty name="Kunde" property="nummer" value="0" />  
</jsp:useBean> 
```

## 5.2 JSP Expression Language

- Mit der JSP-Version 2.0 wurde die JSP Expression Language, kurz JSP 2.0 EL oder EL, vorgestellt. Sie soll den Zugriff und die Verwendung von Standardelementen wie JavaBeans, Standardobjekten und Parametern vereinfachen.
- Beispiel `${EL-Ausdruck }`
- JSP EL bietet mehrere Vorteile:

  - Vereinfachter Zugriff auf Objekte, die in einem bestimmten Kontext (Anwendung, Session, Request, Webseite) gespeichert sind
  - Einfacherer Zugriff auf die Eigenschaften von JavaBeans
  - Vereinfachter Zugriff auf Request-Parameter
  - Vereinfachte Schreibweise von bedingten Anweisungen

- Über das Attribut `isELIgnored` der page-Direktive können Sie die EL-Auswertung JSP-Seiten-basiert steuern. Die Angabe von false aktiviert die EL: `<%@ page isELIgnored="false" %>`

- EL-Ausdrücke werden in zwei Situationen eingesetzt: 
  - direkt in der Ausgabe,
  - als Zuweisung eines Wertes an ein Attribut eines Tags. 

- Der Vorteil beim Zugriff auf die Informationen über JSP EL ist übrigens auch, dass bei nicht vorhandenen Informationen keine Exception ausgelöst, sondern eine leere Zeichenkette geliefert wird.

- JSP EL kann auch durch eigene Funktionen erweitert werden. Diese Funktionen werden als statische Methoden einer Klasse implementiert


## 5.3 Tag-Bibliotheken erstellen

> Die **TagHandler-Klasse** kapselt also Funktionen, die später wie HTML-Tags verwendet werden. Die Tags können optional auch Attribute, verschachtelte Tags sowie einen Inhalt (Text) besitzen. Ein oder mehrere Tags werden in **Tag-Bibliotheken** (Tag-Libs) zusammengefasst.

- Anforderungen an Tag-Libs :
  - Die Implementierung sollte möglichst portabel sein. Das heißt, die Tags sollten keine speziellen Lösungen für nur eine Webanwendung besitzen und sie sollten für verschiedene Servlet/JSP-Container nutzbar sein.
  - Sie sollten einfach anwendbar und konfigurierbar sein.

- Schritte zur Implementierung eigener Tags :
  - Zuerst wird die TagHandler-Klasse entwickelt, welche die Funktionalität kapselt
  - Über einen Tag Lib Descriptor (TLD) werden ein oder mehrere Tagnamen mit einer TagHandler-Klasse verknüpft.
  - Danach wird der TLD in eine Webanwendung integriert und optional in den Deployment Descriptor eingebunden.
  - Jetzt kann die Tag-Bibliothek in eine JSP-Seite eingebunden und danach genutzt werden.

### TagHandler-Klasse

- benutzerdefinierter Tag wird durch eine TagHandler-Klasse implementiert.
- es muss eines der Interfaces `BodyTag`, `IterationTag`, `SimpleTag` oder `Tag` aus dem Package `javax.servlet.jsp.tagext` implementieren.
- Meistens werden aber die Klassen `BodyTagSupport`, `SimpleTagSupport` oder `TagSupport` erweitert, welche die Interfaces bereits implementieren.
- Den Zugriff auf die üblichen Informationen des Requests, der Response oder der Session erhalten Sie über die Variable `pageContext`
- Zur Ausgabe von Informationen in die JSP-Seite ermitteln Sie über diese Variable mittels der Methode `getOut()` ein `JspWriter`-Objekt.

> Der **Tag Library Descriptor** selbst ist ein **XML-Dokument** mit einem fest definierten Aufbau. Er besitzt meist die Endung `*.tld` und wird im Verzeichnis `WEB-INF` einer Webanwendung untergebracht. Weitere **Speicherorte** sind beliebige Unterverzeichnisse von `WEB-INF`, **ausgenommen** ** die Verzeichnisse `classes` und `lib`. In der Regel wird als Unterverzeichnis `WEB-INF/tags` verwendet.

### Tag-Bibliotheken verwenden 

- Bei der Standardvorgehensweise wird im Deployment Descriptor `web.xml` ein `<taglib>`-Element für jede TagLib eingefügt. Über das Element `<taglib-uri>` wird der Name und über das Element `<taglib-location>` die Position der TagLib angegeben.
- Innerhalb einer JSP-Seite muss eine TagLib in jedem Fall über die taglib-Direktive eingebunden werden:
```java
// relativer Pfad bezüglich der Webanwendung
// muss kein Eintrag in die Datei web.xml erfolgen
<%@ taglib uri="/WEB-INF/Kap05Tags.tld" prefix="t" %> 
<%@ taglib tagdir="/WEB-INF" uri="Kap05Tags.tld" prefix="f" %> 
// wird als URI der Inhalt des Elements <uri> aus dem TLD verwendet
// erfordert ebenfalls keinen Eintrag in der Datei web.xml 
<%@ taglib uri="Kap05TLD" prefix="t" %> 
// flexibelste variante
// verwendet als URI den im Element <taglib-uri> verwendeten Namen aus der Datei web.xml
<%@ taglib uri="/Kap05Tags" prefix="t" %>
```

## 5.4 JavaServer Pages Standard Tag Library 

- **JSTL** - JavaServer Pages Standard Tag Library
- Diese enthält Routinen in Form von Tags aus unterschiedlichen Bereichen. Die Tags wurden in fünf Bibliotheken aufgeteilt

Bibliothek | Präfix | Funktion(en)
--|--|--
core | c |Variablenwerte auslesen,Deklarationen,Exceptions ,Kontrollflusssteuerung ,Http-Funktionalität
functions |fn |Hilfsfunktionen, z.B. Zeichenkettenverarbeitung
I18n | fmt|Lokalisierung
sql | sql|Datenbankzugriff
XML|x |Verarbeitung von XML-Daten

> Die **Core-Tags** (Basis-Tags) stellen allgemeine Funktionen zur Verfügung

- Funktions-Tags stellen Hilfsfunktionen zur Verfügung, die hauptsächlich auf die Verarbeitung von Zeichenketten ausgelegt sind
