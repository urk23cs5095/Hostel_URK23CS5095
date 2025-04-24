<%@ page import="java.sql.*" %>
<html>
<head><title>Leave Requests</title></head>
<body>
    <h2>Leave Requests</h2>
    <table border="1">
        <tr>
            <th>Request ID</th>
            <th>Student Name</th>
            <th>Room Number</th>
            <th>Issue Description</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel_database", "root", "dhanam");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM maintenance_requests");

        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("request_id") %></td>
            <td><%= rs.getString("student_name") %></td>
            <td><%= rs.getString("room_number") %></td>
            <td><%= rs.getString("issue_description") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <a href="WardenDashboardServlet?request_id=<%= rs.getInt("request_id") %>&status=Accepted">Mark as completed</a> |
            </td>
        </tr>
<%
        }
    } catch (Exception e) {
        out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
    </table>
</body>
</html>
