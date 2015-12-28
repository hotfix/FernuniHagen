package de.fernuni.kap03;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HTTPHeaderServlet extends HttpServlet
{
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException
  {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    out.println("<html><head><title>Headerinformationen</title></head><body><h3>");
    out.println("Header - Informationen");
    out.println("</h3>");

    Enumeration e = request.getHeaderNames();
    while (e.hasMoreElements())
    {
      String name = (String)e.nextElement();
      String wert = request.getHeader(name);
      out.println("<strong>"+name +"</strong>"+ ":" + wert + "<br>");
    }
    
    out.println("</body></html>");
  }
}
