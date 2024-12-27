<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    :root {
        --primary-color: #3a4a92;
        --secondary-color: #6e87d6;
        --accent-color: #ffb84d;
        --background-light: #f4f6f8;
        --text-light: #fdfdfd;
        --text-dark: #333;
        --text-muted: #6b7280;
        --transition-speed: 0.3s;
        --border-radius: 12px;
        --box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    }

    .sidebar {
        width: 280px;
        background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        color: var(--text-light);
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        z-index: 1000;
        transition: transform var(--transition-speed) ease, width var(--transition-speed) ease;
        box-shadow: var(--box-shadow);
        overflow-y: auto;
        display: flex;
        flex-direction: column;
    }

    .sidebar-header {
        display: flex;
        align-items: center;
        padding: 25px 20px;
        background: rgba(0, 0, 0, 0.1);
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    .sidebar-logo {
        width: 55px;
        height: 55px;
        background-color: var(--accent-color);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 15px;
    }

    .sidebar-logo i {
        color: var(--primary-color);
        font-size: 28px;
    }

    .sidebar-title {
        font-size: 1.6rem;
        font-weight: 700;
        letter-spacing: -0.5px;
    }

    .sidebar-menu {
        list-style: none;
        padding: 20px 0;
        flex-grow: 1;
    }

    .sidebar-menu-item {
        margin: 5px 0;
    }

    .sidebar-menu-link {
        display: flex;
        align-items: center;
        padding: 12px 25px;
        color: var(--text-light);
        text-decoration: none;
        transition: all var(--transition-speed) ease;
        position: relative;
        border-radius: 0 var(--border-radius) var(--border-radius) 0;
        margin: 0 10px;
    }

    .sidebar-menu-link:hover {
        background-color: rgba(255,255,255,0.1);
    }

    .sidebar-menu-link.active {
        background-color: rgba(255,255,255,0.2);
    }

    .sidebar-menu-link i {
        margin-right: 15px;
        font-size: 1.2rem;
        color: var(--accent-color);
    }

    .sidebar-footer {
        padding: 20px;
        background: rgba(0, 0, 0, 0.1);
        text-align: center;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
    }

    .content {
        flex-grow: 1;
        margin-left: 280px;
        padding: 30px;
        background-color: var(--background-light);
    }

    /* Responsive Design */
    @media screen and (max-width: 768px) {
        .sidebar {
            transform: translateX(-100%);
        }

        .sidebar.open {
            transform: translateX(0);
        }

        .content {
            margin-left: 0;
            padding: 15px;
        }
    }
</style>

<aside class="sidebar" id="sidebar" role="complementary">
    <div class="sidebar-header">
        <div class="sidebar-logo">
            <i class="fas fa-trophy"></i>
        </div>
        <div class="sidebar-title">ACTIVE HUB</div>
    </div>
    <nav>
        <ul class="sidebar-menu">
            <li class="sidebar-menu-item">
                <a href="userDashboard" class="sidebar-menu-link">
                    <i class="fas fa-home"></i>
                    Home
                </a>
            </li>
            <li class="sidebar-menu-item">
                <a href="uploadachievement" class="sidebar-menu-link">
                    <i class="fas fa-upload"></i>
                    Upload Achievement
                </a>
            </li>
            <li class="sidebar-menu-item">
                <a href="achivementregisterid" class="sidebar-menu-link">
                    <i class="fas fa-eye"></i>
                     View User Achievements
                </a>
            </li>
            <li class="sidebar-menu-item">
                <a href="viewallevents" class="sidebar-menu-link">
                    <i class="fas fa-eye"></i>
                    View Events
                </a>
            </li>
             <li class="sidebar-menu-item">
                <a href="userlogout" class="sidebar-menu-link">
                    <i class="fas fa-eye"></i>
                    Logout
                </a>
            </li>
             <li class="sidebar-menu-item">
                <a href="userprofile" class="sidebar-menu-link">
                    <i class="fas fa-user"></i>
                      User Profile
                </a>
            </li>
        </ul>
    </nav>
    <div class="sidebar-footer">
        <p>&copy; 2024 Active Dashboard</p>
    </div>
</aside>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const sidebar = document.getElementById('sidebar');
        const sidebarLinks = sidebar.querySelectorAll('.sidebar-menu-link');
        
        // Highlight active page
        sidebarLinks.forEach(link => {
            if (link.getAttribute('href') === window.location.pathname.split('/').pop()) {
                link.classList.add('active');
            }
        });
    });
</script>