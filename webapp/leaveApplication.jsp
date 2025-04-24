<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-gray: #f8f9fa;
            --dark-gray: #6c757d;
        }
        
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: #f5f7ff;
            color: #2b2d42;
        }
        
        .leave-container {
            max-width: 700px;
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.08);
            position: relative;
        }
        
        .leave-header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }
        
        .leave-header h2 {
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .leave-header p {
            color: var(--dark-gray);
        }
        
        .form-label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #495057;
        }
        
        .form-control {
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid #dee2e6;
            transition: all 0.3s;
            margin-bottom: 15px;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }
        
        textarea.form-control {
            min-height: 150px;
        }
        
        .btn-submit {
            background-color: var(--primary-color);
            border: none;
            padding: 12px 25px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            width: 100%;
            margin-top: 10px;
        }
        
        .btn-submit:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }
        
        .input-group-text {
            background-color: var(--light-gray);
        }
        
        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            padding: 5px 15px;
            border-radius: 5px;
            color: #dc3545;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .logout-btn:hover {
            background-color: #dc3545;
            color: white;
            text-decoration: none;
        }
        
        @media (max-width: 768px) {
            .leave-container {
                margin: 20px;
                padding: 20px;
            }
            
            .logout-btn {
                position: static;
                display: block;
                margin-bottom: 20px;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="leave-container">
            <!-- Logout Button -->
            <a href="dashboard.jsp" class="logout-btn">
                <i class="fas fa-sign-out-alt me-1"></i> Logout
            </a>
            
            <div class="leave-header">
                <h2><i class="fas fa-calendar-alt me-2"></i>Leave Application Form</h2>
                <p>Please fill out this form to request leave from the hostel</p>
            </div>
            
            <form action="LeaveApplicationServlet" method="post">
                <div class="form-group">
                    <label for="student_name" class="form-label">Student Name</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <input type="text" class="form-control" id="student_name" name="student_name" placeholder="Enter your full name" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="room_number" class="form-label">Room Number</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-door-open"></i></span>
                        <input type="text" class="form-control" id="room_number" name="room_number" placeholder="Enter your room number" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="leave_period" class="form-label">Period of Leave</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-calendar-day"></i></span>
                        <input type="text" class="form-control" id="leave_period" name="leave_period" placeholder="e.g., 10-Apr to 15-Apr" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="parent_mobile" class="form-label">Parent's Mobile Number</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                        <input type="tel" class="form-control" id="parent_mobile" name="parent_mobile" placeholder="Enter parent's mobile number" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="student_mobile" class="form-label">Your Mobile Number</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
                        <input type="tel" class="form-control" id="student_mobile" name="student_mobile" placeholder="Enter your mobile number" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="reason" class="form-label">Reason for Leave (Optional)</label>
                    <textarea class="form-control" id="reason" name="reason" rows="3" placeholder="Briefly mention the reason for leave"></textarea>
                </div>
                
                <button type="submit" class="btn btn-primary btn-submit">
                    <i class="fas fa-paper-plane me-2"></i>Submit Leave Request
                </button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Improved validation for leave period format
        document.querySelector('form').addEventListener('submit', function(e) {
            const leavePeriod = document.getElementById('leave_period').value;
            
            // Accepts both formats:
            // 1. "10-Apr to 15-Apr" (short month)
            // 2. "10-april to 15 april" (full month)
            const pattern1 = /^\d{1,2}-[A-Za-z]{3} to \d{1,2}-[A-Za-z]{3}$/; // DD-Mon to DD-Mon
            const pattern2 = /^\d{1,2}-[A-Za-z]+ to \d{1,2}-[A-Za-z]+$/; // DD-Month to DD-Month
            
            if (!pattern1.test(leavePeriod) && !pattern2.test(leavePeriod)) {
                alert('Please enter leave period in format: DD-MMM to DD-MMM (e.g., 10-Apr to 15-Apr or 10-april to 15-april)');
                e.preventDefault();
            }
        });
    </script>
</body>
</html>