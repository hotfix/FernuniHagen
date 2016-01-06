<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="Bestellung" scope="session" class="de.fernuni.kap06.KantineBest" />

<html>
  <head>
    <title>Essenbestellung</title>
    <style type="text/css">
    <!--
      table { font:10pt Verdana; border-spacing:20px; }
      td { background-color:lightyellow; }
    -->
    </style>
  </head>
  <body>
    <form action="/mainServlet" method="POST">
      <h2>Essenbestellung</h2>
      <h3>Persönliche Daten</h3>

      <table border="1" cellpadding="2" cellspacing="0" bordercolor="#000000">

        <tr><td width="100">Name</td><td><input type="text" name="Name" value="${Bestellung.name}" ></td></tr>
        <tr><td width="100">Vorname</td><td><input type="text" name="Vorname" value="${Bestellung.vorname}"></td></tr>
        <tr><td width="100">Personalnummer</td><td><input type="text" name="Personalnummer" value="${Bestellung.personalnr}" required></td></tr>
        <tr><td width="100">Diensttelefon</td><td><input type="text" name="Diensttelefon" value="${Bestellung.telefonnr} "></td></tr>
        <tr><td width="100">Wochentag</td>
          <td>
            <select name="Wochentag">
              <c:choose>
                <c:when test="${Bestellung.wochentag=='Dienstag'}">
                  <option>Montag</option>
                  <option selected>Dienstag</option>
                  <option>Mittwoch</option>
                  <option>Donnerstag</option>
                  <option>Freitag</option>
                </c:when>
                <c:when test="${Bestellung.wochentag=='Mittwoch'}">
                  <option>Montag</option>
                  <option>Dienstag</option>
                  <option selected>Mittwoch</option>
                  <option>Donnerstag</option>
                  <option>Freitag</option>
                </c:when>
                <c:when test="${Bestellung.wochentag=='Donnerstag'}">
                  <option>Montag</option>
                  <option>Dienstag</option>
                  <option>Mittwoch</option>
                  <option selected>Donnerstag</option>
                  <option>Freitag</option>
                </c:when>
                <c:when test="${Bestellung.wochentag=='Freitag'}" ><!-- none selected -->
                  <option>Montag</option>
                  <option>Dienstag</option>
                  <option>Mittwoch</option>
                  <option>Donnerstag</option>
                  <option selected>Freitag</option>
                </c:when>
                <c:otherwise >
                  <option selected>Montag</option>
                  <option>Dienstag</option>
                  <option>Mittwoch</option>
                  <option>Donnerstag</option>
                  <option>Freitag</option>
                </c:otherwise>
              </c:choose>


            </select>
          </td>
        </tr>
      </table>

      <h3>Auswahl</h3>
        <table>
          <tr><td><input type="radio" name="Essen" value="Schnitzel"
                  <c:if test="${Bestellung.essen == 'Schnitzel'}">
                    <c:out value="checked" />
                  </c:if> />Schnitzel</td></tr>
          <tr><td><input type="radio" name="Essen" value="Bohnen"
                  <c:if test="${Bestellung.essen == 'Bohnen'}">
                    <c:out value="checked" />
                  </c:if>/>Bohnen</td></tr>
          <tr><td><input type="radio" name="Essen" value="Hühnersuppe"
                  <c:if test="${Bestellung.essen == 'Hühnersuppe'}">
                    <c:out value="checked" />
                  </c:if>/>Hühnersuppe</td></tr>
          <tr><td><input type="radio" name="Essen" value="2 Äpfel"
                  <c:if test="${Bestellung.essen == '2 Äpfel'}">
                    <c:out value="checked" />
                  </c:if>/>2 Äpfel</td></tr>
        </table>

      <c:if test="${Bestellung.errorText != ''}">
        <c:out value="${Bestellung.errorText}" />
      </c:if>

      <br><br>
      <input type="submit" value="Bestellen">
    </form>
  </body>
</html>
