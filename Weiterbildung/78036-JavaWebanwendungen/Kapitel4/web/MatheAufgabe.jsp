<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 29.12.2015
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="de.fernuni.kap04.Kreise" %>
<html>
<head>
    <title>MatheAufgabe</title>
</head>
<body>
<h1> kleine Matheaufgabe </h1>
<%!
    Kreise k1 = new Kreise();
    Kreise k2 = new Kreise();
%>

<%
    out.println(k1.getContent());
%>
<br>+<br>
<%
    out.println(k2.getContent());
%>
<br>=<br>
<form method="post" action="/">
    <input type="text" name="Textfeld"  size=20 maxlength=50><br>
    <INPUT TYPE="TEXT" value="<% out.println(k1.ge);%>" SIZE="20">
    <INPUT TYPE="TEXT" NAME="optional" SIZE="20">

    <input type="submit" value="auswerten" />


</form>
</body>
</html>
