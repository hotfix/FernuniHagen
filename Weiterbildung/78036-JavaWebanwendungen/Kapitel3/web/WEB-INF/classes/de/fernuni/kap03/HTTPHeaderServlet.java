package de.fernuni.kap03;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HTTPHeaderServlet extends HttpServlet
{
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException
  {
    response.setContentType("text/html");
    response.setIntHeader("Refresh", 5);
    
    PrintWriter out = response.getWriter();
    out.println("<html>\n<body>\n");
    out.println(new java.util.Date().toString());
    out.println("</body>\n</html>");
  }
}
