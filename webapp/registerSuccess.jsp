<%@ page import="java.net.URLEncoder" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Successful | Academic Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --success-color: #00b894;
            --success-light: #55efc4;
            --dark-color: #1a1a2e;
            --light-color: #f8f9fa;
            --gray-dark: #495057;
        }
        
        body {
            background-color: #f5f7fa;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .success-card {
            background: white;
            padding: 2.5rem;
            border-radius: 12px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            text-align: center;
            border-top: 4px solid var(--success-color);
            transition: transform 0.3s ease;
        }
        
        .success-card:hover {
            transform: translateY(-5px);
        }
        
        .success-icon {
            font-size: 3.5rem;
            color: var(--success-color);
            margin-bottom: 1.5rem;
        }
        
        h2 {
            color: var(--dark-color);
            font-weight: 600;
            margin-bottom: 1rem;
        }
        
        .success-message {
            color: var(--gray-dark);
            margin-bottom: 2rem;
            font-size: 1rem;
        }
        
        .details-container {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 1.5rem;
            margin: 1.5rem 0;
            text-align: left;
        }
        
        .detail-item {
            margin-bottom: 1rem;
            display: flex;
        }
        
        .detail-item:last-child {
            margin-bottom: 0;
        }
        
        .detail-label {
            font-weight: 500;
            color: var(--dark-color);
            min-width: 120px;
        }
        
        .detail-value {
            color: var(--gray-dark);
            flex-grow: 1;
        }
        
        .btn-success {
            background-color: var(--success-color);
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }
        
        .btn-success:hover {
            background-color: #009975;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 184, 148, 0.2);
        }
        
        .footer-text {
            margin-top: 1.5rem;
            font-size: 0.85rem;
            color: #adb5bd;
        }
    </style>
</head>
<body>

    <div class="success-card">
        <div class="success-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        
        <h2>Registration Successful!</h2>
        <p class="success-message">Your account has been successfully created. Welcome to our academic portal!</p>
        
        <div class="details-container">
            <div class="detail-item">
                <span class="detail-label">Full Name:</span>
                <span class="detail-value"><%= name %></span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Email Address:</span>
                <span class="detail-value"><%= email %></span>
            </div>
            <div class="detail-item">
                <span class="detail-label">Mobile Number:</span>
                <span class="detail-value"><%= phone %></span>
            </div>
        </div>
        
        <a href="studentLoginForm.jsp" class="btn btn-success">
            <i class="fas fa-sign-in-alt"></i> Proceed to Login
        </a>
        
        <p class="footer-text">
            A verification email has been sent to your registered address.
        </p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>