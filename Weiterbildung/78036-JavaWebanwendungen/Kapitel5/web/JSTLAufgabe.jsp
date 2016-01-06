<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 05.01.2016
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="Steuernummer" value="DE123 456 789" />
<c:if test="${Steuernummer!= null}" >
    Steuernummer: <c:out value="${Steuernummer}" />
</c:if>
<c:set var="Steuernummer"  />
<br>
Steuernummer(null): <c:out value="${Steuernummer}" />

<br><br>
Steuernummer enthält Zeichenkette 202:${fn:contains("Steuernummer", "456")}
<br>
Steuernummer Länge:${fn:length("Steuernummer")}

</body>
</html>
