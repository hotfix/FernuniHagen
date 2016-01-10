package de.fernuni.kap07;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by Alex on 06.01.2016.
 */
public class GetCDListe {
    private ArrayList cds = new ArrayList();
    public boolean createListe()
    {
        Statement stmt = null;
        ResultSet rs = null;
        Connection conn = null;
        cds.clear();
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost/inventar?user=root&password=start");
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM cdsammlung");

            while(rs.next())
            {
                CDSammlung k = new CDSammlung(rs.getInt(1), rs.getString(2), rs.getString(3));
                cds.add(k);
            }
            rs.close();
            stmt.close();
            conn.close();
        }
        catch(Exception ex)
        {
            return false;
        }
        return true;
    }
    public ArrayList getListe()
    {
        return cds;
    }
}
