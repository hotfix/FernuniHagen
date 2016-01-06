<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 04.01.2016
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="/NameTag" prefix="t" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test eigenter Tags</title>
</head>
<body>
<h3>Mein Name Version 1</h3>
<t:MeinNameTag />
<h3>Meinname Version 2</h3>
<t:MeinNameSimpleTag/>
<hr>
<h2>Mein Name  mit verwendung von Attributen</h2>
<h3>Meinname Version 3</h3>
<t:MeinNameSimpleTag useCity="true"/>

<h3>Meinname Version 4</h3>
<t:MeinNameSimpleTag useOnlyFirstName="true"/>
<h3>Meinname Version 4</h3>
<t:MeinNameSimpleTag useCity="false"/>
</body>
</html>
