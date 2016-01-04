<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 28.12.2015
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Zeitangabe</title>
</head>
<body>
<h1>aktuelle Zeit</h1>
<%! DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); %>
 <%= df.format(new java.util.Date()) %>

</body>
</html>
