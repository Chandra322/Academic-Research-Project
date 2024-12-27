<%@page import="com.example.springboot.model.ClubHead"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.springboot.model.ClubHead" %>

<%
    HttpSession httpsession = request.getSession();
    ClubHead club = (ClubHead) httpsession.getAttribute("club");
    if (club == null) {
        out.println("<p>Error: No crop data found in the session.</p>");
        return;
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Extra Curricular Event</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #f4f7f6;
        }
        .custom-form-container {
            background: white;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            transition: all 0.3s ease;
        }
        .custom-form-container:hover {
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            transform: translateY(-5px);
        }
        .custom-input {
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            padding: 12px 15px;
            font-size: 16px;
            color: #333;
            transition: all 0.3s ease;
            outline: none;
        }
        .custom-input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.15);
        }
        .custom-input::placeholder {
            color: #a0a0a0;
            transition: color 0.3s ease;
        }
        .custom-input:focus::placeholder {
            color: #3b82f6;
        }
        .custom-button {
            background: linear-gradient(to right, #3b82f6, #2563eb);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
            width: 100%;
        }
        .custom-button:hover {
            background: linear-gradient(to right, #2563eb, #1d4ed8);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
        }
        .custom-button:active {
            transform: translateY(1px);
            box-shadow: 0 2px 10px rgba(59, 130, 246, 0.2);
        }
    </style>
</head>
<body class="bg-gray-100">
    <%@ include file="clubheadsidebar.jsp" %>

    <div class="container mx-auto px-4 py-8">
        <div class="max-w-2xl mx-auto bg-white shadow-lg rounded-lg overflow-hidden">
            <div class="px-6 py-4 bg-gray-50 border-b border-gray-200">
                <h3 class="text-2xl font-bold text-center text-gray-800">Add Event</h3>
            </div>
            
            <form action="insertevent" method="post" enctype="multipart/form-data" class="p-6 space-y-4">
                <div class="grid grid-cols-1 gap-4">
                
      <div>
    <label for="clubheadId" class="block text-sm font-medium text-gray-700 mb-2">clubheadId</label>
    <!-- Hidden input for clubheadId -->
    <input type="hidden" id="clubheadId" name="clubheadId" value="<%= club != null ? club.getId() : "" %>" required>
     </div>
                
                
                    
                    <div>
                        <label for="event" class="block text-sm font-medium text-gray-700 mb-2">Event Name</label>
                        <input type="text" id="event" name="event" required 
                               class="custom-input w-full" 
                               placeholder="Enter event name">
                    </div>

                    <div>
                        <label for="category" class="block text-sm font-medium text-gray-700 mb-2">Category</label>
                        <select id="category" name="category" required 
                                class="custom-input w-full">
                            <option value="">---Select Category---</option>
                            <option value="technical">Technical</option>
                            <option value="social">Social</option>
                            <option value="Non-technical">Non-Technical</option>
                        </select>
                    </div>

                    <div>
                        <label for="description" class="block text-sm font-medium text-gray-700 mb-2">Description</label>
                        <textarea id="description" name="description" 
                                  class="custom-input w-full resize-y" 
                                  rows="4" 
                                  placeholder="Enter event description"></textarea>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label for="time" class="block text-sm font-medium text-gray-700 mb-2">Time</label>
                            <input type="text" id="time" name="time" required 
                                   class="custom-input w-full" 
                                   placeholder="Event time">
                        </div>
                        <div>
                            <label for="date" class="block text-sm font-medium text-gray-700 mb-2">Date</label>
                            <input type="date" id="date" name="date" required 
                                   class="custom-input w-full">
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label for="slots" class="block text-sm font-medium text-gray-700 mb-2">Available Slots</label>
                            <input type="text" id="slots" name="slots" required 
                                   class="custom-input w-full" 
                                   placeholder="Number of slots">
                        </div>
                        <div>
                            <label for="eventimage" class="block text-sm font-medium text-gray-700 mb-2">Event Image</label>
                            <input type="file" id="eventimage" name="eventimage" required 
                                   class="custom-input w-full file:mr-4 file:rounded-full file:border-0 file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100">
                        </div>
                    </div>

                    <div class="pt-4">
                        <button type="submit" class="custom-button">
                            Add Event
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>