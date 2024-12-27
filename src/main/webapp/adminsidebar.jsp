<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    :root {
        --primary-color: #4a6cf7;
        --secondary-color: #16c79a;
        --sidebar-bg: #ffffff;
        --text-primary: #2c3e50;
        --text-secondary: #6c757d;
        --sidebar-width: 280px;
        --card-shadow: 0 10px 30px rgba(37, 117, 252, 0.1);
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', sans-serif;
        background-color: #f4f7ff;
        display: flex;
        min-height: 100vh;
    }

    /* Sidebar Styles */
    .sidebar {
        width: var(--sidebar-width);
        background-color: var(--sidebar-bg);
        position: fixed;
        top: 0;
        left: 0;
        height: 100%;
        padding-top: 20px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        transition: width 0.3s ease;
    }

    .sidebar-logo {
        display: flex;
        align-items: center;
        margin-bottom: 40px;
        padding-left: 20px;
    }

    .sidebar-logo i {
        font-size: 2rem;
        color: var(--primary-color);
        margin-right: 10px;
    }

    .sidebar-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--primary-color);
    }

    .sidebar h2 {
        color: var(--text-primary);
        font-size: 1.1rem;
        margin-top: 20px;
        padding-left: 20px;
        margin-bottom: 20px;
    }

    .sidebar-menu {
        list-style: none;
        padding-left: 0;
    }

    .sidebar-menu li {
        margin: 15px 0;
    }

    .sidebar-menu a {
        display: flex;
        align-items: center;
        text-decoration: none;
        color: var(--text-primary);
        padding: 10px 20px;
        font-size: 1.1rem;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .sidebar-menu a:hover,
    .sidebar-menu a.active {
        background-color: var(--primary-color);
        color: #fff;
    }

    .sidebar-menu a i {
        margin-right: 10px;
    }

    .sidebar-menu a.text-danger {
        color: #e74c3c;
    }

    /* Mobile Responsiveness */
    @media (max-width: 768px) {
        .sidebar {
            width: 0;
            overflow: hidden;
        }

        .sidebar-menu a {
            font-size: 1rem;
            padding: 10px 15px;
        }

        .sidebar h2 {
            font-size: 1rem;
        }
    }
</style>

<div class="sidebar">
    <div class="sidebar-logo">
        <i class="fas fa-cogs"></i>
        <span class="sidebar-title">Admin Panel</span>
    </div>
    <h2>Navigation</h2>
    <ul class="sidebar-menu">
        <li><a href="adminDashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="viewallusers"><i class="fas fa-users"></i> Users</a></li>
        <li><a href="insertregisterid"><i class="fas fa-user"></i> insert user</a></li>
         <li><a href="viewregisterids"><i class="fas fa-user"></i> registered user</a></li>
         <li><a href="viewaddedclubdata"><i class="fas fa-user"></i> Club User</a></li>
         <li><a href="viewAllAchievements"><i class="fas fa-trophy"></i> View Achievements</a></li>
            <li><a href="AddClubdata"><i class="fas fa-plus-circle"></i> Add New Club</a></li>
            
        <li><a href="adminlogout" class="text-danger"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
         <li><a href="#"><i class="fas fa-cogs"></i> Settings</a></li>
    </ul>
</div>