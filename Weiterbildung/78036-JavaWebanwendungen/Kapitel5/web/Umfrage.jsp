<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 04.01.2016
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>

<jsp:useBean id="Umfrage" scope="session" class="de.fernuni.kap05.UmfrageBean">
    <jsp:setProperty name="Umfrage" property="programmiersprache" value="C#"/>
    <jsp:setProperty name="Umfrage" property="betriebssystem" value="Windows"/>
    <jsp:setProperty name="Umfrage" property="jahreErfahrung" value="5"/>
</jsp:useBean>
<html>
<head></head>
<body>
<h3>Umfrageergebnis:</h3>
Programmiersprache:
<jsp:getProperty name="Umfrage" property="programmiersprache"/>
<br>
Betriessystem:
<jsp:getProperty name="Umfrage" property="betriebssystem"/>
<br>
Erfahrung in Jahren:
<jsp:getProperty name="Umfrage" property="jahreErfahrung"/>
Jahre<br>
</body>
</html>