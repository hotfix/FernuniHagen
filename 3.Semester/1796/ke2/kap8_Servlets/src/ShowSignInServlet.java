/**
 * Created by alexander on 03.05.16.
 */

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ShowSignInServlet", urlPatterns = {"/ShowSignInServlet"})
public class ShowSignInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        //HTML-Dokument erstellen
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Beispiel Systemanmeldung</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<img src=\"images/LogoFeu.jpg\" alt=\"FernUniversit&auml;t in Hagen\">");
        out.println("<h1>Beispiel &quot;Systemanmeldung&quot;</h1>");
        out.println("<h3>aus dem Kurs 01796, Kurseinheit 3</h3>");
        out.println("<form method=\"POST\" action=\"/kap8_Servlets/CheckSignInServlet\">");
        out.println("<table cellpadding=\"10\" style=\"border-collapse: collapse; border - width:0\">");
        out.println("<tr><td>Benutzername:</td>");
        out.println("<td>");
        out.println("<input type=\"text\" name=\"username\" size=\"20\"></ td > </tr > ");
        out.println("<tr><td>Passwort:</td>");
        out.println("<td>");
        out.println("<input type=\"password\" name=\"password\" size=\"20\"></td></tr>");
        out.println("</table>");
        //Wenn ein Fehler aufgetreten ist, dann soll eine
        //entsprechende Meldung angezeigt werden
        if (request.getAttribute("errorOccurred") != null) {
            out.println("<p><span style=\"color: rgb(255, 0, 0);\">Sie konnten nicht authentifiziert werden.</span > </p > ");
        }
        out.println("<p><input type=\"submit\" value=\"Anmelden\" name=\" buttonLogin\"></p>");
        out.println("</form>");
        out.println("</body>");
        out.println("</html>");
    } //Ende doGet(...)

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        doGet(request, response);
    }
}
