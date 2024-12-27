<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.example.springboot.model.AddAchievement"%>
<%@ include file="usersidebar.jsp" %>
<%
    HttpSession httpSession = request.getSession();
    AddAchievement achievement = (AddAchievement) httpSession.getAttribute("updatedAchievement");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Achievement</title>
    <style>
        .update-container {
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
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 12px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="content">
            <div class="update-container">
                <h2>Update Achievement</h2>
                <form action="updateachievement" method="post" enctype="multipart/form-data">
                
               		 <div class="form-group" >
                        <label for="registerId">Achievement ID</label>
                        <input type="text" class="form-control" id="achievementid" name="achievementid" 
                               value="${achievement.id}" readonly>
                    </div>
                    
                    <div class="form-group" >
                        <label for="registerId">Register ID</label>
                        <input type="text" class="form-control" id="registerId" name="registerId" 
                               value="${achievement.registerId}" readonly>
                    </div>

                    <div class="form-group">
                        <label for="title">Achievement Title</label>
                        <input type="text" class="form-control" id="title" name="title" 
                               value="${achievement.title}" required maxlength="255">
                    </div>

                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="4" required>${achievement.description}</textarea>
                    </div>

                    <div class="form-group">
                        <label for="achievedDate">Date Achieved</label>
                        <input type="date" class="form-control" id="achievedDate" name="achievedDate" 
                               value="${achievement.achievedDate}" required>
                    </div>

                    <div class="form-group">
                        <label for="category">Category</label>
                        <select class="form-control" id="category" name="category" required>
                            <option value="" ${achievement.category == '' ? 'selected' : ''}>Select Category</option>
                            <option value="Academic" ${achievement.category == 'Academic' ? 'selected' : ''}>Academic</option>
                            <option value="Sports" ${achievement.category == 'Sports' ? 'selected' : ''}>Sports</option>
                            <option value="Cultural" ${achievement.category == 'Cultural' ? 'selected' : ''}>Cultural</option>
                            <option value="Technical" ${achievement.category == 'Technical' ? 'selected' : ''}>Technical</option>
                            <option value="Other" ${achievement.category == 'Other' ? 'selected' : ''}>Other</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="cashPrize">Cash Prize (Optional)</label>
                        <input type="number" step="0.01" class="form-control" id="cashPrize" name="cashPrize" min="0" 
                               value="${achievement.cashPrize}">
                    </div>

                    <div class="form-group" hidden>
                        <input type="hidden" id="addedBy" name="addedBy" value="user">
                    </div>
                                    
                                    
                                    <div class="form-group">
                    <label for="certificateImage">Certificate Image</label>
              <input type="file" class="form-control" id="certificateImage" name="certificateImage" accept="image/*">
               <br>
          <c:if test="${not empty achievement.certificateImage}">
        <img src="/displayAchivementImages?registerId=${achievement.registerId}&id=${achievement.id}" alt="Certificate Image" style="max-width: 200px;">
    </c:if>
</div>
                                        
                                          
                    <div class="form-group">
                        <label for="achievementsLink">Achievement Link (Optional)</label>
                        <input type="url" class="form-control" id="achievementsLink" name="achievementsLink" maxlength="500" 
                               value="${achievement.achievementsLink}">
                    </div>

                    <button type="submit" class="btn-primary">Update Achievement</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
