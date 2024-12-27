<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        :root {
            --primary-color: #4a6cf7;
            --secondary-color: #16c79a;
            --background-color: #f4f7ff;
            --sidebar-bg: #ffffff;
            --text-primary: #2c3e50;
            --text-secondary: #6c757d;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--background-color);
            display: flex;
        }

        .dashboard-content {
            margin-left: 280px;
            width: calc(100% - 280px);
            padding: 30px;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .dashboard-header h1 {
            color: var(--primary-color);
            font-weight: 700;
        }

        .dashboard-stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            display: flex;
            align-items: center;
            box-shadow: 0 10px 30px rgba(37, 117, 252, 0.1);
        }

        .stat-card i {
            font-size: 2.5rem;
            margin-right: 20px;
            color: var(--primary-color);
        }

        .stat-card-content h3 {
            color: var(--text-secondary);
            margin-bottom: 5px;
        }

        .stat-card-content p {
            font-weight: 700;
            color: var(--primary-color);
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 0;
                overflow: hidden;
            }

            .dashboard-content {
                margin-left: 0;
                width: 100%;
            }

            .dashboard-stats {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>

    <!-- Include Sidebar -->
   <%@ include file="adminsidebar.jsp" %>
  

    <!-- Dashboard Content -->
    <div class="dashboard-content">
        <div class="dashboard-header">
            <h1>Dashboard Overview</h1>
            <div>
                <span>Welcome, Admin</span>
            </div>
        </div>

        <!-- Dashboard Stats -->
      <div class="dashboard-stats">
    <div class="stat-card">
        <i class="fas fa-trophy"></i>
        <div class="stat-card-content">
            <h3>Total Achievements</h3>
           <p>  Total Achievements : <c:out value="${achievementcount}"></c:out> </p>
        </div>
    </div>
</div>
             <div class="dashboard-stats">
            <div class="stat-card">
                <i class="fas fa-user-edit"></i>
                <div class="stat-card-content">
                    <h3>Total Users</h3>
                  <p>  Total Users : <c:out value="${Userscount}"></c:out> </p>
                </div>
            </div>
            
            
            <div class="stat-card">
      <i class="fas fa-user-check"></i>
    <div class="stat-card-content">
        <h3>Verified Students</h3>
        <p><c:out value="${verifiedStudentCount}" /></p>
    </div>
         </div>
 
<div class="stat-card">
    <i class="fas fa-user-times"></i>
    <div class="stat-card-content">
        <h3>Non-Verified Students</h3>
        <p><c:out value="${nonVerifiedStudentCount}" /></p>
    </div>
</div>
            
          
        <!-- Recent Activity Table -->
        <div class="card">
            <div class="card-header bg-primary text-white">
                <i class="fas fa-table"></i> Recent Student Records
            </div>
            <div class="table-responsive">
               
            </div>
        </div>
    </div>

</body>
</html>
