<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.hostelmanagement.servlets.WardenDashboardServlet.MaintenanceRequest" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Warden Dashboard | Hostel Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #3498db;
            --primary-dark: #2980b9;
            --secondary: #2c3e50;
            --accent: #e74c3c;
            --success: #27ae60;
            --warning: #f39c12;
            --info: #3498db;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --gray: #95a5a6;
            --light-gray: #f8f9fa;
            --border-radius: 8px;
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f5f7fa;
            color: var(--dark);
            min-height: 100vh;
        }
        
        .dashboard-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        /* Header Styles */
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2.5rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .logo-icon {
            width: 48px;
            height: 48px;
            background-color: var(--primary);
            border-radius: var(--border-radius);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
        }
        
        .logo-text h1 {
            font-weight: 600;
            font-size: 1.5rem;
            margin-bottom: 0.25rem;
            color: var(--dark);
        }
        
        .logo-text p {
            color: var(--gray);
            font-size: 0.875rem;
            margin-bottom: 0;
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .user-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background-color: var(--primary-dark);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 500;
            font-size: 1.25rem;
        }
        
        .user-info {
            text-align: right;
        }
        
        .user-info .name {
            font-weight: 500;
            margin-bottom: 0.25rem;
            color: var(--dark);
        }
        
        .user-info .role {
            font-size: 0.875rem;
            color: var(--gray);
        }
        
        .logout-btn {
            color: var(--gray);
            background: none;
            border: none;
            font-size: 1.25rem;
            cursor: pointer;
            transition: color 0.2s;
            margin-left: 1rem;
        }
        
        .logout-btn:hover {
            color: var(--accent);
        }
        
        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2.5rem;
        }
        
        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: var(--border-radius);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
            border-left: 4px solid var(--primary);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .stat-card.students { border-left-color: var(--primary); }
        .stat-card.requests { border-left-color: var(--warning); }
        .stat-card.maintenance { border-left-color: var(--accent); }
        .stat-card.leaves { border-left-color: var(--success); }
        
        .stat-card .icon {
            font-size: 1.75rem;
            margin-bottom: 1rem;
            color: var(--primary);
        }
        
        .stat-card.students .icon { color: var(--primary); }
        .stat-card.requests .icon { color: var(--warning); }
        .stat-card.maintenance .icon { color: var(--accent); }
        .stat-card.leaves .icon { color: var(--success); }
        
        .stat-card .value {
            font-size: 1.75rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
            color: var(--dark);
        }
        
        .stat-card .label {
            font-size: 0.875rem;
            color: var(--gray);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-weight: 500;
        }
        
        /* Main Content Layout */
        .main-section {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 2rem;
            margin-bottom: 2.5rem;
        }
        
        /* Quick Actions */
        .quick-actions {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1rem;
        }
        
        .action-card {
            background: white;
            padding: 1.5rem;
            border-radius: var(--border-radius);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
            transition: all 0.2s;
            display: flex;
            align-items: center;
            gap: 1.25rem;
            text-decoration: none;
            color: inherit;
            border-left: 3px solid transparent;
        }
        
        .action-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border-left-color: var(--primary);
        }
        
        .action-card .icon {
            width: 48px;
            height: 48px;
            border-radius: var(--border-radius);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            color: white;
        }
        
        .action-card.view-students .icon { background-color: var(--primary); }
        .action-card.leave-requests .icon { background-color: var(--warning); }
        .action-card.room-maintenance .icon { background-color: var(--accent); }
        
        .action-card .text h3 {
            font-size: 1rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
            color: var(--dark);
        }
        
        .action-card .text p {
            font-size: 0.875rem;
            color: var(--gray);
            margin-bottom: 0;
        }
        
        .action-card .arrow {
            margin-left: auto;
            color: var(--gray);
            font-size: 0.875rem;
        }
        
        /* Maintenance Table */
        .table-container {
            background: white;
            padding: 1.5rem;
            border-radius: var(--border-radius);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
        }
        
        .table-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }
        
        .table-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--dark);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .table-title i {
            color: var(--primary);
        }
        
        .table-actions {
            display: flex;
            gap: 0.75rem;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        thead {
            background-color: var(--light-gray);
        }
        
        th {
            padding: 0.75rem 1rem;
            text-align: left;
            font-weight: 500;
            font-size: 0.875rem;
            color: var(--gray);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        td {
            padding: 1rem;
            border-bottom: 1px solid #eee;
            font-size: 0.9375rem;
        }
        
        tr:last-child td {
            border-bottom: none;
        }
        
        tr:hover {
            background-color: rgba(52, 152, 219, 0.03);
        }
        
        .status-badge {
            padding: 0.375rem 0.75rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 500;
            display: inline-block;
        }
        
        .pending {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .completed {
            background-color: #d4edda;
            color: #155724;
        }
        
        .btn-action {
            padding: 0.5rem 1rem;
            border-radius: 4px;
            font-size: 0.8125rem;
            font-weight: 500;
            border: none;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .btn-complete {
            background-color: var(--success);
            color: white;
        }
        
        .btn-complete:hover {
            background-color: #219653;
        }
        
        .no-requests {
            text-align: center;
            padding: 2rem;
            color: var(--gray);
            font-size: 0.9375rem;
        }
        
        /* Recent Activity */
        .activity-container {
            background: white;
            padding: 1.5rem;
            border-radius: var(--border-radius);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
        }
        
        .activity-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }
        
        .activity-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--dark);
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .activity-title i {
            color: var(--primary);
        }
        
        .activity-list {
            display: grid;
            gap: 1.25rem;
        }
        
        .activity-item {
            display: flex;
            gap: 1rem;
            padding-bottom: 1.25rem;
            border-bottom: 1px solid #eee;
        }
        
        .activity-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(52, 152, 219, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 1rem;
        }
        
        .activity-content {
            flex: 1;
        }
        
        .activity-content h4 {
            font-size: 0.9375rem;
            font-weight: 500;
            margin-bottom: 0.25rem;
            color: var(--dark);
        }
        
        .activity-content p {
            font-size: 0.8125rem;
            color: var(--gray);
            margin-bottom: 0.25rem;
        }
        
        .activity-time {
            font-size: 0.75rem;
            color: var(--gray);
        }
        
        /* Responsive Design */
        @media (max-width: 1200px) {
            .main-section {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 768px) {
            .dashboard-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1.5rem;
            }
            
            .stats-grid {
                grid-template-columns: 1fr 1fr;
            }
            
            .user-profile {
                width: 100%;
                justify-content: space-between;
            }
        }
        
        @media (max-width: 576px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .dashboard-container {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Dashboard Header -->
        <header class="dashboard-header">
            <div class="logo">
                <div class="logo-icon">
                    <i class="fas fa-user-shield"></i>
                </div>
                <div class="logo-text">
                    <h1>Hostel Management System</h1>
                    <p>Warden Dashboard</p>
                </div>
            </div>
            
            <div class="user-profile">
                <div class="user-avatar">W</div>
                <div class="user-info">
                    <p class="name">Warden</p>
                    <p class="role">Administrator</p>
                </div>
                <button class="logout-btn" onclick="window.location.href='homepage.jsp'" title="Logout">
                    <i class="fas fa-sign-out-alt"></i>
                </button>
            </div>
        </header>
        
        <!-- Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card students">
                <div class="icon">
                    <i class="fas fa-users"></i>
                </div>
                <div class="value">142</div>
                <div class="label">Total Students</div>
            </div>
            
            <div class="stat-card requests">
                <div class="icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="value">3</div>
                <div class="label">Pending Leaves</div>
            </div>
            
            <div class="stat-card maintenance">
                <div class="icon">
                    <i class="fas fa-tools"></i>
                </div>
                <div class="value">14</div>
                <div class="label">Maintenance Requests</div>
            </div>
            
            <div class="stat-card leaves">
                <div class="icon">
                    <i class="fas fa-calendar-minus"></i>
                </div>
                <div class="value">23</div>
                <div class="label">Approved Leaves</div>
            </div>
        </div>
        
        <!-- Main Content Section -->
        <div class="main-section">
            <!-- Quick Actions -->
            <div class="quick-actions">
                <a href="ViewStudentsServlet" class="action-card view-students">
                    <div class="icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="text">
                        <h3>View Students</h3>
                        <p>Manage all hostel students</p>
                    </div>
                    <div class="arrow">
                        <i class="fas fa-chevron-right"></i>
                    </div>
                </a>
                
                <a href="ViewLeaveRequests.jsp" class="action-card leave-requests">
                    <div class="icon">
                        <i class="fas fa-calendar-minus"></i>
                    </div>
                    <div class="text">
                        <h3>Leave Requests</h3>
                        <p>Approve or reject leave applications</p>
                    </div>
                    <div class="arrow">
                        <i class="fas fa-chevron-right"></i>
                    </div>
                </a>
                
                <a href="WardenDashboardServlet" class="action-card room-maintenance">
                    <div class="icon">
                        <i class="fas fa-tools"></i>
                    </div>
                    <div class="text">
                        <h3>Room Maintenance</h3>
                        <p>Handle maintenance requests</p>
                    </div>
                    <div class="arrow">
                        <i class="fas fa-chevron-right"></i>
                    </div>
                </a>
            </div>
            
            <!-- Maintenance Table -->
            <div class="table-container">
                <div class="table-header">
                    <h2 class="table-title">
                        <i class="fas fa-tools"></i>
                        <span>Maintenance Requests</span>
                    </h2>
                    
                    
                </div>
                
                <div class="table-responsive">
                    <table>
                        <thead>
                            <tr>
                                <th>Room No.</th>
                                <th>Issue Description</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<MaintenanceRequest> maintenanceRequests =
                                    (List<MaintenanceRequest>) request.getAttribute("maintenanceRequests");
                            
                                if (maintenanceRequests != null && !maintenanceRequests.isEmpty()) {
                                    for (MaintenanceRequest m : maintenanceRequests) {
                            %>
                                        <tr>
                                            <td><%= m.getRoomNo() %></td>
                                            <td><%= m.getIssueDescription() %></td>
                                            <td>
                                                <span class="status-badge <%= "Accepted".equalsIgnoreCase(m.getStatus()) ? "completed" : "pending" %>">
                                                    <%= m.getStatus() %>
                                                </span>
                                            </td>
                                            <td>
                                                <% if ("Accepted".equalsIgnoreCase(m.getStatus())) { %>
                                                    <span class="text-success fw-bold">Completed</span>
                                                <% } else { %>
                                                    <button onclick="window.location.href='WardenDashboardServlet?request_id=<%= m.getId() %>&status=Accepted'" 
                                                       class="btn-action btn-complete">
                                                        <i class="fas fa-check-circle me-1"></i> Complete
                                                    </button>
                                                <% } %>
                                            </td>
                                        </tr>
                            <%
                                    }
                                } else {
                            %>
                               
             
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <!-- Recent Activity Section -->
        <div class="activity-container">
            <div class="activity-header">
                <h2 class="activity-title">
                    <i class="fas fa-bell"></i>
                    <span>Recent Activity</span>
                </h2>
                <button class="btn-action" style="background-color: #f8f9fa; color: var(--dark);">                    
                </button>
            </div>          
            <div class="activity-list">
                <div class="activity-item">
                    <div class="activity-icon">
                        <i class="fas fa-tools"></i>
                    </div>
                    <div class="activity-content">
                        <h4>New maintenance request</h4>
                        <p>Room 205 reported a plumbing issue</p>
                        <div class="activity-time">10 minutes ago</div>
                    </div>
                </div>                
                <div class="activity-item">
                    <div class="activity-icon" style="color: var(--success);">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <div class="activity-content">
                        <h4>Leave request approved</h4>
                        <p>Approved leave for student ID 1042</p>
                        <div class="activity-time">1 hour ago</div>
                    </div>
                </div>               
                <div class="activity-item">
                    <div class="activity-icon" style="color: var(--accent);">
                        <i class="fas fa-calendar-times"></i>
                    </div>
                    <div class="activity-content">
                        <h4>Leave request rejected</h4>
                        <p>Rejected leave for student ID 1038</p>
                        <div class="activity-time">2 hours ago</div>
                    </div>
                </div>                
                <div class="activity-item">
                    <div class="activity-icon" style="color: var(--primary);">
                        <i class="fas fa-user-plus"></i>
                    </div>
                    <div class="activity-content">
                        <h4>New student registered</h4>
                        <p>Student ID 1056 assigned to Room 312</p>
                        <div class="activity-time">5 hours ago</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Professional subtle animations
        document.addEventListener('DOMContentLoaded', function() {
            // Animate stats cards sequentially
            const statCards = document.querySelectorAll('.stat-card');
            statCards.forEach((card, index) => {
                setTimeout(() => {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
                
                card.style.opacity = '0';
                card.style.transform = 'translateY(10px)';
                card.style.transition = 'all 0.4s ease ' + (index * 0.1) + 's';
            });            
            const actionCards = document.querySelectorAll('.action-card');
            actionCards.forEach(card => {
                card.addEventListener('mouseenter', () => {
                    const arrow = card.querySelector('.arrow');
                    arrow.style.transform = 'translateX(3px)';
                });                
                card.addEventListener('mouseleave', () => {
                    const arrow = card.querySelector('.arrow');
                    arrow.style.transform = 'translateX(0)';
                });
            });
        });
    </script>
</body>
</html>