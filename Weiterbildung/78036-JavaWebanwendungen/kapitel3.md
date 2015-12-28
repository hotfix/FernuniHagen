# 3. Entwicklung von Servlets

## 3.1 Einführung

> Ein `Servlet` ist eine spezielle `Java`-Klasse, die innerhalb eines `Servlet`/`JSP`-Containers instantiiert wird. Wird ein `Servlet` aufgerufen, werden ihm die Parameter übergeben, die ein Browser mittels des `HTTP`-Protokolls an den Webserver übermittelt hat. Daraufhin erzeugt das `Servlet` über `Java`-Code eine Antwort, die in der Regel einer `HTML`-Seite entspricht.

- Das Interface Servlet aus dem Package javax.servlet definiert die Methoden, die ein Servlet zwingend implementieren muss.


Methode | Beschreibung
--|--
`void destroy()`| wird aufgerufen, wenn das Servlet-Objekt freigegeben werden soll.
`ServletConfig getServletConfig()`| liefert Informationen über Parameter, die dem Servlet übergeben wurden.
`String getServletInfo()` | liefert allgemeine Informationen über das Servlet.
`void init(ServletConfig conf)`|wird vom Servlet-Container aufgerufen, wenn das Servlet-Objekt erzeugt wird.
`void service(ServletRequest req, ServletResponse res)` | verarbeitet die Anfragen an das Servlet, die nicht notwendigerweise HTTP-Anfragen sein müssen.

- `GenericServlets` - z.B. für Anwendungen, bei denen es auf maximale Geschwindigkeit ankommt und die den Overhead der Verarbeitung der `HTTP`-Protokoll-spezifischen Daten nicht benötigen.
- Abstrakte Klasse `GenericServlets` implementiert die  Methode `service()` nicht

- `HttpServlet` implementiert die Klasse `GenericServlet` und überschreibt die Methode `service()`
- `HttpServlet` benutzt man in der Regel auch zum Beantworten von `HTTP`-Anfragen


## 3.2 Verarbeitung von Anfragen und Erzeugen einer Antwort

- Auswertung einer Anfrage und Antwort auf eine HTTP-Anfrage können aus folgenden Operationen bestehen:
  
  - Verarbeitung von Parametern und Formulardaten 
  - Verarbeitung von Informationen aus dem HTTP-Header 
  - Verarbeitung von Cookies
  - Ermitteln von Pfadinformationen, z.B. die aufgerufene URL
  - Rückgabe eines Statuscodes zur Verarbeitung 
  - Angabe des Inhaltstyps, z.B. text/html
  - Erstellen eines Antwort-HTTP-Headers
  - Erstellen des Bodys der HTML-Seite

- Informationen aus dem HTTP-Header 
  - Angaben zum Browser des Clients
  - Benutzername und Passwort
  - Zugriff auf Formulardaten eines HTML-Formulars
  - Cookies

- Ein Servlet, das über mehrere Pfade erreichbar ist, wird auch als **Front Controller** bezeichnet, da es den Zugriff auf verschiedene Ressourcen an vorderster Front kontrolliert.
- Werden keine Parameter an das Servlet übermittelt, wird in der Regel die Methode `doGet()` zum Erzeugen einer Rückgabe verwendet
- Ein Nachteil von Servlets ist die Vermischung von Java-Code und den Ausgabeanweisungen für die Generierung der HTML-Seite
- zwei Arten von Fehler bei Verarbeitung von Anforderungen:
  -  Exceptions
  -  Fehler- bzw. Statuscodes

- **Debugging**- Um Fehler auffinden zu können, bietet sich folgende Vorgehensweise an:
  - wiederverwendbare Operationen sollten in separate Klassen ausgelagert werden und können auf herkömmliche Weise getestet werden.
  - Man kann die Ausgabe verwendet werden: `out.println()`. Nachteil, man muss dafür sorgen, dass diese auch später entfernt wird.
  - Die Methode `log()` dient ebenfalls zur Ausgabe von Textinformationen in eine serverspezifische Log-Datei und hat die gleichen Vor- und Nachteile wie `out.println()`
  - Verwendung einer Logging Library.
  - Erzeugter HTML-Code kann zur Überprüfung der Ausgabe des Servlets verwendet werden.

