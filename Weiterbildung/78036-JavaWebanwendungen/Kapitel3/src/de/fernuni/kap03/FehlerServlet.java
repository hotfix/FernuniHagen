package de.fernuni.kap03;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class FehlerServlet extends HttpServlet
{
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException
  {
    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    response.getWriter().print("<html><head><title>Oops an error happened!</title></head>");
    response.getWriter().print("<body>Something bad happened uh-oh!</body>");
    response.getWriter().println("</html>");
  }
}
