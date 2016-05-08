package kurs1796.ke3.servletbeispiel01;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by alexander on 08.05.16.
 */
//@WebServlet(name = "MeinServlet", urlPatterns = {"/start"})
public class MeinServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("</head>");
        out.println("<body>");
        out.println("   <h1>Antwort des Servlets</h1>");
        out.println("   <p>Hallo Servlet!</p>");
        out.println("</body>");
        out.println("</html>");

    } //Ende doGet(...)

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        doGet(request, response);
    }

}
