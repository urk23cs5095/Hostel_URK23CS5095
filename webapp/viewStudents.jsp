<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.String" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
        }
        h2 {
            text-align: center;
            margin-top: 30px;
        }
        table {
            margin: 30px auto;
            border-collapse: collapse;
            width: 80%;
            background-color: white;
            box-shadow: 0px 0px 10px #ccc;
        }
        th, td {
            padding: 12px 18px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

    <h2>All Registered Students with Room Info</h2>

    <%
        ArrayList<String[]> students = (ArrayList<String[]>) request.getAttribute("students");
        if (students == null || students.isEmpty()) {
    %>
        <p style="text-align:center;">No students found.</p>
    <%
        } else {
    %>
    <table>
        <tr>
            <th>name</th>
            <th>email</th>
            <th>roomNo</th>
            <th>phone</th>
        </tr>
        <% for (String[] student : students) { %>
        <tr>
            <td><%= student[0] %></td>
            <td><%= student[1] %></td>
            <td><%= student[2] %></td>
            <td><%= student[3] %></td>
        </tr>
        <% } %>
    </table>
    <%
        }
    %>

</body>
</html>
