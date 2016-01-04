<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 28.12.2015
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Meine zweite JSP-Seite</title>
</head>
<%-- Dies ist ein JSP Kommentar --%>
<!-- Dies ist ein HTML Kommentar -->
<body>
<%!
    String meldung = "";
    public void jspInit()
    {
        meldung = "Initialisisierung";
    }
    public void jspDestroy()
    {
        System.out.println("JSP wird entladen ...");
    }
%>
<%= meldung %>
</body>
</html>