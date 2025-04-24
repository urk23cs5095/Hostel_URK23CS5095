<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Request Room Maintenance</title>
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
        
        .maintenance-container {
            max-width: 700px;
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.08);
            position: relative;
        }
        
        .maintenance-header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }
        
        .maintenance-header h2 {
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .maintenance-header p {
            color: var(--dark-gray);
        }
        
        .form-label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #495057;
        }
        
        .form-control, .form-select {
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid #dee2e6;
            transition: all 0.3s;
            margin-bottom: 15px;
        }
        
        .form-control:focus, .form-select:focus {
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
        
        .issue-categories {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .category-btn {
            border: 1px solid #dee2e6;
            background: white;
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .category-btn:hover, .category-btn.active {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }
        
        @media (max-width: 768px) {
            .maintenance-container {
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
        <div class="maintenance-container">
            <!-- Logout Button -->
            <a href="dashboard.jsp" class="logout-btn">
                <i class="fas fa-sign-out-alt me-1"></i> Logout
            </a>
            
            <div class="maintenance-header">
                <h2><i class="fas fa-tools me-2"></i>Request Room Maintenance</h2>
                <p>Report any issues with your hostel room for quick resolution</p>
            </div>
            
            <form action="SubmitMaintenanceRequest" method="post">
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
                    <label class="form-label">Issue Category (Optional)</label>
                    <div class="issue-categories">
                        <div class="category-btn" data-category="Electrical">Electrical</div>
                        <div class="category-btn" data-category="Plumbing">Plumbing</div>
                        <div class="category-btn" data-category="Furniture">Furniture</div>
                        <div class="category-btn" data-category="HVAC">HVAC</div>
                        <div class="category-btn" data-category="Other">Other</div>
                    </div>
                    <input type="hidden" id="issue_category" name="issue_category">
                </div>
                
                <div class="form-group">
                    <label for="issue_description" class="form-label">Issue Description</label>
                    <textarea class="form-control" id="issue_description" name="issue_description" placeholder="Please describe the issue in detail..." required></textarea>
                </div>
                
                <div class="form-group">
                    <label for="urgency" class="form-label">Urgency Level</label>
                    <select class="form-select" id="urgency" name="urgency">
                        <option value="Normal">Normal</option>
                        <option value="High">High (Affects daily activities)</option>
                        <option value="Emergency">Emergency (Immediate attention needed)</option>
                    </select>
                </div>
                
                <button type="submit" class="btn btn-primary btn-submit">
                    <i class="fas fa-paper-plane me-2"></i>Submit Maintenance Request
                </button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Handle category selection
        document.querySelectorAll('.category-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                document.querySelectorAll('.category-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                document.getElementById('issue_category').value = this.getAttribute('data-category');
            });
        });
        
        // Set default category to 'Other'
        document.getElementById('issue_category').value = 'Other';
    </script>
</body>
</html>