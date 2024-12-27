<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="adminsidebar.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered Users</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Table Styles */
        .table-container {
            margin: 3rem 0;
            overflow-x: auto;
        }

        table {
            width: 50%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
            font-size: 12px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        /* Hover Effect */
        tr:hover {
            background-color: #f5f5f5;
        }

        /* Verification Badge Styles */
        .badge {
            display: inline-block;
            padding: 4px 8px;
            font-size: 12px;
            font-weight: bold;
            border-radius: 4px;
            text-transform: uppercase;
        }

        .badge-success {
            background-color: #28a745;
            color: #fff;
        }

        .badge-danger {
            background-color: #dc3545;
            color: #fff;
        }

        /* Action Button Styles */
        .btn {
            display: inline-block;
            padding: 6px 12px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            border-radius: 4px;
            text-decoration: none;
        }

        .btn-success {
            background-color: #28a745;
            color: #fff;
        }

        .btn-danger {
            background-color: #dc3545;
            color: #fff;
        }

        .btn-sm {
            padding: 4px 8px;
            font-size: 12px;
        }

        /* Responsive Styles */
        @media (max-width: 780px) {
            table {
                font-size: 14px;
            }

            th, td {
                padding: 8px 10px;
            }

            .btn-sm {
                padding: 2px 6px;
                font-size: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid">
    
        <div class="row">
            <div class="col-md-3">
                <%@ include file="adminsidebar.jsp" %>
            </div>
            
            <div class="col-md-9">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h3>Registered Users</h3>
                    <a href="admindashboard" class="btn btn-primary">
                        <i class="fas fa-arrow-left"></i> Back to Dashboard
                    </a>
                </div>
                Total Users : <c:out value="${Userscount}"></c:out> 
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Gender</th>
                                <th>Mobile Number</th>
                                <th>Date of Birth</th>
                                <th>City</th>
                                <th>State</th>
                                <th>District</th>
                                <th>Pincode</th>
                                <th>Country</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${userlist}">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.fullName}</td>
                                    <td>${user.email}</td>
                                    <td>${user.gender}</td>
                                    <td>${user.mobileNumber}</td>
                                    <td>${user.dateOfBirth}</td>
                                    <td>${user.city}</td>
                                    <td>${user.state}</td>
                                    <td>${user.district}</td>
                                    <td>${user.pincode}</td>
                                    <td>${user.country}</td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${user.verified}">
                                                <span class="badge badge-success">Verified</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-danger">Not Verified</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <c:if test="${!user.verified}">
                                            <a href="verifyuser?id=${user.id}" class="btn btn-success btn-sm">
                                                <i class="fas fa-check"></i> Verify
                                            </a>
                                        </c:if>
                                        <a href="delete?registerId=${user.registerId}" class="btn btn-danger btn-sm"
                                           onclick="return confirm('Are you sure you want to delete this user?');">
                                            <i class="fas fa-trash"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>