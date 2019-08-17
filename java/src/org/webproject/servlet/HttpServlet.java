package org.webproject.servlet;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import org.webproject.servlet.DBUtility;

/**
 * Servlet implementation class HttpServlet
 */

//
@WebServlet("/HttpServlet")
public class HttpServlet extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see javax.servlet.http.HttpServlet#javax.servlet.http.HttpServlet()
     */

    //
    public HttpServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */

    // Do GET function
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */

    // Do POST function
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String tab_id = request.getParameter("tab_id");

        // Query trails
        if (tab_id.equals("0")) {
            try {
                queryTrails(request, response);
            } catch (JSONException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        // Update trail condition
//        else if (tab_id.equals("1")) {
//            System.out.println("Trail Condition Updated!");
//            try {
//                updateConditions((HttpServletResponse) request, response); //changed first parameter request
//            } catch (SQLException | JSONException e) {
//                e.printStackTrace();
//            }
//        }

        // Submit a damage report
<<<<<<< Updated upstream
//        else if (tab_id.equals("2")) {
//            System.out.println("A report is submitted!");
//            try {
//                submitDamageReport((HttpServletResponse) request, response);  //changed first parameter request
//            } catch (SQLException | JSONException e) {
//                e.printStackTrace();
//            }
//        }
    }
=======
        else if (tab_id.equals("2")) {
            System.out.println("A report is submitted!");
            try {
                submitDamageReport((HttpServletResponse) request, response);
            } catch (SQLException | JSONException e) {
                e.printStackTrace();
            }
        }
>>>>>>> Stashed changes

        // query/show damage reports
        else if (tab_id.equals("3")) {
            try {
                queryDamageReports(request, response);
            } catch (JSONException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    // Function to create query trails SQL statement and return list of trails
    private void queryTrails(HttpServletRequest request, HttpServletResponse response) throws
            JSONException, SQLException, IOException {
        JSONArray list = new JSONArray();

        // Query trails based on name, county, state, difficulty, mileage

        // Declare parameters as variables
        String name = request.getParameter("name");
        String county = request.getParameter("county");
        String state = request.getParameter("state");
        String mileage = request.getParameter("mileage");
        String condition = request.getParameter("condition");
        String difficulty = request.getParameter("difficulty");

        // Print to the server log file the query trail parameters --> Used for development/debugging only
        System.out.println("Parameters passed to queryTrails method:");
        System.out.println("    Selected Name: " + name);
        System.out.println("    Selected County: " + county);
        System.out.println("    Selected State: " + state);
        System.out.println("    Selected Mileage: " + mileage);
        System.out.println("    Selected Condition: " + condition);
        System.out.println("    Selected Difficulty: " + difficulty);

        // Root SQL query to return ALL trail records with no filters
        String sql_root =
                "SELECT trail.name, county.name as county, state.name as state, trail.mileage, " +
                        "trail.condition_status, trail.difficulty_level, trail.email, trail.website, " +
                        "ST_Y(geom) as latitude, ST_X(geom) as longitude\n" +
                "FROM trail\n" +
                "INNER JOIN county on trail.countyid = county.cntyid\n" +
                "INNER JOIN state on trail.stateid = state.stateid";

        // Call queryTrailBuilder function
        queryTrailBuilder(sql_root, list, name, county, state, mileage, condition, difficulty);

        response.getWriter().write(list.toString());
    }

    // Function to add where clauses to the query trails SQL statement based on the chosen filters.
    private void queryTrailBuilder(String sql_root, JSONArray list, String name, String county, String state,
                String mileage, String condition, String difficulty) throws SQLException {
        DBUtility dbutil = new DBUtility();
        String sql = "";

        // If no filters are selected
        if (name == null && county == null && state == null && mileage == null && condition == null && difficulty == null) {
            sql = sql_root;
        }

        // If at least one filter is selected
        else {
            // Add WHERE clause root
            sql = sql_root + "\nWHERE ";
            // If name is not null, add name to WHERE clause
            if (name != null) {
                String where_name = "trail.name = '" + name + "'";
                sql += where_name;
            }
            // If county is not null, add county to WHERE clause
            if (county != null) {
                String where_county = "county.name = '" + county + "'";
                if (name != null) {
                    sql += "AND" + where_county;
                }
                else {
                    sql += where_county;
                }
            }
            // If state is not null, add state to WHERE clause
            if (state != null) {
                String where_state = "state.name = '" + state + "'";
                if (name != null || county != null) {
                    sql += "AND" + where_state;
                }
                else {
                    sql += where_state;
                }
            }
            // If mileage is not null, add mileage to WHERE clause
            if (mileage != null) {
                String where_mileage = "trail.mileage " + mileage;
                if (name != null || county != null || state != null) {
                    sql += "AND" + where_mileage;
                }
                else {
                    sql += where_mileage;
                }
            }
            // If condition is not null, add condition to WHERE clause
            if (condition != null) {
                String where_condition = "trail.condition = '" + condition + "'";
                if (name != null || county != null || state != null || mileage != null) {
                    sql += "AND" + where_condition;
                }
                else {
                    sql += where_condition;
                }
            }
            // If difficulty is not null, add difficulty to WHERE clause
            if (difficulty != null) {
                String where_difficulty = "trail.difficulty = '" + difficulty + "'";
                if (name != null || county != null || state != null || mileage != null || condition != null) {
                    sql += "AND" + where_difficulty;
                }
                else {
                    sql += where_difficulty;
                }
            }
        }

        // Get the returned result set as variable "res"
        ResultSet res = dbutil.queryDB(sql);

        // Parse out the "res" result set and put it into the "list" JSON array
        while (res.next()) {
            // Add to response
            HashMap<String, String> m = new HashMap<String, String>();
            m.put("trail_name", res.getString("name"));
            m.put("trail_county", res.getString("county"));
            m.put("trail_state", res.getString("state"));
            m.put("trail_mileage", res.getString("mileage"));
            m.put("trail_condition", res.getString("condition_status"));
            m.put("trail_difficulty", res.getString("difficulty_level"));
            m.put("trail_email", res.getString("email"));
            m.put("trail_website", res.getString("website"));
            m.put("trail_lat", res.getString("latitude"));
            m.put("trail_long", res.getString("longitude"));
            list.put(m);
        }

        // Print out the "list" JSON array in the server console --> Used for development/debugging only
        System.out.println("Records returned from trailmaint database:\n" + list);
    }


    // Function to submit condition reports and update trail conditions
//    private void updateConditions(HttpServletResponse request, HttpServletResponse response) throws
//            JSONException, SQLException, IOException {
//
//        // Add code to create a condition report
//
//        // Add code to update trail condition based on submitted trail condition report
//
//    }


    // Function to submit damage reports
<<<<<<< Updated upstream
//    private void submitDamageReport(HttpServletResponse request, HttpServletResponse response) throws
//            JSONException, SQLException, IOException {
//
//        // Add code to create a damage report
//
//    }
=======
    private void submitDamageReport(HttpServletResponse request, HttpServletResponse response) throws
            JSONException, SQLException, IOException {
        DBUtility dbutil = new DBUtility();
        String sql;

//        // Add code to create a damage report
        // 1. create report
        int report_id = 0;
        String fN = request.getParameter("fN");
        String lN = request.getParameter("lN");
        String damage_date = request.getParameter("damage_date");
        String user_email = request.getParameter("user_email");
        String trail = request.getParameter("trail");
        String message = request.getParameter("message");
        String lon = request.getParameter("longitude");
        String lat = request.getParameter("latitude");
        if (fN != null) {fN = "'" + fN + "'";}
        if (lN != null) {lN = "'" + lN + "'";}
        if (damage_date != null) {damage_date = "'" + damage_date + "'";}
        if (user_email != null) {user_email = "'" + user_email + "'";}


        //record report_id
        ResultSet res_2 = dbutil.queryDB("select last_value from report_id_seq");
        res_2.next();
        report_id = res_2.getInt(1);

        sql = "insert into report (id, first_name, last_name, trail_ID, date_, email, message, report_type, geom," +
                " message) values (" + report_id + "," + fN + "," + lN + "," + trail + "," + damage_date + "," + user_email + "," + message + ","
                + "damage" + ", ST_GeomFromText('POINT(" + lon + " " + lat + ")', 4326)" + ")";
        dbutil.modifyDB(sql);

        // 2. create damage report
        String damage_type = request.getParameter("damage");

        sql = "insert into damage_report (report_num, damage_type) values (" + report_id + "," + damage_type + ")";
        dbutil.modifyDB(sql);


        // response that the report submission is successful
        JSONObject data = new JSONObject();
        try {
            data.put("status", "success");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        response.getWriter().write(data.toString());

    }

    // Function to create query damageReports SQL statement and return list of damage reports
    //NEED TO FINISH //Since we aren't querying from input just a click event do I need this?
    private void queryDamageReports(HttpServletRequest request, HttpServletResponse response) throws
            JSONException, SQLException, IOException {
        JSONArray list = new JSONArray();

        DBUtility dbutil = new DBUtility();

        // sql to find parameters for Damage reports
        String sql =
                "Select report.id, trail.name as trail, date_, report.message, damage_report.damage_type" +
                    "ST_Y(report.geom) as latitude, ST_X(report.geom) as longitude\n" +
                    "FROM report\n" +
                    "INNER JOIN damage_report ON damage_report.report_num = report.id\n" +
                    "INNER JOIN trail ON trail.trailID = report.trail_id\n" +
                    "WHERE report_type = 'damage'";

        // Get the returned result set as variable "res"
        ResultSet res = dbutil.queryDB(sql);

        // Parse out the "res" result set and put it into the "list" JSON array
        while (res.next()) {
            // Add to response
            HashMap<String, String> m = new HashMap<String, String>();
            m.put("report_id", res.getString("id"));
            m.put("trail", res.getString("trail"));
            m.put("date", res.getString("date_"));
            m.put("damage_message", res.getString("message"));
            m.put("damage_type", res.getString("damage_type"));
            m.put("damage_lat", res.getString("latitude"));
            m.put("damage_long", res.getString("longitude"));
            list.put(m);
        }

        // Print out the "list" JSON array in the server console --> Used for development/debugging only
        System.out.println("Records returned from trailmaint database:\n" + list);

    }
>>>>>>> Stashed changes

    public void main() throws JSONException {
    }
}