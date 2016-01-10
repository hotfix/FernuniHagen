package de.fernuni.kap07;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Created by Alex on 06.01.2016.
 */
public class GetCDSammlungServlet extends HttpServlet {
    private ServletConfig config = null;
    private ServletContext context = null;
    private RequestDispatcher rd = null;
    public void init(ServletConfig conf)
    {
        this.config = conf;
        this.context = conf.getServletContext();
    }
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
            throws IOException, ServletException
    {
        GetCDListe gkl = (GetCDListe)context.getAttribute("GetCDListe");
        if(gkl == null)
            gkl = new GetCDListe();
        if(!gkl.createListe())
        {
            rd = request.getRequestDispatcher("/Error.jsp");
            rd.forward(request, response);
        }
        else
        {
            context.setAttribute("GetCDListe", gkl);
            rd = request.getRequestDispatcher("/ShowCDSammlung.jsp");
            rd.forward(request, response);
        }
    }
}
