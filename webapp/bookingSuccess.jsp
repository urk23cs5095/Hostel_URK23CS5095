
<%@ page import="java.net.URLEncoder" %>
<%
    String name = request.getParameter("name");
    String roomNo = request.getParameter("roomNo");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Room Booking Successful</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-success-subtle">
    <div class="container mt-5">
        <div class="card shadow p-4">
            <h2 class="text-success text-center">Room Booking Successful!</h2>
            <hr>
            <p><strong>Name:</strong> <%= name %></p>
            <p><strong>Room Number:</strong> <%= roomNo %></p>

            <div class="text-center mt-4">
                <a href="dashboard.jsp" class="btn btn-primary">Go to DashBoard</a>
            </div>
        </div>
    </div>
</body>
</html>


