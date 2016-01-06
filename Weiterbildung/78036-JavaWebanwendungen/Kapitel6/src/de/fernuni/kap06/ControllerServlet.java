package de.fernuni.kap06;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ControllerServlet extends HttpServlet
{
  private RequestDispatcher rd = null;

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException
  {
  	// Session ermitteln oder erstellen
  	HttpSession sess = request.getSession(false);
    if(sess == null)
      sess = request.getSession();

    String refUrl = request.getHeader("Referer");
    if((refUrl != null) && (refUrl.equals("http://localhost:8080/Kantine_Res.jsp")))
    {
      // Attribut lesen
    	KantineBest kb = (KantineBest)sess.getAttribute("Bestellung");
    	if(kb == null)
    		kb = new KantineBest();

      kb.setName((String)request.getParameter("Name"));
      kb.setVorname((String)request.getParameter("Vorname"));
      kb.setWochentag((String)request.getParameter("Wochentag"));
      kb.setEssen((String)request.getParameter("Essen"));
        kb.setPersonalnr((String)request.getParameter("Personalnummer"));
        kb.setTelefonnr((String)request.getParameter("Diensttelefon"));

      sess.setAttribute("Bestellung", kb);
      if(!kb.checkKonto() | !kb.checkInput())
        response.sendRedirect("/Kantine_Res.jsp");
      else
      {
        rd = request.getRequestDispatcher("/Kantine_Best.jsp");
        rd.forward(request, response);
      }
    }
    else
    {
   	  rd = request.getRequestDispatcher("/portal/Kopf.html");
   	  rd.include(request, response);
   	  rd = request.getRequestDispatcher("/portal/Rumpf.html");
   	  rd.include(request, response);
   	  rd = request.getRequestDispatcher("/portal/Fuss.html");
   	  rd.include(request, response);
    }
  }
  public void doPost(HttpServletRequest request,
                    HttpServletResponse response)
                    throws IOException, ServletException
  {
  	doGet(request, response);
  }
}
