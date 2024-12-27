<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="clubheadsidebar.jsp" %> 
<!DOCTYPE html> 
<html lang="en"> 
<head>
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>View Events</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .event-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .event-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.1);
        }

        .event-image {
            object-fit: cover;
            width: 100%;
            height: 200px;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            padding: 2rem;
        }

        body {
            background-color: #f3f4f6;
            font-family: 'Arial', sans-serif;
        }

        .delete-button {
            background-color: #f56565; /* Red color */
            color: white;
            padding: 8px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .delete-button:hover {
            background-color: #c53030; /* Darker red */
        }

        .delete-button:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 0, 0, 0.4);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .text-center {
            text-align: center;
        }

        .section-header {
            font-size: 2rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .event-info {
            color: #4a5568;
            font-size: 1rem;
            line-height: 1.5;
        }

        .event-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container mx-auto">
        <h1 class="section-header text-center">Your Uploaded Events</h1>
        <c:if test="${not empty events}">
            <div class="grid-container">
                <c:forEach var="event" items="${events}">
                    <div class="event-card">
                        <img src="displayeventimage?id=${event.id}" alt="Event Image" class="event-image">
                        <div class="p-6">
                            <h2 class="event-title">${event.event}</h2>
                            <div class="event-info space-y-2">
                                <p><strong>Category:</strong> ${event.category}</p>
                                <p><strong>Description:</strong> ${event.description}</p>
                                <p><strong>Date:</strong> ${event.date}</p>
                                <p><strong>Time:</strong> ${event.time}</p>
                                <p class="font-bold text-blue-600">Available Slots: ${event.slots}</p>
                            </div>
                            <div class="mt-4 text-right">
                                <a href='<c:url value="deleteevent?event=${event.event}"></c:url>' class="delete-button">Delete</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${empty events}">
            <div class="text-center bg-white p-6 rounded-lg shadow-md">
                <p class="text-gray-600 text-xl">No events found.</p>
            </div>
        </c:if>
    </div>
</body>
</html>
