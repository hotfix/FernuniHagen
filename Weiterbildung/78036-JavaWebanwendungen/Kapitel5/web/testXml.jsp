<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

<html>
  <head>
    <title>XML-Tags</title>
  </head>
  <body>
    
    <h3>XML Parsen</h3>
    <c:import url="Kunden.xml" var="doc" />
    <x:parse var="docXml" doc="${doc}" />

    <h4>Pfad: //*</h4>
    <x:out select="$docXml//*" />

    <h4>Pfad: //Kunden/Kunde</h4>
    <x:forEach select="$docXml//Kunden/Kunde">
      <x:out select="Name" />
      <c:out value="<br>" escapeXml="false" />
    </x:forEach>

    <h3>XSL-Transformation</h3>
    <c:import url="Kunden.xml" var="xmlDoc" />
    <c:import url="Kunden.xsl" var="xslDoc" />
    <x:transform doc="${xmlDoc}" xslt="${xslDoc}" />
    
  </body>
</html>

