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
    <title>User Achievements Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --gradient-primary: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            --gradient-secondary: linear-gradient(135deg, #16c79a 0%, #14b38a 100%);
            --background-color: #eef2f7;
            --card-bg: #ffffff;
            --text-primary: #1f2937;
            --text-secondary: #6b7280;
            --border-radius: 16px;
            --box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            color: var(--text-primary);
            line-height: 1.8;
            margin: 0;
        }

        .main-wrapper {
            display: flex;
            min-height: 100vh;
            background: var(--background-color);
        }

        .content {
            flex-grow: 1;
            padding: 50px;
        }

        .content h2 {
            margin-bottom: 40px;
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 700;
            font-size: 2.5rem;
            text-align: center;
        }

        .achievements-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 30px;
        }

        .card {
            background: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 25px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .card img {
            max-width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 12px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .card:hover img {
            transform: scale(1.1);
        }

        .card h3 {
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 10px;
            font-weight: 600;
            font-size: 1.3rem;
        }

        .card p {
            color: var(--text-secondary);
            margin-bottom: 10px;
            font-weight: 300;
        }

        .status {
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 15px;
            display: inline-block;
            padding: 6px 15px;
            border-radius: 20px;
            font-size: 0.8rem;
        }

        .status.approved {
            background: rgba(22, 199, 154, 0.1);
            color: #16c79a;
        }

        .status.pending {
            background: rgba(255, 165, 0, 0.1);
            color: #ffa500;
        }

        .update-btn {
            display: inline-block;
            background: var(--gradient-secondary);
            color: white;
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .update-btn:hover {
            background: rgba(22, 199, 154, 0.9);
            transform: scale(1.05);
        }

        .no-achievements {
            text-align: center;
            color: var(--text-secondary);
            padding: 60px;
            background: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            grid-column: 1 / -1;
        }

        @media (max-width: 768px) {
            .content {
                padding: 20px;
            }

            .achievements-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="main-wrapper">
        <%@ include file="usersidebar.jsp" %>

        <div class="content">
            <h2>My Achievements</h2>

            <div class="achievements-container">
                <c:if test="${not empty achievements}">
                    <c:forEach var="achievement" items="${achievements}" varStatus="status">
                        <div class="card">
                            <img src="/displayAchivementImage?registerId=${user.registerId}&achievementIndex=${status.index}" 
                                 alt="Achievement Image for ${achievement.title}">
                            <h3>${achievement.title}</h3>
                            <p>${achievement.description}</p>
                            <p>Cash Prize: $${achievement.cashPrize}</p>
                            <p>Added By: ${achievement.addedBy}</p>
                            <div class="status ${achievement.status ? 'approved' : 'pending'}">
                                ${achievement.status ? 'Approved' : 'Pending'}
                            </div>
                            <a href="<c:url value='/updateachievement' />?id=${achievement.id}" class="update-btn">Update</a>
                        </div>
                    </c:forEach>
                </c:if>

                <c:if test="${empty achievements}">
                    <div class="no-achievements">
                        <p>No achievements found for this user. Keep exploring and earning!</p>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>
