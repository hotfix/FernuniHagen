# 4. JavaServer Pages (JSP)

## 4.1 Grundlagen

- Eine JSP-Seite besteht aus einem **statischen Inhalt** 0**, **der Vorlage**
- Vorlage = HTML-Code in Verbindung mit zusätzlichen JSP-Tags 
- Der dynamischer Inhalt kann über JSP-Skripte und Java-Code eingefügt werden.
- JSP-Seiten haben gegenüber Servlets folgende Vorteile:
  - Die Erstellung der Vorlage einer Webseite ist einfacher, da sie im Wesentlichen auf HTML beruht. 
  - Durch benutzerdefinierte Tags können auf HTML-übliche Weise zusätzliche Funktionalitäten bereitgestellt werden. So kann durch einen Tag `<kundenliste>` z.B. dynamisch eine Liste aller Kunden erstellt und an der betreffenden Stelle als `HTML`-Tabelle ausgegeben werden
  - Java-Entwickler müssen sich nur um die Bereitstellung des Inhalts für einen Teil einer Webseite kümmern, ohne deren vollständigen Aufbau zu kennen
  - Die Rückgabe muss nicht mehr durch zahllose `out.println()`-Aufrufe wie im Falle eines Servlets erzeugt werden, deren Ausgabe man erst nach einem Aufruf wirklich erkennen kann.

- Servlets können sehr gut zur Steuerung einer Webanwendung eingesetzt werden. Die Authentifizierung erfolgt über eine Servlet und die Anfrage wird dann auf eine JSP Seite weitergeleitet
- Bei der Verwendung der JSP-Tags muss im Unterschied zu `HTML` auf die Groß- und Kleinschreibung geachtet werden
- JSP-Dokumente sind eine spezielle Version einer JSP-Seite. Sie entsprechen von der Struktur her einem XML-Dokument. Damit eine JSP-Seite diese Anforderung erfüllt, werden die öffnenden und schließenden Tags `<jsp:...>` und `</jsp:...>` verwendet.

- JSP-Lebenszyklus
  - JSP-Seite wird durch den Servlet/JSP-Container vor dem ersten Aufruf in ein Servlet übersetzt
  - zuerst der Java-Quellcode für das Servlet erzeugt und danach übersetzt. 
  - Ändert sich der Inhalt der JSP-Seite nicht, wird bei den folgenden Aufrufen immer auf das übersetzte Servlet zugegriffen
  - => gleiche Basiskonzepte wie bei Servlet

- Wird eine JSP-Seite das erste Mal aufgerufen, wird die Methode `jspInit()` ausgeführt, sofern sie implementiert ist. Vor dem Entfernen der Seite wird die Methode `jspDestroy()` aufgerufen. Beide Methoden müssen in einem Deklarationselement deklariert werden, das durch die Zeichenfolgen `<%!` und `%>` eingeschlossen wird.

## 4.2 JSP-Elemente

- JSP bietet grundsätzlich 3 Skriptelemente an
  - Ausdrücke
  - Deklarationen
  - Skriptlets
- Es gibt zwei verschiedene Kommentar-Typen
  - JSP-Kommentare dienen der Erläuterung der JSP-Seite, ohne dass sie zum Client gesendet werden. Verschachtelung von Kommentaren wird nicht unterstützt. Beispiel: `<%-- hier ist mein Kommentar --%>`  
  - Weitere Möglichkeit stellen die HTML-Kommentaren, die dann aber auch an den Browser übertragen werden. Sie werden dann als Teil der HTML-Vorlage betrachtet.

### Ausdrücke
- In einer JSP-Seite entspricht ein JSP-Ausdruck einem gültigen Java-Ausdruck, dessen Ergebnis als String ausgewertet wird
- Die Auswertung des Ausdrucks erfolgt bei der Verarbeitung der JSP-Seite.
- Die Schreibweise eines JSP-Ausdrucks kann über die Standardschreibweise oder mittels der XML-Schreibweise erfolgen
- Ausdruck wird nicht mit einem Semikolon abgeschlossen!

```xml
<%= Integer.toString(new java.util.Random().nextInt()) %>
<!-- Oder als XML Darstellung -->
<jsp:expression> 
  Integer.toString(new java.util.Random().nextInt()) 
</jsp:expression> 
```

