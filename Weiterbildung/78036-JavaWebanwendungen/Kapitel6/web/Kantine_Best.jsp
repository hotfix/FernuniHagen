<%@ page contentType="text/html" %>
<jsp:useBean id="Bestellung" scope="session" class="de.fernuni.kap06.KantineBest" />

<html>
  <head>
    <title>Ihre Bestellung</title>
  </head>
  <body>
      <h2>Ihre Bestellung</h2>

      Hallo ${Bestellung.vorname} ${Bestellung.name},<br><br>
      danke für Ihre Bestellung von ${Bestellung.essen}<br><br>
      Guten Appetit!
  </body>
</html>
