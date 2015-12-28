package de.fernuni.kap03;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ExceptionServlet extends HttpServlet
{
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException
  {
  	throw new NumberFormatException("Fehlerhafte Umwandlung");
    // response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
  }
}
