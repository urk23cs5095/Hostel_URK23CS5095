<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostel Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3a5a78;  /* Muted blue for hostel feel */
            --primary-dark: #2c4361;
            --secondary-color: #6b9080;  /* Natural green accent */
            --secondary-dark: #4a6b5f;
            --accent-color: #e6b89c;    /* Warm wood tone */
            --dark-color: #2d3436;
            --light-color: #f5f6f7;
            --border-radius: 8px;
        }
        
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1920&q=80') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(45, 52, 54, 0.7);
            z-index: 0;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            padding: 20px;
            position: relative;
            z-index: 1;
        }

        .card {
            background-color: #ffffff;
            color: var(--dark-color);
            padding: 2.5rem;
            border-radius: var(--border-radius);
            width: 100%;
            max-width: 450px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: all 0.3s ease;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .card-header {
            margin-bottom: 2rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            padding-bottom: 1.5rem;
        }

        .logo {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }

        .card-title {
            font-weight: 600;
            font-size: 1.75rem;
            margin-bottom: 0.5rem;
            color: var(--primary-color);
        }

        .card-subtitle {
            font-weight: 400;
            color: #6b7280;
            margin-bottom: 0;
            font-size: 1rem;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border-radius: var(--border-radius);
            margin: 12px 0;
            letter-spacing: 0.5px;
            font-weight: 500;
            border: none;
            color: white;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: 1px solid var(--primary-dark);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: var(--secondary-color);
            border: 1px solid var(--secondary-dark);
        }

        .btn-secondary:hover {
            background-color: var(--secondary-dark);
            transform: translateY(-2px);
        }

        .footer {
            margin-top: 2rem;
            font-size: 0.85rem;
            color: #6b7280;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            padding-top: 1.5rem;
        }

        .footer a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        @media (max-width: 576px) {
            .card {
                padding: 2rem 1.5rem;
            }
            
            .card-title {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="card">
            <div class="card-header">
                <div class="logo">
                    <i class="fas fa-building"></i>
                </div>
                <h2 class="card-title">HOSTEL MANAGEMENT SYSTEM</h2>
                <p class="card-subtitle">Student Accommodation Portal</p>
            </div>
            
            <a href="studentLogin.jsp" class="btn-login btn-primary">
                <i class="fas fa-user-graduate"></i> Student Login
            </a>
            
            <a href="adminLogin.jsp" class="btn-login btn-secondary">
                <i class="fas fa-user-shield"></i> Warden Login
            </a>
            
            <div class="footer">
                <p>University of Technology • <a href="#">Help Desk</a></p>
                <p>© 2023 All Rights Reserved</p>
            </div>
        </div>
    </div>
</body>
</html>