<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 06.01.2016
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="de.fernuni.kap07.*" %>
<html>
<head>
    <title>Kundenliste</title>
    <style type="text/css">
        <!--
        table { font:10pt Verdana;}
        td { background-color:lightyellow; }
        -->
    </style>
</head>
<body>
<h3>Kundenliste</h3>
<table border="1" cellpadding="2" cellspacing="0"
       bordercolor="#000000">
    <%
        GetCDListe gkl = (GetCDListe)application.getAttribute("GetCDListe");
        java.util.ArrayList al = gkl.getListe();
        java.util.Iterator iterKunden = al.iterator();
        while(iterKunden.hasNext())
        {
            CDSammlung k = (CDSammlung)iterKunden.next();
    %>
    <tr>
        <td width="50"><%= k.getId() %></td>
        <td width="150"><%= k.getIntereter() %></td>
        <td width="150"><%= k.getTitel() %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
