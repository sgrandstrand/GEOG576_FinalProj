//Java class to establish connectivity between trailmaint database in PostgreSQL and java HTTPServlet

package org.webproject.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtility {
    private static final String Driver = "org.postgresql.Driver";

    // Establish connection --> Dev team -->  Uncomment out your specific PostgreSQL configuration below

    // Sarah
//    private static final String ConnUrl = "jdbc:postgresql://localhost:5432/trailmaint";
//    private static final String Username = "postgres";
//    private static final String Password = "postgres";

    // Kevin
//    private static final String ConnUrl = "jdbc:postgresql://localhost:5436/trailmaint";
//    private static final String Username = "postgres";
//    private static final String Password = "password";

    //Megan
//    private static final String ConnUrl= "jdbc:postgresql://localhost:5432/trailmaint";
//    private static final String Username = "postgres";
//    private static final String Password = "BeTheCowboy";

    // This is a constructor
    public DBUtility() {
    }

    // Create a Connection to the database
    private Connection connectDB() {
        Connection conn = null;
        try {
            Class.forName(Driver);
            conn = DriverManager.getConnection(ConnUrl, Username, Password);
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    // Execute a sql query (e.g. SELECT) and return a ResultSet
    public ResultSet queryDB(String sql) {
        System.out.println("SQL query passed to trailmaint database:\n" + sql);
        Connection conn = connectDB();
        ResultSet res = null;
        try {
            if (conn != null) {
                Statement stmt = conn.createStatement();
                res = stmt.executeQuery(sql);
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    // Execute a sql query (e.g. INSERT) to modify the database;
    // No return value needed
    public void modifyDB(String sql) {
        Connection conn = connectDB();
        try {
            if (conn != null) {
                Statement stmt = conn.createStatement();
                stmt.execute(sql);
                stmt.close();
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @param args
     * @throws SQLException
     */

    // Use the below for testing proper functionality of DBUtility.java only

//    public static void main(String[] args) throws SQLException {
//        // You can test the methods you created here
//        DBUtility util = new DBUtility();
//
////        // 1. Create a user
////        util.modifyDB("insert into person (first_name, last_name) values ('test_user_1_fN', 'test_user_1_lN')");
//
////        // 2. Query the database
////        ResultSet res = util.queryDB("select trailid, name, countyid, stateid, mileage,condition_status, " +
////                "difficulty_level, email, website, ST_AsText(geom) as geom from trail");
////        while (res.next()) {
////            System.out.println("Trail Name: " + res.getString("name"));
////            System.out.println("County ID: " + res.getString("countyid"));
////            System.out.println("State ID: " + res.getString("stateid"));
////            System.out.println("Mileage: " + res.getString("mileage"));
////            System.out.println("Condition: " + res.getString("condition_status"));
////            System.out.println("Difficulty: " + res.getString("difficulty_level"));
////            System.out.println("Contact Info: " + res.getString("email"));
////            System.out.println("Website: " + res.getString("website"));
////            System.out.println("geom: " + res.getString("geom"));
////        }
//    }
}