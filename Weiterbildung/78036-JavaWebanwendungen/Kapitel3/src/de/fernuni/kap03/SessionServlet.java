package de.fernuni.kap03;

import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SessionServlet extends HttpServlet
{
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException
  {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    out.println("<html><body>");
    out.println("<h3>Session-Info</h3>\n");

    HttpSession sess = request.getSession(false);
    if(sess == null)
    {
      sess = request.getSession();
      sess.setAttribute("Name", "Musterkunde");
      sess.setMaxInactiveInterval(180);
    }
    else
    {
      out.println((String)sess.getAttribute("Musterkunde"));
      sess.invalidate();
    }

    out.println("<h3>Aktuelles Timeout</h3>");
    out.println(sess.getMaxInactiveInterval());

    out.println("</body></html>");
  }
}
