package com.hostelmanagement.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookingRoom")
public class BookingRoom extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/hostel_database";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "dhanam"; // Change if needed

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String roomType = request.getParameter("roomType");
        String roomCapacity = request.getParameter("roomCapacity");
        String roomNo = request.getParameter("roomNo");

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);

            // Check if the room is already booked
            String checkRoomAvailabilitySQL = "SELECT * FROM room_booking WHERE roomNo = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkRoomAvailabilitySQL);
            checkStmt.setString(1, roomNo);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // If room is already booked, show pop and go back to form
                out.println("<script type='text/javascript'>");
                out.println("alert('Sorry, the room " + roomNo + " is already booked.');");
                out.println("history.back();");  // Takes user back to the form
                out.println("</script>");
            } else {
                // Room is available, proceed with booking
                String sql = "INSERT INTO room_booking (name, roomType, roomCapacity, roomNo) VALUES (?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, name);
                stmt.setString(2, roomType);
                stmt.setString(3, roomCapacity);
                stmt.setString(4, roomNo);
                stmt.executeUpdate();

                // Close the statement
                stmt.close();

                // Redirect to success page
                response.sendRedirect("bookingSuccess.jsp?name=" + name + "&roomNo=" + roomNo);
            }

            // Close connections
            rs.close();
            checkStmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Booking Database Error: " + e.getMessage() + "</h3>");
        }
    }
}
