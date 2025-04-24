<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostel Management System - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-dark: #3a0ca3;
            --light-color: #f8f9fa;
            --dark-color: #212529;
        }
        
        body {
            background-color: #f5f7fa;
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 20px;
        }

        .login-container {
            background: white;
            padding: 2.5rem;
            border-radius: 12px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .login-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .login-header h1 {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            font-size: 2rem;
            line-height: 1.2;
        }

        .login-header h1 span {
            display: block;
            font-weight: 700;
            color: var(--dark-color);
            font-size: 2.5rem;
        }

        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
            display: block;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
        }

        .form-control {
            padding: 0.75rem 1rem;
            border-radius: 8px;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
            font-size: 1rem;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
        }

        .btn-login {
            width: 100%;
            padding: 0.75rem;
            border-radius: 8px;
            background-color: var(--primary-color);
            border: none;
            color: white;
            font-weight: 600;
            font-size: 1rem;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            margin-top: 1.5rem;
            text-transform: uppercase;
        }

        .btn-login:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        .forgot-password {
            text-align: center;
            margin-top: 1.5rem;
        }

        .forgot-password a {
            color: #6c757d;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .forgot-password a:hover {
            color: var(--primary-color);
            text-decoration: underline;
        }

        @media (max-width: 576px) {
            .login-container {
                padding: 2rem 1.5rem;
            }
            
            .login-header h1 {
                font-size: 1.75rem;
            }
            
            .login-header h1 span {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>

    <div class="login-container">
        <div class="login-header">
            <h1>HOSTEL MANAGEMENT<br><span>System</span></h1>
        </div>

        <form action="StudentLoginServlet" method="post">
            <div class="mb-4">
                <label for="username" class="form-label">YOUR USERNAME OR EMAIL</label>
                <input type="text" name="email" class="form-control" id="username" required placeholder="Username">
            </div>
            
            <div class="mb-3">
                <label for="password" class="form-label">PASSWORD</label>
                <input type="password" name="password" class="form-control" id="password" required placeholder="Password">
            </div>
            
            <button type="submit" class="btn btn-login">Login</button>
        </form>

        
    </div>

</body>
</html>