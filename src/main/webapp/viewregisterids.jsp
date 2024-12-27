<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Register IDs</title>
    <link href="${pageContext.request.contextPath}/assets/fontawesome/css/all.min.css" rel="stylesheet">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
<%@include file="adminsidebar.jsp" %>
    <h2 style="text-align: center;">Register IDs</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Register ID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${userlist}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.registerId}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
