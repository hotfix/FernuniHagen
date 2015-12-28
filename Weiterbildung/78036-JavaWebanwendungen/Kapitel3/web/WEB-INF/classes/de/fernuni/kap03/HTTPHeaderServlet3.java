package de.fernuni.kap03;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HTTPHeaderServlet3 extends HttpServlet
{
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException
  {
    response.setHeader("Location", "http://localhost:8080/kap03/HTTPHeaderInfo.html");
    response.setStatus(301);
  }
}
