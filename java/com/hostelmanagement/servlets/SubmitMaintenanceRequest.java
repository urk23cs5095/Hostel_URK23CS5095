package com.hostelmanagement.servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SubmitMaintenanceRequest")
public class SubmitMaintenanceRequest extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String student_name = request.getParameter("student_name");
        String room_number = request.getParameter("room_number");
        String issue_description = request.getParameter("issue_description");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel_database", "root", "dhanam");

            String sql = "INSERT INTO maintenance_requests (student_name, room_number, issue_description) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, student_name);
            stmt.setString(2, room_number);
            stmt.setString(3, issue_description);

            stmt.executeUpdate();

            // Show alert and stay on the same page
            response.setContentType("text/html");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('Maintenance request submitted successfully!');");
            response.getWriter().println("window.location = 'RequestMaintenance.jsp';");
            response.getWriter().println("</script>");

            stmt.close();
            conn.close();

        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
