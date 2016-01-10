/**
 * Created by Alex on 06.01.2016.
 */
import java.sql.*;

public class TestSQL
{
    public TestSQL()
    {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try
        {
            // Treiber laden
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        }
        catch (Exception ex)
        {
            System.out.println("Keinen Treiber gefunden!");
        }
        try
        {
            // Verbindung zur Datenbank herstellen
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost/inventar?user=root&password=start");


                stmt = conn.createStatement();
                stmt.executeUpdate("INSERT INTO cdsammlung(ID, interpret, titel) VALUES (2, 'abc', 'Yes Baby2')");

        }
        catch(SQLException ex)
        {
            System.out.println("SQLException: " + ex.getMessage());
        }

        try
        {
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM cdsammlung");
            while(rs.next())
            {
                System.out.println(rs.getInt(1) + ":" + rs.getString(2) + ":" +
                        rs.getString(3));
            }
        } catch (SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
        }
    }
    public static void main(String args[])
    {
        new TestSQL();
    }
}