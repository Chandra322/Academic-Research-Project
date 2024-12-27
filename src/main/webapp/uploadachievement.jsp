<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.example.springboot.model.User"%>
<%@ include file="usersidebar.jsp" %>
<%
    HttpSession httpSession = request.getSession();
    User user = (User) httpSession.getAttribute("user");
%>
<
<% 
User users = (User) session.getAttribute("users"); 
if (users == null) { 
    response.sendRedirect("usersessionexpiry"); 
    return; 
} 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Achievement</title>
    <style>
        .upload-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 600px;
            margin: 30px auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 12px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="content">
            <div class="upload-container">
                <h2>Upload Achievement</h2>
                <form action="insertachivements" method="post" enctype="multipart/form-data">
                    <!-- Hidden field for Register ID -->
                    <div class="form-group" hidden>
                        <label for="registerId">Register ID</label>
                        <input type="text" class="form-control" id="registerId" name="registerId" 
                               value="<%= user != null ? user.getRegisterId() : "" %>" readonly>
                    </div>

                    <!-- Achievement Title -->
                    <div class="form-group">
                        <label for="title">Achievement Title</label>
                        <input type="text" class="form-control" id="title" name="title" required maxlength="255">
                    </div>

                    <!-- Description -->
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
                    </div>

                    <!-- Date Achieved -->
                    <div class="form-group">
                        <label for="achievedDate">Date Achieved</label>
                        <input type="date" class="form-control" id="achievedDate" name="achievedDate" required>
                    </div>

                    <!-- Category -->
                    <div class="form-group">
                        <label for="category">Category</label>
                        <select class="form-control" id="category" name="category" required>
                            <option value="">Select Category</option>
                            <option value="Academic">Academic</option>
                            <option value="Sports">Sports</option>
                            <option value="Cultural">Cultural</option>
                            <option value="Technical">Technical</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <!-- Cash Prize -->
                    <div class="form-group">
                        <label for="cashPrize">Cash Prize (Optional)</label>
                        <input type="number" step="0.01" class="form-control" id="cashPrize" name="cashPrize" min="0">
                    </div>

                    <!-- Hidden Field for Added By -->
                    <div class="form-group" hidden>
                        <input type="hidden" id="addedBy" name="addedBy" value="user">
                    </div>

                    <!-- Certificate Image -->
                    <div class="form-group">
                        <label for="certificateImage">Certificate Image</label>
                        <input type="file" class="form-control" id="certificateImage" name="certificateImage" accept="image/*">
                    </div>

                    <!-- Achievement Link -->
                    <div class="form-group">
                        <label for="achievementsLink">Achievement Link (Optional)</label>
                        <input type="url" class="form-control" id="achievementsLink" name="achievementsLink" maxlength="500">
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn-primary">Upload Achievement</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
