package com.hostelmanagement.servlets;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WardenDashboardServlet")
public class WardenDashboardServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String requestIdStr = request.getParameter("request_id");
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel_database", "root", "dhanam");

            // ✅ If 'Mark as Completed' was clicked
            if (requestIdStr != null && status != null) {
                int request_id = Integer.parseInt(requestIdStr);
                String updateSql = "UPDATE maintenance_requests SET status=? WHERE request_id=?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                updateStmt.setString(1, status);
                updateStmt.setInt(2, request_id);
                updateStmt.executeUpdate();
                updateStmt.close();
            }

            // ✅ Fetch updated list
            String fetchSql = "SELECT * FROM maintenance_requests";
            PreparedStatement stmt = conn.prepareStatement(fetchSql);
            ResultSet rs = stmt.executeQuery();

            List<MaintenanceRequest> maintenanceRequests = new ArrayList<>();
            while (rs.next()) {
                MaintenanceRequest req = new MaintenanceRequest();
                req.setId(rs.getInt("request_id"));
                req.setStudentName(rs.getString("student_name"));
                req.setRoomNo(rs.getString("room_number"));
                req.setIssueDescription(rs.getString("issue_description"));
                req.setStatus(rs.getString("status"));
                maintenanceRequests.add(req);
            }

            request.setAttribute("maintenanceRequests", maintenanceRequests);

            rs.close();
            stmt.close();
            conn.close();

            RequestDispatcher rd = request.getRequestDispatcher("wardenDashboard.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public class MaintenanceRequest {
        private int id;
        private String studentName;
        private String roomNo;
        private String issueDescription;
        private String status;

        // Getters and Setters
        public int getId() { return id; }
        public void setId(int id) { this.id = id; }

        public String getStudentName() { return studentName; }
        public void setStudentName(String studentName) { this.studentName = studentName; }

        public String getRoomNo() { return roomNo; }
        public void setRoomNo(String roomNo) { this.roomNo = roomNo; }

        public String getIssueDescription() { return issueDescription; }
        public void setIssueDescription(String issueDescription) { this.issueDescription = issueDescription; }

        public String getStatus() { return status; }
        public void setStatus(String status) { this.status = status; }
    }
}
