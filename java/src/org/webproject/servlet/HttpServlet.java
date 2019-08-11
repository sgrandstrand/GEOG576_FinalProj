package org.webproject.servlet;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import org.webproject.servlet.DBUtility;

/**
 * Servlet implementation class HttpServlet
 */

@WebServlet("/HttpServlet")
public class HttpServlet extends javax.servlet.http.HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see javax.servlet.http.HttpServlet#javax.servlet.http.HttpServlet()
     */
    public HttpServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */

    // Do GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */

    // Do POST
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
            System.out.println("Trail Condition Updated!");
            try {
                updateConditions(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Submit a damage report
        else if (tab_id.equals("2")) {
            System.out.println("A report is submitted!");
            try {
                submitDamageReport(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Function to query trails
    private void queryTrails(HttpServletResponse request, HttpServletResponse response) throws
            JSONException, SQLException, IOException {

        // Add code to query trails based on name, county, state, difficulty, mileage

    }

    // Function to submit condition reports and update trail conditions
    private void updateConditions(HttpServletResponse request, HttpServletResponse response) throws
            JSONException, SQLException, IOException {

        // Add code to create a condition report

        // Add code to update trail condition based on submitted trail condition report

    }

    // Function to submit damage reports
    private void submitDamageReport(HttpServletResponse request, HttpServletResponse response) throws
            JSONException, SQLException, IOException {

        // Add code to create a damage report

    }

    public void main() throws JSONException {
    }
}