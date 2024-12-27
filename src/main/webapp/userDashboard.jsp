<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.example.springboot.model.User"%>
<% 
User user = (User) session.getAttribute("user"); 
if (user == null) { 
    response.sendRedirect("usersessionexpiry"); 
    return; 
} 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--background-light);
            line-height: 1.6;
            color: var(--text-dark);
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        .content {
            flex-grow: 1;
            margin-left: 280px;
            padding: 30px;
        }

        .welcome-card {
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 30px;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <%@ include file="usersidebar.jsp" %>

        <div class="content">
            <div class="welcome-card">
                <h1>Welcome back, ${user.fullName}!</h1>
                <p>This is your dashboard. Use the sidebar to navigate through the options.</p>
            </div>
        </div>
    </div>
</body>
</html>