HTTP-Response Header Informationen:

Header-Typ | Erläuterung
-- | --
`Content-Type` | Übermittlung des Mime-Typs der Seite, damit ein Bild auch binär und nicht als Text interpretiert wird.
`Location` | Weiterleitung eines Requests auf eine andere Seite. Es muss außerdem der Statuscode 302 übermittelt werden
`Refresh` |veranlasst den Browser, die Seite nach der angegebenen Zeit neu zu laden


## 3.3 Übergabe von Parametern
- Es gibt verschiedene Methoden, um Parameter an ein Servlet zu übergeben: 
  - über Konfigurationsdateien,
  - dynamisch zur Laufzeit durch verschiedene Objektlisten.

- für servletspezifischen Parameter wir das ServletConfig-Objekt benötigt, welches einem Servlet in der Methode `init()` übergeben wird


## 3.4 Formulardaten verarbeiten

- Unterschiede zwischen GET und POST

Methode | Datentransfer | Anwendungsgebiet
-- | -- | --
`GET` | Die Daten werden an die URL angehängt und sind somit für den Benutzer sichtbar. Da für URLs Längenbeschränkungen existieren, können Sie nicht beliebig lange Daten versenden.| Da die GET-Methode die Standardmethode des HTTP-Protokolls ist, wird sie immer unterstützt. Die Parameter werden über die URL sehr einfach übergeben und erlauben so auch einfache, automatisierte Parameterübergaben.
`POST` | Die Daten werden im Rumpf des HTTP-Request übertragen. Die Länge ist damit beliebig und der Benutzer kann die Werte nicht lesen.|Umfangreiche Daten können nur über POST übermittelt werden. Insbesondere lassen sich binäre Daten besser übertragen. 

## 3.5 Der ServletContext

- Ein Objekt der Klasse `javax.servlet.ServletContext` erlaubt einem Servlet den Zugriff auf den Kontext einer Webanwendung, der genau einmal existiert
- In der Methode `init()` eines Servlets wird ein Objekt vom Typ `javax.servlet.ServletConfig` übergeben
- Die vier Methoden des ServletConfig-Objekts erlauben: 
  - den Zugriff auf den Namen des Servlets.
  - den Zugriff auf den Servlet-Kontext mittels `getServletContext()`
  - den Zugriff auf die Parameter, die im Deployment Descriptor im `<servlet>`-Element direkt an das Servlet übergeben werden (`getInitParameter()`, `getInitParameterNames()`)

## 3.6 Rückgabe von Grafiken

- Damit ein Servlet ein Binärobjekt erzeugen und als Antwort zurücksenden kann, sind folgende Schritte notwendig:
  - Content-Typ auf den Typ des zurückgelieferten Formats setzen
  - das Headerelement `Content-Disposition` optional setzen, um den Dateinamen für die zurückgegebene Datei festzulegen
  - OutputStream des HttpServletReponse-Objekts statt des PrintWriters verwenden.

- Die Angabe des Content-Typs muss als erste Anweisung bei der Rückgabe erfolgen. 

Mime-Typ | Anwendungstyp
--|--
application/pdf | Adobe PDF 
application/zip | ZIP-Datei 
image/gif image/jpg | Bilddateien im GIF- und JPG-Format 
text/plain | reine Textdatei 
text/html | HTML-Datei 
text/xml | XML-Datei 

- ist der Conten-Type nicht bekannt, kann es über die Methode `getMimeType()` des ServletContext-Objekts bestimmt werden
- die Datei **muss** auf dem Datenträger vorliegen.
`String cType = getServletContext().getMimeType("Pfad zur Datei");`

