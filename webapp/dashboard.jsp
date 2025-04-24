<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hostel Management Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --sidebar-bg: #2c3e50;
            --sidebar-active: #3498db;
            --header-bg: #ffffff;
            --card-hover: #f8f9fa;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            height: 100vh;
            position: fixed;
            background-color: var(--sidebar-bg);
            color: white;
            padding: 20px 0;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }
        
        .sidebar-brand {
            padding: 0 20px 20px;
            font-size: 1.5rem;
            font-weight: bold;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 20px;
            text-align: center;
        }
        
        .sidebar-item {
            padding: 12px 25px;
            cursor: pointer;
            transition: all 0.3s;
            border-left: 4px solid transparent;
            display: flex;
            align-items: center;
        }
        
        .sidebar-item i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .sidebar-item:hover {
            background-color: rgba(255,255,255,0.1);
        }
        
        .sidebar-item.active {
            background-color: rgba(255,255,255,0.1);
            border-left: 4px solid var(--sidebar-active);
            font-weight: 500;
        }
        
        /* Main Content Styles */
        .main-content {
            margin-left: 280px;
            padding: 25px;
        }
        
        .header {
            background-color: var(--header-bg);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            margin-bottom: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .dashboard-card {
            transition: all 0.3s;
            cursor: pointer;
            height: 100%;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            background-color: var(--card-hover);
        }
        
        .card-icon {
            font-size: 2rem;
            margin-bottom: 15px;
            color: #3498db;
        }
        
        .section-title {
            font-size: 1.4rem;
            font-weight: 600;
            margin-bottom: 25px;
            color: #2c3e50;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
        }
        
        /* Responsive adjustments */
        @media (max-width: 992px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <div class="sidebar-brand">Hostel Management</div>
        
        <div class="sidebar-item active">
            <i class="fas fa-home"></i> Dashboard
        </div>
        <div class="sidebar-item">
            <i class="fas fa-bed"></i> Room Booking
        </div>
        <div class="sidebar-item">
            <i class="fas fa-calendar-minus"></i> Apply for Leave
        </div>
        
        <div class="sidebar-item">
            <i class="fas fa-tools"></i> Room Maintenance
        </div>
        
    </div>
    
    <!-- Main Content Area -->
    <div class="main-content">
        <div class="header">
            <h4>Student Dashboard</h4>
            <div>
                <span class="me-3"><i class="fas fa-user-circle me-2"></i>Welcome</span>
                <a href="homepage.jsp" class="btn btn-sm btn-outline-danger">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>
        
        <h5 class="section-title">Quick Actions</h5>
        
        <div class="row">
            <div class="col-md-4">
                <div class="card dashboard-card">
                    <div class="card-body text-center">
                        <div class="card-icon">
                            <i class="fas fa-bed"></i>
                        </div>
                        <h5 class="card-title">Room Booking</h5>
                        <p class="card-text">Book your hostel room</p>
                        <a href="roomBooking.jsp" class="btn btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card dashboard-card">
                    <div class="card-body text-center">
                        <div class="card-icon">
                            <i class="fas fa-calendar-minus"></i>
                        </div>
                        <h5 class="card-title">Apply for Leave</h5>
                        <p class="card-text">Submit leave application</p>
                        <a href="leaveApplication.jsp" class="btn btn-primary">Apply Now</a>
                    </div>
                </div>
            </div>
            
            
            
            <div class="col-md-4 mt-4">
                <div class="card dashboard-card">
                    <div class="card-body text-center">
                        <div class="card-icon">
                            <i class="fas fa-tools"></i>
                        </div>
                        <h5 class="card-title">Room Maintenance</h5>
                        <p class="card-text">Request room maintenance</p>
                        <a href="RequestMaintenance.jsp" class="btn btn-primary">Request Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>