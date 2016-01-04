<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 28.12.2015
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>wortZahl JSP Beispiel</title>
</head>
<body>
<%!
    int wortzahl = 0;
    public void setWortzahl(String wort){
        wortzahl = wort.length();
    }
%>
<%
setWortzahl("DasIstEinWort");
out.println("Anzahl Buchstaben:"+wortzahl);
%>

</body>
</html>
