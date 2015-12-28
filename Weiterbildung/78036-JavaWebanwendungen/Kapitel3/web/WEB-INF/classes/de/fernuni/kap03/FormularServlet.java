package de.fernuni.kap03;

import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class FormularServlet extends HttpServlet
{
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException
  {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.println("<html><body>");
    out.println("<h3>Formulardaten</h3>\n");

    for(Enumeration e1 = request.getParameterNames(); e1.hasMoreElements();)
    {
      String s = (String)e1.nextElement();
      out.println(s + ": " + request.getParameter(s) + "<br />");
    }
    out.println("</body></html>");
  }
}
