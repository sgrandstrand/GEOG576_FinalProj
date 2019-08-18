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
        else if (tab_id.equals("1")) {
            try {
                updateConditions(request, response);
                System.out.println("Trail condition updated!");
            } catch (SQLException | JSONException e) {
                e.printStackTrace();
            }
        }

        // Submit a damage report
        else if (tab_id.equals("2")) {
            try {
                submitDamageReport(request, response);
                System.out.println("A damage report is submitted!");
            } catch (SQLException | JSONException e) {
                e.printStackTrace();
            }
        }

        // Query damage reports
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
                        "ST_Y(geom) as latitude, ST_X(geom) as longitude, trail.last_condition_update\n" +
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
                    sql += "AND " + where_county;
                }
                else {
                    sql += where_county;
                }
            }
            // If state is not null, add state to WHERE clause
            if (state != null) {
                String where_state = "state.name = '" + state + "'";
                if (name != null || county != null) {
                    sql += "AND " + where_state;
                }
                else {
                    sql += where_state;
                }
            }
            // If mileage is not null, add mileage to WHERE clause
            if (mileage != null) {
                String where_mileage = "trail.mileage " + mileage;
                if (name != null || county != null || state != null) {
                    sql += "AND " + where_mileage;
                }
                else {
                    sql += where_mileage;
                }
            }
            // If condition is not null, add condition to WHERE clause
            if (condition != null) {
                String where_condition = "trail.condition_status = '" + condition + "'";
                if (name != null || county != null || state != null || mileage != null) {
                    sql += "AND " + where_condition;
                }
                else {
                    sql += where_condition;
                }
            }
            // If difficulty is not null, add difficulty to WHERE clause
            if (difficulty != null) {
                String where_difficulty = "trail.difficulty_level = '" + difficulty + "'";
                if (name != null || county != null || state != null || mileage != null || condition != null) {
                    sql += "AND " + where_difficulty;
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
            m.put("trail_last_condition_update", res.getString("last_condition_update"));
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
    private void updateConditions(HttpServletRequest request, HttpServletResponse response) throws
            JSONException, SQLException, IOException {
        DBUtility dbutil = new DBUtility();

        // Code to create a condition report and update the trail status

        // Declare parameters as variables
        String trail_id = request.getParameter("trail_id");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String date = request.getParameter("date");
        String email = request.getParameter("email");
        String condition = request.getParameter("condition");
        String message = request.getParameter("message");

        // Print to the server log file the query trail parameters --> Used for development/debugging only
        System.out.println("Parameters passed to updateConditions method:");
        System.out.println("    Selected Trail ID: " + trail_id);
        System.out.println("    Selected First Name: " + first_name);
        System.out.println("    Selected Last name: " + last_name);
        System.out.println("    Selected Date: " + date);
        System.out.println("    Selected Email: " + email);
        System.out.println("    Selected Condition: " + condition);
        System.out.println("    Selected Message: " + message);

        // Add code to create trail condition report
        String sql_update_trail_and_report =
                "UPDATE trail SET condition_status = '" + condition + "', last_condition_update = '" + date +
                        "' WHERE trailid = " + trail_id + ";\n" +
                "INSERT INTO report (trail_id, first_name, last_name, date_, email, message, report_type)\n" +
                "VALUES (" + trail_id + ", '" + first_name + "', '" + last_name + "', '" + date + "', '" + email +
                        "', '" + message + "', 'status'); ";
        dbutil.modifyDB(sql_update_trail_and_report);

        // Record report_id
        ResultSet res_1 = dbutil.queryDB("SELECT last_value FROM report_id_seq");
        res_1.next();
        Integer report_num  = res_1.getInt(1);

        // Print out the report number returned in the server console --> Used for development/debugging only
        System.out.println("Report number returned from trailmaint database:\n" + report_num);

        // Add code to update trail condition based on submitted trail condition report
        String sql_update_status =
                "INSERT INTO status_report (report_num, condition_type)\n" +
                "VALUES (" + report_num + ", '" + condition + "');";
        dbutil.modifyDB(sql_update_status);

        // Response that the report submission is successful
        JSONObject data = new JSONObject();
        try {
            data.put("status", "success");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        response.getWriter().write(data.toString());
    }


    // Function to submit damage reports
    private void submitDamageReport(HttpServletRequest request, HttpServletResponse response) throws
            JSONException, SQLException, IOException {
        DBUtility dbutil = new DBUtility();

        // Code to create a damage report

        // 1. create report
        String trail = request.getParameter("trail");
        String fN = request.getParameter("fN");
        String lN = request.getParameter("lN");
        String damage_date = request.getParameter("damage_date");
        String user_email = request.getParameter("user_email");
        String damage_type = request.getParameter("damage_type");
        String message = request.getParameter("message");
        String lon = request.getParameter("longitude");
        String lat = request.getParameter("latitude");
        if (fN != null) {fN = "'" + fN + "'";}
        if (lN != null) {lN = "'" + lN + "'";}
        if (damage_date != null) {damage_date = "'" + damage_date + "'";}
        if (user_email != null) {user_email = "'" + user_email + "'";}

        // Print to the server log file the query trail parameters --> Used for development/debugging only
        System.out.println("Parameters passed to submitDamageReport method:");
        System.out.println("    Selected Trail: " + trail);
        System.out.println("    Selected First Name: " + fN);
        System.out.println("    Selected Last name: " + lN);
        System.out.println("    Selected Date: " + damage_date);
        System.out.println("    Selected Email: " + user_email);
        System.out.println("    Selected Damage Type: " + damage_type);
        System.out.println("    Selected Message: " + message);
        System.out.println("    Selected Longitude: " + lon);
        System.out.println("    Selected Latitude: " + lat);

        // SQL statement to insert into report table
        String sql_report =
                "INSERT INTO report (trail_ID, first_name, last_name, date_, email, message, report_type, geom)\n" +
                "VALUES (" + trail + "," + fN + "," + lN + "," + damage_date + "," + user_email + ",' " + message +
                        "'," + "'damage'" + ", ST_GeomFromText('POINT(" + lon + " " + lat + ")', " +
                        "4326)" + ")";
        dbutil.modifyDB(sql_report);

        // Record report_id
        ResultSet res_2 = dbutil.queryDB("SELECT last_value FROM report_id_seq");
        res_2.next();
        Integer report_id  = res_2.getInt(1);

        // Print out the report number returned in the server console --> Used for development/debugging only
        System.out.println("Report number returned from trailmaint database:\n" + report_id);

        // 2. create damage report
        // SQL statement to insert into damage_report table
        String sql_damage_report =
                "INSERT INTO damage_report (report_num, damage_type)\n" +
                "VALUES (" + report_id + ", '" + damage_type + "')";
        dbutil.modifyDB(sql_damage_report);

        // Response that the report submission is successful
        JSONObject data = new JSONObject();
        try {
            data.put("status", "success");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        response.getWriter().write(data.toString());
    }

    // Function to create query damageReports SQL statement and return list of damage reports
    private void queryDamageReports(HttpServletRequest request, HttpServletResponse response) throws
            JSONException, SQLException, IOException {
        JSONArray list = new JSONArray();

        DBUtility dbutil = new DBUtility();

        // SQL to find parameters for Damage reports
        String sql =
                "SELECT report.id, trail.name as trail, date_, report.message, damage_report.damage_type, " +
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
            m.put("damage_report_id", res.getString("id"));
            m.put("damage_trail", res.getString("trail"));
            m.put("damage_date", res.getString("date_"));
            m.put("damage_message", res.getString("message"));
            m.put("damage_type", res.getString("damage_type"));
            m.put("damage_lat", res.getString("latitude"));
            m.put("damage_long", res.getString("longitude"));
            list.put(m);
        }

        // Print out the "list" JSON array in the server console --> Used for development/debugging only
        System.out.println("Records returned from trailmaint database:\n" + list);

        response.getWriter().write(list.toString());
    }

    public void main() throws JSONException {
    }
}