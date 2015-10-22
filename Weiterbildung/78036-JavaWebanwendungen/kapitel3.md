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
