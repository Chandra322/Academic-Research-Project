<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="usersidebar.jsp" %>
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
    <title>View All Events</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
        }
        .sidebar {
            width: 250px;
            background-color: #1e293b;
            height: 100vh;
            position: fixed;
            color: #ffffff;
        }
        .sidebar h2 {
            text-align: center;
            padding: 1rem 0;
            font-size: 1.25rem;
            font-weight: 600;
        }
        .menu-item {
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            color: #d1d5db;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .menu-item:hover {
            background-color: #3b82f6;
            color: #ffffff;
        }
        .menu-item i {
            margin-right: 0.75rem;
            font-size: 1.2rem;
        }
        .content {
            margin-left: 260px;
            padding: 2rem;
        }
        .event-card {
            transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
            transform-origin: center;
            will-change: transform, box-shadow;
        }
        .event-card:hover {
            transform: translateY(-10px);
            box-shadow: 
                0 20px 40px -10px rgba(0, 0, 0, 0.1),
                0 10px 20px -5px rgba(0, 0, 0, 0.05);
        }
        .event-image {
            height: 220px;
            width: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .event-card:hover .event-image {
            transform: scale(1.02);
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
            padding: 1rem;
        }
        .event-details {
            border-top: 1px solid #e5e7eb;
            margin-top: 0.75rem;
            padding-top: 0.75rem;
        }
    </style>
</head>
<body>
   
    <div class="content">
        <h1 class="text-4xl font-bold text-gray-800 mb-10 text-center tracking-tight">
            Upcoming Events
        </h1>

        <c:if test="${not empty eventlist}">
            <div class="grid-container">
                <c:forEach var="event" items="${eventlist}">
                    <div class="bg-white rounded-lg shadow-lg overflow-hidden event-card">
                        <img 
                            src="displayeventimages?id=${event.id}" 
                            alt="Event Image" 
                            class="event-image"
                        >
                        <div class="p-5">
                            <h2 class="text-xl font-bold text-gray-800 truncate">${event.event}</h2>
                            <div class="event-details text-gray-600 mt-2">
                                <p class="flex items-center">
                                    <i class="fas fa-calendar-alt text-blue-500 mr-2"></i>${event.date}
                                </p>
                                <p class="flex items-center">
                                    <i class="fas fa-clock text-blue-500 mr-2"></i>${event.time}
                                </p>
                                <p class="flex items-center">
                                    <i class="fas fa-align-left text-blue-500 mr-2"></i>${event.description}
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty eventlist}">
            <div class="text-center bg-white p-10 rounded-lg shadow-md max-w-xl mx-auto">
                <i class="fas fa-calendar-times text-6xl text-gray-300 mb-4"></i>
                <p class="text-xl text-gray-600">No events are currently available.</p>
                <p class="text-sm text-gray-500 mt-2">Check back later for updates!</p>
            </div>
        </c:if>
    </div>
</body>
</html>
