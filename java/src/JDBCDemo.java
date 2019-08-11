//Test Java class to test connectivity with trailmaint database in PostgreSQL

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCDemo {
    public static void main(String[] args) {
        Connection conn;
        Statement stmt;
        try {
            // Load the JDBC driver
            Class.forName("org.postgresql.Driver");

            // Establish connection --> Dev team -->  Uncomment out your specific PostgreSQL configuration below

            // Sarah
            String url = "jdbc:postgresql://localhost:5432/trailmaint";
            conn = DriverManager.getConnection(url, "postgres", "postgres");

            // Kevin
 //           String url = "jdbc:postgresql://localhost:5436/trailmaint";
 //           conn = DriverManager.getConnection(url, "postgres", "password");

            // Query the database
            String sql = "select trailID, name, countyID, stateID, mileage, condition_status, difficulty_level, " +
                    "email, website, ST_AsText(geom) as geom from trail";
            stmt = conn.createStatement();
            ResultSet res = stmt.executeQuery(sql);

            // Print the result
            if (res != null) {
                while (res.next()) {
                    System.out.println("Trail Name: " + res.getString("name"));
                    System.out.println("County ID: " + res.getString("countyID"));
                    System.out.println("State ID: " + res.getString("stateID"));
                    System.out.println("Mileage: " + res.getString("mileage"));
                    System.out.println("Condition: " + res.getString("condition_status"));
                    System.out.println("Difficulty: " + res.getString("difficulty_level"));
                    System.out.println("Contact Info: " + res.getString("email"));
                    System.out.println("Website: " + res.getString("website"));
                    System.out.println("geom: " + res.getString("geom"));
                }
            }

            // Clean up
            stmt.close();
            conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
