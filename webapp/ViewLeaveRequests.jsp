<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Leave Requests | Hostel Management</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #3498db;
            --success: #28a745;
            --danger: #dc3545;
            --warning: #ffc107;
            --light-gray: #f8f9fa;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            padding: 2rem;
        }
        
        .header {
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #dee2e6;
        }
        
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
        }
        
        .card-header {
            background-color: white;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            font-weight: 600;
            padding: 1.25rem 1.5rem;
        }
        
        .table-responsive {
            border-radius: 8px;
            overflow: hidden;
        }
        
        table {
            margin-bottom: 0;
        }
        
        th {
            background-color: var(--light-gray);
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
            color: #6c757d;
            padding: 1rem 1.5rem;
        }
        
        td {
            padding: 1rem 1.5rem;
            vertical-align: middle;
            border-top: 1px solid #eee;
        }
        
        .status-badge {
            padding: 0.35rem 0.75rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 500;
        }
        
        .pending {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .accepted {
            background-color: #d4edda;
            color: #155724;
        }
        
        .declined {
            background-color: #f8d7da;
            color: #721c24;
        }
        
        .action-link {
            padding: 0.35rem 0.75rem;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.85rem;
            margin: 0 0.25rem;
            transition: all 0.2s;
        }
        
        .accept-link {
            background-color: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }
        
        .accept-link:hover {
            background-color: var(--success);
            color: white;
        }
        
        .decline-link {
            background-color: rgba(220, 53, 69, 0.1);
            color: var(--danger);
        }
        
        .decline-link:hover {
            background-color: var(--danger);
            color: white;
        }
        
        .error-message {
            color: var(--danger);
            padding: 1rem;
            background-color: #f8d7da;
            border-radius: 4px;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2><i class="fas fa-calendar-alt me-2"></i>Leave Requests</h2>
        </div>
        
        <a href="wardenDashboard.jsp" class="logout-btn">
                <i class="fas fa-sign-out-alt me-1"></i> Logout
            </a>
        
        <div class="card">
            <div class="card-header">
                <i class="fas fa-list me-2"></i>All Leave Applications
            </div>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Student Name</th>
                            <th>Room No</th>
                            <th>Leave Period</th>
                            <th>Parent Mobile</th>
                            <th>Student Mobile</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection conn = null;
                            Statement stmt = null;
                            ResultSet rs = null;

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostel_database", "root", "dhanam");
                                stmt = conn.createStatement();
                                rs = stmt.executeQuery("SELECT * FROM leave_applications");

                                while (rs.next()) {
                                    String status = rs.getString("status");
                                    String statusClass = "pending";
                                    if ("Accepted".equalsIgnoreCase(status)) {
                                        statusClass = "accepted";
                                    } else if ("Declined".equalsIgnoreCase(status)) {
                                        statusClass = "declined";
                                    }
                        %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("student_name") %></td>
                            <td><%= rs.getString("room_number") %></td>
                            <td><%= rs.getString("leave_period") %></td>
                            <td><%= rs.getString("parent_mobile") %></td>
                            <td><%= rs.getString("student_mobile") %></td>
                            <td><span class="status-badge <%= statusClass %>"><%= status %></span></td>
                            <td>
                                <a href="UpdateLeaveStatusServlet?id=<%= rs.getInt("id") %>&status=Accepted" class="action-link accept-link">
                                    <i class="fas fa-check me-1"></i>Accept
                                </a>
                                <a href="UpdateLeaveStatusServlet?id=<%= rs.getInt("id") %>&status=Declined" class="action-link decline-link">
                                    <i class="fas fa-times me-1"></i>Decline
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                        %>
                        <tr>
                            <td colspan="8" class="error-message">
                                <i class="fas fa-exclamation-circle me-2"></i>Error: <%= e.getMessage() %>
                            </td>
                        </tr>
                        <%
                            } finally {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>