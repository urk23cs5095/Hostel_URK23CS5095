package com.hostelmanagement.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LeaveApplicationServlet")
public class LeaveApplicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/hostel_database";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "dhanam"; // Change if needed

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String student_name = request.getParameter("student_name");
        String room_number = request.getParameter("room_number");
        String leave_period = request.getParameter("leave_period");
        String parent_mobile = request.getParameter("parent_mobile");
        String student_mobile = request.getParameter("student_mobile");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO leave_applications (student_name, room_number, leave_period, parent_mobile, student_mobile) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, student_name);
            stmt.setString(2, room_number);
            stmt.setString(3, leave_period);
            stmt.setString(4, parent_mobile);
            stmt.setString(5, student_mobile);
            
            stmt.executeUpdate();

            stmt.close();
            conn.close();

         // Show popup-style confirmation
            response.setContentType("text/html");
            PrintWriter out1 = response.getWriter();
            out1.println("<script type=\"text/javascript\">");
            out1.println("alert('Leave request sent to your warder!');");
            out1.println("location='leaveApplication.jsp';");
            out1.println("</script>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

