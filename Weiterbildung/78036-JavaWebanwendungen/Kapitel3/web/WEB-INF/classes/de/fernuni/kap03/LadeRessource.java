package de.fernuni.kap03;

import java.io.*;
import java.net.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LadeRessource extends HttpServlet
{
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException
  {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    out.println("<h3>Pfadinformationen</h3>");
    out.println("<table>");
    out.println("<tr><td>PathInfo</td><td>" + request.getPathInfo() + "</td></tr>");
    out.println("<tr><td>ContextPath</td><td>" + request.getContextPath() + "</td></tr>");
    out.println("<tr><td>PathTranslated</td><td>" + request.getPathTranslated() + "</td></tr>");
    out.println("<tr><td>QueryString</td><td>" + request.getQueryString() + "</td></tr>");
    out.println("<tr><td>RequestURL</td><td>" + request.getRequestURL() + "</td></tr>");
    out.println("<tr><td>ServletPath</td><td>" + request.getServletPath() + "</td></tr>");
    out.println("</table>");
  }
}