### Deklarationen
- Der Inhalt einer JSP-Seite wird vollständig in einer Java-Klasse verpackt, die standardmäßig nur aus der Methode `_jspService()` besteht
- Um außerhalb der Methode `_jspService()` Instanzvariablen oder weitere Methoden zu definieren, werden **Deklarationen** in einer JSP-Seite verwendet
- Deklarationen werden in die Zeichenfolgen `<%!` und `%>` bzw. die Tags `<jsp:declaration>` und `</jsp:declaration>` eingeschlossen.
```java
<%! 
  JspWriter myOut = null; 
  private void ausgabe(){ 
    try { 
      myOut.println("Meine Ausgabe ..."); 
    } 
    catch(java.io.IOException ex){} 
  } 
%> 
<% 
  myOut = out; 
  ausgabe(); 
%> 
```

### Skriptlets
- Für jede JSP-Seite kann eine Skriptsprache festgelegt werden, die standardmäßig Java ist. Der Inhalt der Skriptlets und der statische Text werden hintereinander, wie in der JSP-Seite angegeben, in die Methode `_jspService()` eingefügt. Skriptlets unterliegen damit den gleichen Anforderungen wie "normaler" Java-Code
- Skriptlets werden in die Zeichenfolgen `<%` und `%>` oder die Tags `<jsp:scriptlet>` und `</jsp:scriptlet>` eingeschlossen
- Beispiel:
```java
<% if(true) { %> 
  Der Test ist true. 
<% } else { %> 
  Der Test ist false. 
<% } %> 
```
- Wichtig ist die Verwendung der geschweiften Klammern, da die Anzahl der verwendeten Ausgabeanweisungen nicht notwendigerweise 1 betragen muss

### Aktionen
- Über Aktionen wir die Funktionsweise der JSP-Engine gesteuert.Es wird also über Aktionen keine Ausgabe erzeugt.
- Eine Aktion wird nur über Attribute konfiguriert: `<jsp:aktionsName attribut1="Wert1" attribut2="Wert2" ... />`
- Folgende Aktionen stehen zur Verfügung:
 Aktion|Beschreibung
 --|--
`<jsp:forward>` | Es erfolgt eine Weiterleitung an eine andere URL. 
`<jsp:getProperty>` `<jsp:setProperty>` |Mit diesen Aktionen greifen Sie auf die Eigenschaften eingebundener JavaBeans zu.
`<jsp:include>` | Andere Ressourcen lassen sich über diese Aktion einbinden. 
`<jsp:params>` `<jsp:param>` | Parameter an Applets (`<jsp:plugin>`) und an eingebundene Ressourcen werden über diese Aktionen übergeben. 
`<jsp:plugin>` | Mittels dieser Aktion lassen sich Applets in eine Seite einbinden. Der Vorteil liegt darin, dass eine einfachere Syntax verwendet wird.  
`<jsp:text>` | Statischen Text können Sie über diese Aktion ausgeben. Dies ist beispielsweise innerhalb einer Verschachtelung in einer anderen Aktion sinnvoll. 
`<jsp:useBean>` | JavaBeans binden Sie über diese Aktion ein. 

### Direktiven
- Direktiven erzeugen keine Ausgabe, sondern steuern die Arbeitsweise des Servlets/JSP-Containers.
- Eine Direktive wird in die Zeichenfolgen `<%@` und `%>` eingeschlossen
- Für jede Direktive existiert ein eigener JSP-Tag, der mit `jsp:directive` beginnt  und dem über einen Punkt getrennt der Name der Direktive angefügt wird:
Direktive | JSP-Tag | Erläuterung
-- | -- | --
include | jsp:directive.include  | Hiermit können Sie den Inhalt einer Datei an die entsprechende Stelle einfügen.
page | jsp:directive.page | Durch Angabe weiterer Attribute steuern Sie die Verarbeitung der JSP-Seite
taglib | jsp:directive.taglib | Wenn Sie Tag-Bibliotheken einbinden wollen, verwenden Sie diese Direktive.

### Gültigkeitsbereiche
- Objekte einer JSP-Seite können zu einem von vier Gültigkeitsbereichen gehören
-  einige Standardaktionen besitzen ein Attribut mit dem Namen `scope`, dem einer der folgenden Werte zugewiesen werden kann:

Wert|Erläuterung
--|--
application |Innerhalb einer Webanwendung sind diese Objekte über alle Sessions und Anfragen hinweg gültig. 
page|Diese Objekte besitzen Referenzen im pageContext-Objekt und sind nur bis zum Absenden dieser Seite gültig. Bei einer Weiterleitung verfallen sie. 
request|Es besteht während einer Anfrage der Zugriff auf das request-Objekt, solange die Anfrage bearbeitet wird, also auch bei einer Weiterleitung. 
session|Diese Objekte sind während einer Benutzersitzung gültig, also auch während mehrerer Seitenaufrufe desselben Nutzers. 

