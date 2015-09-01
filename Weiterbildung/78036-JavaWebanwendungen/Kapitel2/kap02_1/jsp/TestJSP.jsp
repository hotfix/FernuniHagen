<%! private String hello = "Willkommen"; %> 
<html> 
  <head> 
    <title> 
      <%= System.getProperty("java.home") %> 
    </title> 
  </head> 
  <body> 
    <%= hello.toString() %> 
  </body> 
<html> 