- Wird eine Datei dynamisch bereitgestellt, steht kein Dateiname zur Verfügung. Der Microsoft Internet Explorer bietet beispielsweise den Namen des Servlets an
- Um dem Browser einen Dateinamen zu übermitteln, setzt man das Element `Content-Disposition` auf den Namen der Datei.  Man beachte den Aufbau des Werts, der nicht nur aus dem Dateinamen besteht, sondern auf einen Anhang hinweist:
`response.setHeader("Content-Disposition","attachment; filename="DateiName"");`


## 3.7 Cookieverarbeitung

> **Cookies** dienen dazu, auf einem Client (Browser) eine Textinformation zu hinterlassen, die von einem Webserver bzw. einer Webanwendung erstellt wurde. Wenn der Browser eine Anfrage an einen Webserver stellt, sind die Cookies immer Teil des HTTP-Headers.

- Cookies haben die folgenden Eigenschaften:
  - Sie speichern nur Text und enthalten keine ausführbaren Programmteile.
  - Der Text eines Cookies besteht aus Name-Wert-Paaren.
  - Cookies können nur von dem Webserver gelesen werden, von dem Sie erstellt wurden.
  - Sie werden immer über den HTTP-Header übertragen.
  - Als Einschränkung dürfen in der Regel (hängt von der Implementierung des Browsers ab) nur 20 Cookies pro Server und insgesamt 300 Cookies auf einem Client gespeichert werden. Wird die Anzahl überschritten, werden Cookies gelöscht.
  - Neben der Einschränkung der Lesbarkeit eines Cookies durch den erstellenden Server kann die Lesbarkeit auch auf eine ganz bestimmte URL eingeschränkt werden.
  - Ein Cookie darf maximal 4 KB groß sein. Es lassen sich also nicht beliebig viele Informationen in einem Cookie speichern.

- typische Einsatzmöglichkeiten von Cookies 
  - Das übliche Einsatzgebiet sind Warenkörbe. Dabei ist nicht der Inhalt des Warenkorbs im Cookie enthalten, sondern nur die Kundennummer und ein Verweis auf einen Warenkorb, der auf dem Server gespeichert ist.
  - Wird für den Zugriff auf eine Webseite eine Authentifizierung benötigt, können diese Daten dauerhaft in einem Cookie gespeichert und beim folgenden Aufrufen der Seite wiederverwendet werden.
  - Benutzer können mithilfe von Cookies Webseiten in ihrer Darstellung anpassen. Dies ist z.B. nützlich, um sich eine individuelle Ansicht eines Aktienportfolios zu erstellen. 

- Cookies können genutzt werden, um die Privatsphäre einer Person zu gefährden.


## 3.8 Sessionhandling
- Es stehen verschiedene Varianten des Session Trackings (Sitzungsverfolgung) zur Verfügung:
  -  die Verwendung von Cookies. Nach dem Setzen des Cookies durch die Webanwendung wird dieses bei jedem HTTP-Request mit übertragen und sein Inhalt zur Identifikation des Benutzers genutzt.
  -  URLs überschreiben (URL Rewriting) ist immer möglich, allerdings zum Teil mit erheblichem Aufwand und funktionellen Nachteilen verbunden. An eine URL wird dazu bei der Übertragung eine Session-ID angefügt, z.B. `http://www.fernuni.de/plan;jsessionid=0123`. 
  -  Versteckte Formularfelder sind eine weitere Variante, eine Session-ID an die Webanwendung zu übermitteln

## 3.9 Threadsicherheit
- Um den gemeinsamen Zugriff mehrerer Threads auf eine Servlet-Instanz zu unterbinden, kann eine Servlet-Klasse das Interface `SingleThreadModel` implementieren. *Es dient lediglich als Markierung und besitzt keinerlei Methoden.*
- 