## 4.4 JSP-Seiten konfigurieren

- Gegenüber einem Servlet hat eine JSP-Seite bezüglich der Fehlerbehandlung einige Nachteile.
  - Fehlerbehandlung ist schwer relialisierbar
  - Fehler werden häufig erst beim Aufruf der Seite erkannt
- Für eine JSP-Seite lassen sich verschiedene Einstellungen vornehmen, die über die page-Direktive gesteuert werden
- Die Direktive besitzt mehrere Attribute, von denen im Folgenden einige vorgestellt werden. 
Attribut | Erläuterung
-- | --
`import` | importiert ein Package. Standardmäßig werden die Packages `java.lang.*`, `javax.servlet.*`, `javax.servlet.jsp.*` und `javax.servlet.http.*` eingebunden. Mehrere Importe werden durch Komma(ta) getrennt.
`autoFlush` | Geben Sie true an, damit die Daten sofort in die Ausgabe geschrieben werden.
`isErrorPage` | Ist dieser Wert `true`, wird im Fehlerfall eine `exception`-Variable bereitgestellt.
`errorPage` | gibt die Seite an, die im Fehlerfall angezeigt werden soll. 
`contentType` | definiert den Mime-Typ, der durch die Seite zurückgegeben wird. Auf diese Weise können Sie über eine JSP-Seite auch Bilder oder PDF-Dateien zurückgeben. Der Standardwert ist `text/html`.
`pageEncoding` | Damit geben Sie die Kodierung der Seite an. Dies ist z.B. wichtig, wenn Sie deutsche Umlaute direkt ausgeben wollen.

- Um Seiten Abschnitte wiederverwenden zu können, können diese auch in separate Dateien ausgelagert werden, die dann in die betreffende JSP-Seite eingebunden werden. 
- Über die JSP-Aktion `jsp:include` lassen sich externe Dateien in eine JSP-Seite einbinden. 
- Die Tatsache, dass die Einbindung erst bei Anforderung einer JSP-Seite erfolgt, hat mehrere Auswirkungen:
  - Es werden immer aktuelle Daten eingebunden.
  - Änderungen werden sofort wirksam.
  - Da die Einbindung bei jeder Anforderung erfolgt, werden mehr Systemressourcen benötigt.
- Für diese Aktion steht nur die XML-Syntax zur Verfügung
```xml
<jsp:include page="Name">
      <jsp:param name="ParamName" value="ParamWert" />
</jsp:include>
```

- weitere Form, Inhalte anderer Dateien einzubinden, bietet die `include`-Direktive
- bindet den Dateninhalt immer nur den Dateiinhalt an der betreffenden Stelle ein
- der Ausführungszeitpunkt dieser Operation differiert
- Die Direktive wird nämlich nur beim Übersetzungsvorgang ausgeführt
- Auswirkungen:
  - Die Ausführung der Seite ist schneller, da die JSP-Seite wie üblich nach dem ersten Aufruf übersetzt vorliegt
  - Änderungen in den eingebundenen Seiten sind mitunter schwerer durchzuführen, da dies der Servlet/JSP-Container nicht bemerkt. Server muss durchgestartet werden.
  - Auf diese Weise eingebundene Dateien können auf sämtliche Sprachelemente der einbindenden Seite zugreifen, da nur deren Inhalt an die betreffende Stelle kopiert wird.

### Prüfungsfragen
- Damit die JSP-Seite von Tomcat nach Änderungen neu übersetzt wird, muss in der Datei `web.xml` der Parameter `checkInterval` des Elements `<servlet>` gesetzt werden.
- Über Aktionen wird die Funktionsweise der JSP-Engine gesteuert. Eine Aktion wird nur über Attribute konfiguriert. Über Aktionen werden keine Ausgaben erzeugt. Eigene Aktionen können durch Tag-Bibliotheken definieren werden.
- Über die page-Direktive werden verschiedene Einstellungen für eine JSP-Seite gesteuert. Über die JSP-Aktion `jsp:include` lassen sich externe Dateien in eine JSP-Seite einbinden. Die `include`-Direktive bindet im Unterschied zur `jsp:include`-Aktion immer nur den Dateiinhalt an der betreffenden Stelle ein.

