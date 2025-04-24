package com.hostelmanagement.servlets;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewStudentsServlet")
public class ViewStudentsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<String[]> students = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hostel_database", "root", "dhanam");

            String query = "SELECT s.name, s.email, rb.roomNo, s.phone " +
                           "FROM students s " +
                           "JOIN room_booking rb ON s.email = email";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                students.add(new String[] {
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("roomNo"),
                    rs.getString("phone")
                });
            }

            request.setAttribute("students", students);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewStudents.jsp");
            dispatcher.forward(request, response);

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            response.getWriter().println("DB Error: " + e.getMessage());
        }
    }
}
