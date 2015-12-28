package de.fernuni.kap03;

import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CookieServlet extends HttpServlet
{
  private int zaehler = 0;
  private String name = "CookieServler-Beispiel";

  private void getCookie(HttpServletRequest request)
  {
    Cookie[] cList = request.getCookies();
    if(cList != null)
    {
      for(int i = 0; i < cList.length; i++)
      {
        if(cList[i].getName().equals("Zaehler"))
        zaehler = Integer.parseInt(cList[i].getValue());
      }
    }
  }

  private void setCookie(HttpServletResponse response)
  {
    zaehler++;

    Cookie c1 = new Cookie("Zaehler", Integer.toString(zaehler));
    Cookie c2 = new Cookie("Name", name);
    c1.setMaxAge(60*60*24*7);
    c2.setMaxAge(60*60*24);
    c2.setPath("/kap03-9");

    response.addCookie(c1);
    response.addCookie(c2);
  }

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException
  {
    response.setContentType("text/html");
    getCookie(request);
    setCookie(response);
    PrintWriter out = response.getWriter();

    out.println("<html><body>");
    out.println("<h3>Cookies</h3>\n");

    Cookie[] cList = request.getCookies();
    if(cList != null)
    {
      for(int i = 0; i < cList.length; i++)
      out.println(cList[i].getName() + ": " + cList[i].getValue() + "<br />");
    }

    out.println("</body></html>");
  }
}
