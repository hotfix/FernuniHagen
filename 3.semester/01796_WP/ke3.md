[TOC]

# Kurseinheit 3

## Kapitel 7

### Java EE

- Architektur von Java EE orientiert sich an einer Schichtenarchitektur.

  - *Client-Computer*
  - *Java EE-Server* ist unterteilt in Web-Schicht und Businesslogik
  - *Datenbank-Server*

- Ein *Application* Server - kein physischer Rechner, sondern eine Software, die auf einem Server installiert ist und eine Java EE-Spezifikation implementiert. 

- Java EE-Spezifikation definiert vier Bereiche, die **Container** genannt werden

  - **Web Container** - zuständig für Servlet, JSF,  JSP. Verwaltet die Technologie
  - **EJB Container** -verwaltet auf der EJB basierte Elemente. Klassen die Businesslogik implementieren und Objekte
  - **Applet Container** -zuständig für die Verwaltung der Applets.
  - **Application Client** - Java GUI Anwendung

  ​

  ![Container Java EE](./img/kap7_container.png)

### Verzeichnisstruktur der JavaEE Webschicht

| Verzeichnis bzw. Datei    | Inhalt                                   |
| ------------------------- | ---------------------------------------- |
| */[Name]*                 | Name der Webanwendung. Wurzelverzeichnis |
| */[Name]/WEB-INF*         | Dateien die nur aus der Anwendung sichbar sind. |
| */[Name]/WEB-INF/classes* | Übersetzte Java Klassen                  |
| */[Name]/WEB-INF/lib*     | verwendete Java Bibliotheken             |
| */[Name]/WEB-INF/web.xml* | Deployment Descriptor der Web Anwendung  |
| */[Name]/META-INF*        | Metadaten über da WAR- Archiv und darin enthaltene Dateien |
| */[Name]/**               | Dateien, die über HTTP adressierbar sind. |

### Deployment Descriptor

- mit Deployment Descriptor können folgende Bereiche konfiguriert werden:
  - ServletContext-Initialisierungsparameter
  - Session-Konfiguration
  - Servlet-Deklarationen
  - Servlet-Mappings
  - Filter-Definitionen
  - Filter-Mappings
  - Welcome File List
  - Fehlerseiten

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="3.0" xmlns="http://java.sun.com/xml/ns/javaee" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xsi:schemaLocation="http://java.sun.com/xml/ns/javaee 
  http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd">
    <servlet>
        <servlet-name>MeinServlet</servlet-name>
        <servlet-class>kurs1796.MeinServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>MeinServlet</servlet-name>
        <url-pattern>/start/*</url-pattern>
    </servlet-mapping>

  <!-- Konfiguration der Startseite -->
    <welcome-file-list>
      <welcome-file>start</welcome-file>
    </welcome-file-list>
</web-app>
```

### Annotations

- mit Hilfe von Annotation lassen sich Meta-Informationen in den Quelltext einbeziehen
- man unterscheide  zwei Arten von Annotationen 
  - Annotationen,die die Semantik des Programmcodes ändern 
  - und Annotationen, die die Semantik nicht ändern
- Wichtige Annotation für diesem Kurs ist `@WebServlet`
  - Deklariert ein eine Java Klasse als Webservlet
  - Pflicht Paramter sind entweder `value` oder `urlPatterns`, beide dürfen nicht angegeben werden

```java
// Servlet Deklaration durch Annotation @WebServlet
@WebServlet(value={"/start","/musterServlet"})
public class MusterServlet extends HttpServlet {
    protected void doGet( HttpServletRequest request, HttpServletResponse 							response) throws ServletException, IOException {
    ...
    }
 ...   
}


// Servlet Deklaration durch Annotation @WebServlet mit mehreren Parametern
@WebServlet(name="MusterServlet", urlPatterns={"/start","/musterServlet"})
public class MusterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse
                         response) throws ServletException, IOException {
 ...
	}
 ...
}
```

## Kapitel 8

### Servlets: Request-Ablauf

- Web Container nimmt HTTP request entgegen
- Request wird in `HttpServletRequest`-Objekt umgewandelt
- Es wird ein leeres Antwortobjekt erzeugt, `HttpServletResponse`, welches auch ein Objekt der Klasse `PrintWriter` bereit stellt
- Web Container ruft mit den Request und Response object die öffentliche `service()` Methode des Servlets auf.
- Diese ruft wiederum die geschützte Methode `service()` des Servlets auf, die als "Dispatcher" dient.
- Die Anfrage wird an die doGet/doPost Methode weitergeleitet.

### Aufgabe, Lebenszyklus, Thread-Sicherheit

- Servlet Klasse wird von `HttpServlet` abgeleitet
- Servlet kann nach Bedarf folgende Aufgaben ausführen:
  - vom Client gesendete Daten lesen
  - vom Client gesendeten HTTP Request Header lesen
  - Ergebnisse erzeugen
  - HTTP Response Header setzen
  - Antwort Dokument erstellen
- Servlet hat einen fest definierten Lebenszyklus:
  - Initialisierung
  - Request Bearbeitung
  - Zerstörung
- Web Container startet fur die Dauer der Anwendung <u>genau eine Instanz</u> pro Servlet
- Alle Threads greifen auf die selbe Instanz des Servlets zu => *Thread- sicher*
  - 1. Variante: Keine Instanzvariablen verwenden!!
    2. Variante: alle Instanzvariablen in der `init()`-Methode des Servlets mit Werten zu füllen und bei allen Aufrufen der `service(...)`-Methode nur lesend auf diese Instanzvariablen zuzugreifen
    3. Variante: Lese und Schreibvorgänge erlauben, diese jedoch synchronisieren

### Scopes

- *Request Scope* - durch die Schnittstelle `HttpServletRequest` definierte Request Objekt. Bewahrt Daten für die Dauer eines Requests. Wird vom Web Container bei jedem Request erzeugt, dem Servlet zur Verfügung gestellt und nach Ablauf des Requests geloscht.
- *Session Scope* - durch die Schnittstelle `HTTPSession` definiertes Session Objekt. Bewahrt die Daten für die Dauer einer Session. Session-Objekt wird vom Request-Objekt mittels der Methode `getSession()` angesprochen
- *Application Scope* - durch das Interface `ServletContext` definierte ContextObjekt. Bewahrt Daten für die gesamte Dauer der Webanwendung. ContextObjekt wird von einem Servlet mittels der Methode `getServletContext()` angesprochen.
- *Page Scope* - besitzt nur JSP lokale Daten => nur JSP relevant

### Java Beans

- dienen zum Speichern von Objektinformationen

### Servlet API

- **abstrakte Klasse HttpServlet** - gibt das Grundgerüst einer Servlet Klasse vor
- **Schnittstelle HttpServletRequest**
  - Unterschied zwischen Attributen und Parametern einer Anfrage besteht darin, dass in Attributen auch Java-Objekte gespeichert werden konnen, in Parametern lediglich Zeichenketten.
- **Schnittstelle HttpServletResponse**
- **Schnittstelle HttpSession**
- **Schnittstelle ServletContext**
- **Schnittstelle RequestDispatcher**

## Kapitel 9

- `JSP` ist eine Technologie, die
  - Entwurf dynamischer Webseiten unterstützt
  - Java Code in HTML Code eingebettet ist
  - `JSP` spezifische Tags unterstützen Trennung von Programmlogik und Layout

### JSP: Request-Ablauf

- verläuft analog zu Servlet Request
- Beim ersten Aufruf wird aus JSP Seite ein Servlet generiert.

### Template-Text, JSP-Kommentare undJSP-Direktiven

- **Template Text** - jede Form vom statischem Text, der an den Client gesendet wird. z.b. HTML Tags, HTML Kommentare


- **JSP Kommentar** - im Gegensatz zu HTML-Kommentar, ist nicht Teil der an den Client gesendeten Response.
- **JSP Direktive** - enthalt Informationen bzw. Anweisungen für den Web-Container. Es könne z.B. Java Klassen/Pakete importiert werden

| Direktive | Attribute     | Bedeutung                                |
| :-------- | :------------ | :--------------------------------------- |
| `page`    | `import`      | Import-Anweisung für die aus der JSP erzeugte Servlet- Klasse; mehrere importierte Klassen und Pakete können durch Kommata getrennt aufgefuhrt werden. |
|           | `errorPage`   | Relative URI einer anderen JSP-Seite, die angesteuertwird, falls bei Ausführung einer JSP-Seite eine Exception auftritt und die Verarbeitung nicht fortgeführt werden kann. |
|           | `isErrorPage` | Erklärt eine JSP-Seite als Fehlerseite, auf die von einer anderen JSP-Seite über das Attribut `errorPage` verwiesen werden kann |
|           | `contentType` | Gibt den Dokumenttyp der Response an. Der Standardwert ist `text/html` |
| `include` | `file`        | Relative URI einer anderen JSP-Seite oder eines HTML Fragments,die/das an der angegebenen Stelle zur Übersetzungszeit eingefügt wird |
| `taglib`  |               |                                          |
|           | `prefix`      | Gibt ein frei wählbares Präfix für die Tags der Tag-Bibliothek an, um diese innerhalb der JSP-Seite ansprechen zu konnen |
|           | `uri`         | Gibt eine URI an, die auf die Tag-Bibliothek verweist. Diese URI kann eine URL, eine URN oder ein Pfadname sein. |



### JSP-Deklaration

- JSP Deklaration bietet eine Möglichkeit Variablen und Methoden zu deklarieren
- Werten Teil des Servlets, ausserhalb der `jspService(...)`-Methode
- Variablendeklaration sollte mit Vorsicht verwendet werden, wegen der Thread-Sicherheit.
- Deklaration erfolgt zwischen `<%! .. %>`

### JSP-Ausdruck

- ist ein auswerbarer Ausdruck
- Ausdruck steht zwischen `<%= ...%>`
- Es darf immer nur ein einziger Ausdruck zwischen `<%= ...%>`  stehen

### JSP-Scriplets

- ist eine Java-Anweisung, mit der z.B. eine Berechnung, ein Datenbankzugriffoder ein Anwendungskernaufruf durchgefuhrt werden kann.
- Ausgabe an den Client nur durch `println(...) `-Methode
- Scriplets stehen zwischen `<% ... %>`

### JSP-Aktionen

- JSP-Aktionen decken einen Teil der Funktionalitat von Scripting-Elementen ab
- Syntax entspricht  der XML-Syntax
- Mit JSP-Aktionen konnen u.a. Objekte erzeugt und bearbeitet, auszuwertende Aus- ¨drucke erstellt, Requests an andere JSP-Seiten oder Servlets weitergeleitet oder Java-Applets ¨integriert werden
- `  <jsp:action attribut1="wert1" attribut2="wert2"...> ... </jsp:action> `

### Expression Language

- Mit der Expression Language (EL), kann man von einer JSP-Seite auf in einem Scope gespeicherte Objekte und, sofern dies JavaBeans sind, auch auf deren Properties (Eigenschaften) zugreifen

- Einfach Syntax

- nicht ohne weiteres möglich, Objekte zu erzeugen/modifizieren

- `$<Ausdruck>` -EL Ausdruck wird bei der Übersetzung der JSP-Seite ausgewertet

- weitere Mögliche Form: `#<Ausdruck>`

  - verzögerte Auswertung, heisst Auswertung nur wenn diese benötigt wird.
  - darf nur in bestimmten Attributtweeden stehen
  - wird vornehmlich in JSF eingesetzt

- EL sucht die Objekte zuerst in Page Score, dann in Request Score, danach im Session Score und zum Schluss im Application Score. 

- Syntax Beispiele:

- ```jsp
  ${kunde.firstName}
  <!-- oder -->
  ${kunde["firstName"]}

  ${kunde.adresse.strasse}
  <!--oder--> 
  ${kunde["adresse"]["strasse"]}

  <!--Auf die Elemente von Arrays oder Listen kann nur über die Variante mit den eckigen Klammern zugegriffen werden, wahlweise mit oder ohne Hochkommata:-->
  ${warenkorb[0]} 
  ${warenkorb["0"]}

  <!--Ist der String "deutschland" unter dem Namen land in einem Scope abgelegt, dann führen die Zugriffe zum selben Ergebnis-->
  ${hauptstaedte[land]}  
  ${hauptstaedte["deutschland"]}
  ```

- Es gibt eine implizite Fehlerbehandlung. Wenn ein Objekt `null` ist, dann wird einfach `null` zurückgeliefert.

### JavaServer Pages Standard Tag Library

- Wenn die Funktionalität von EL Ausdrücken nicht ausreicht, bietet sich die Verwendung von `JSTL` an
- Mit Hilfe von `JSTL` kann z.B. Iterationen über Mengen von Objekten, bedingte Auswertungen oder spezielle Formatierungen der Ausgabe erfolgen.
- JSTL muss explizit auf der JSP Seite eingebunden werden
  - `<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>`

## Kapitel 10

### Servlets und JavaServer PagesTechnologie aus SoftwareEngineering Sicht

Thema des Kapitels ist MVC und Trettung von Verantwortlichkeiten

# 

