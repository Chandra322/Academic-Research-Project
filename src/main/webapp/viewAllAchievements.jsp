<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>My Achievements</title>
    <style>
        :root {
            --primary-color: #007bff;
            --secondary-color: #6c757d;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            line-height: 1.6;
        }

        .achievements-container {
            max-width: 1100px;
            margin: 30px auto;
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .achievement-card {
            display: flex;
            flex-wrap: wrap;
            align-items: stretch;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            margin-bottom: 20px;
            padding: 20px;
            transition: transform 0.3s ease;
        }

        .achievement-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .achievement-image {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 20px;
            align-self: center;
        }

        .achievement-details {
            flex-grow: 1;
            min-width: 300px;
        }

        .achievement-actions {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            gap: 10px;
            margin-left: auto;
            width: 200px;
        }

        .achievement-actions-row {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: flex-end;
        }

        .btn {
            display: inline-block;
            padding: 8px 12px;
            border-radius: 6px;
            text-decoration: none;
            text-align: center;
            font-size: 0.9em;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            transform: scale(1.05);
            opacity: 0.9;
        }

        .btn-view { background-color: var(--primary-color); color: white; }
        .btn-download { background-color: var(--secondary-color); color: white; }
        .btn-edit { background-color: var(--warning-color); color: white; }
        .btn-delete { background-color: var(--danger-color); color: white; }
        .btn-verify { background-color: var(--success-color); color: white; }
        .btn-disabled { 
            background-color: #6c757d; 
            color: white; 
            cursor: not-allowed;
            opacity: 0.6;
        }

        .badge {
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: bold;
            font-size: 0.8em;
        }

        .badge-success {
            background-color: var(--success-color);
            color: white;
        }

        .badge-warning {
            background-color: var(--warning-color);
            color: black;
        }

        .empty-state {
            text-align: center;
            padding: 50px;
            background-color: #f8f9fa;
            border-radius: 10px;
        }

        @media (max-width: 768px) {
            .achievement-card {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .achievement-image {
                margin-right: 0;
                margin-bottom: 15px;
            }

            .achievement-actions {
                width: 100%;
                align-items: center;
            }

            .achievement-actions-row {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="achievements-container">
    
     <%@ include file="adminsidebar.jsp" %>
  
        <h2>My Achievements</h2>
          Total Achievements=<c:out value="${achievementcount}"></c:out>
        <c:choose>
            <c:when test="${not empty achievements}">
                <c:forEach var="achievement" items="${achievements}">
                    <div class="achievement-card">
                        <c:choose>
                            <c:when test="${achievement.certificateImage != null}">
                                <img src="<c:url value='/displayachievementimage' />?id=${achievement.id}" 
                                     alt="Certificate" class="achievement-image">
                            </c:when>
                            <c:otherwise>
                                <img src="<c:url value='/resources/images/default-placeholder.jpg' />" 
                                     alt="No Image Available" class="achievement-image">
                            </c:otherwise>
                        </c:choose>
                        
                        <div class="achievement-details">
                            <h3>${achievement.title}</h3>
                            <p><strong>Category:</strong> ${achievement.category}</p>
                            <p><strong>Date Achieved:</strong> ${achievement.achievedDate}</p>
                            <p>${achievement.description}</p>
                            
                            <c:if test="${not empty achievement.cashPrize}">
                                <p><strong>Cash Prize:</strong> ${achievement.cashPrize}</p>
                            </c:if>
                            
                            <c:if test="${not empty achievement.achievementsLink}">
                                <p><strong>Achievement Link:</strong> 
                                    <a href="${achievement.achievementsLink}" target="_blank" rel="noopener noreferrer">View Details</a>
                                </p>
                            </c:if>
                            
                            <div class="achievement-status">
                                <strong>Status:</strong>
                                <c:choose>
                                    <c:when test="${achievement.status}">
                                        <span class="badge badge-success">Approved</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge badge-warning">Pending Verification</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                        <div class="achievement-actions">
                            <div class="achievement-actions-row">
                                <a href="<c:url value='/displayachievementimage' />?id=${achievement.id}" 
                                   class="btn btn-view" target="_blank">View Certificate</a>
                                <a href="<c:url value='/downloadAchievementImage' />?id=${achievement.id}" 
                                   class="btn btn-download">Download Certificate</a>
                            </div>
                            <div class="achievement-actions-row">
                                <a href="<c:url value='/editAchievement' />?id=${achievement.id}" class="btn btn-edit">Edit</a>
                                <a href="<c:url value='/deleteAchievement' />?id=${achievement.id}" class="btn btn-delete">Delete</a>
                                <c:if test="${!achievement.status}">
                                    <a href="<c:url value='/verifyAchievement' />?id=${achievement.id}" 
                                       class="btn btn-verify">Verify</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <p>No achievements uploaded yet. Start adding your accomplishments!</p>
                    <a href="<c:url value='/uploadachievement' />" class="btn btn-primary">Upload Achievement</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>