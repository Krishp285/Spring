<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<%@ page import="com.entity.UserEntity" %>
<%
    UserEntity user = (UserEntity) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard | Expense Tracker</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f2f3f7;
        }
        .header {
            background: #343a40;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header .title {
            font-size: 24px;
        }
        .header .logout {
            text-decoration: none;
            color: white;
            background: #dc3545;
            padding: 8px 16px;
            border-radius: 5px;
        }
        .sidebar {
            width: 200px;
            background: #495057;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 60px;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 15px 20px;
            text-decoration: none;
        }
        .sidebar a:hover {
            background: #6c757d;
        }
        .main {
            margin-left: 200px;
            padding: 30px;
        }
        .card {
            background: white;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="header">
    <div class="title">Expense Tracker Dashboard</div>
    <a class="logout" href="logout">Logout</a>
</div>

<div class="sidebar">
    <a href="dashboard.jsp">🏠 Home</a>
    <a href="addexpense">➕ Add Expense</a>
    <a href="viewexpenses">📊 View Reports</a>
    <a href="#">📝 Manage Profile</a>
</div>

<div class="main">
    <div class="card">
        <h2>Welcome, <%= user.getFirstname() %>!</h2>
        <img src="<%= user.getProfilePicPath() %>" class="profile-pic" alt="Profile Picture">
        <p><strong>Email:</strong> <%= user.getEmail() %></p>
        <p><strong>Role:</strong> <%= user.getRole() %></p>
        <p><strong>Gender:</strong> <%= user.getGender() %></p>
    </div>

    <div class="card">
        <h3>🔍 Quick Stats</h3>
        <ul>
            <li>Total Expenses: ₹0 (Connect to DB)</li>
            <li>Monthly Budget: ₹0 (Future Feature)</li>
            <li>Most Spent On: -</li>
        </ul>
    </div>
</div>

</body>
</html>
