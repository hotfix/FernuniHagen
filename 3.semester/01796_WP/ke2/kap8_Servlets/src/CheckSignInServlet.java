import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CheckSignInServlet", urlPatterns = {"/CheckSignInServlet"})
public class CheckSignInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        //die Benutzereingaben aus dem Request holen
        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        //pruefen, ob der korrekte Benutzername und das korrekte
        //Passwort angegeben wurden
        if ((username == null) || !username.equalsIgnoreCase("kurs1796") ||
                (password == null) || !password.equals("geheim")) {
            //nicht erfolgreiche Authentifizierung:
            //Information, dass ein Fehler aufgetreten ist,
            //im Request Scope ablegen:
            request.setAttribute("errorOccurred", "true");
            //weiterleiten an ShowSignInServlet zwecks
            //Ausgabe der Anmeldeseite:
            RequestDispatcher rd = request.getRequestDispatcher("/ShowSignInServlet");
                    rd.forward(request, response);
        } else {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            //HTML-Dokument erstellen
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Beispiel Systemanmeldung - erfolgreich authentifiziert </title > ");
            out.println("</head>");
            out.println("<body>");
            out.println("<img src=\"images/LogoFeu.jpg\" alt=\" FernUniversit&auml;t in Hagen\">");
            out.println("<h1>Beispiel &quot;Systemanmeldung&quot;</h1>");
            out.println("<h3>aus dem Kurs 01796, Kurseinheit 3</h3>");
            out.println("<p>Sie wurden erfolgreich als Benutzer &quot;" +
                    username + "&quot; authentifiziert.</p>");
            out.println("</body>");
            out.println("</html>");
        }
    } //Ende doGet(...)

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        doGet(request, response);
    }
}