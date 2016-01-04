<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 04.01.2016
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test der JSP EL </title>
</head>
<body>
17 * 5 = ${17*5}
<br>
17 / 5 = ${17/5}
<br>
17 mod 5 = ${17 mod 5}
<br>
5 > 4 = ${5 > 4}
<br>
3 < 2 = ${3 < 2}
<br>
5 > 4 or 3 < 2 = ${5 > 4 or 3 < 2}
5 > 4 or 3 < 2 = ${(5 > 4) or (3 < 2)}
</body>
</html>
