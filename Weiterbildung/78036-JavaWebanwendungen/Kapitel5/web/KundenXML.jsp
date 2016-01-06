<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 05.01.2016
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>XML Verarbeitung mit JSP</title>
</head>
<body>
<c:import url="Kunden.xml" var="doc" />
<x:parse var="docXml" doc="${doc}" />

<x:forEach select="$docXml//Kunden/Kunde">
    <c:out value="<strong>" escapeXml="false" />
    <x:out select="Name" />,
    <c:out value="</strong>" escapeXml="false" /> <x:out select="Vorname" />: <x:out select="Telefon" />
    <c:out value="<br>" escapeXml="false" />
</x:forEach>

<br>
<h3>XSL-Transformation</h3>
<c:import url="Kunden.xml" var="xmlDoc" />
<c:import url="KundenMitTel.xsl" var="xslDoc" />
<x:transform doc="${xmlDoc}" xslt="${xslDoc}" />
</body>
</html>
