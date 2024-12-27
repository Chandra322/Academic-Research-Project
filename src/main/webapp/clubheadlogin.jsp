<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Client Login</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap and Custom Styles -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    
    <style>
        body {
            background: linear-gradient(135deg, #f6f8f9 0%, #e5ebee 100%);
            font-family: 'Inter', sans-serif;
        }
        .login-wrapper {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .login-wrapper:hover {
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }
        .login-form input {
            transition: all 0.3s ease;
        }
        .login-form input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
        }
        .login-btn {
            background: linear-gradient(to right, #3b82f6, #2563eb);
            color: white;
            transition: transform 0.2s ease;
        }
        .login-btn:hover {
            transform: translateY(-3px);
            background: linear-gradient(to right, #2563eb, #1d4ed8);
        }
        .breadcrumb-area {
            background-image: url('assets/images/bg/breadcrumb-bg-01.jpg');
            background-size: cover;
            background-position: center;
            position: relative;
        }
        .breadcrumb-area::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0,0,0,0.4);
        }
    </style>
</head>
<body>
    <div class="main-wrapper">
        <!-- Breadcrumb Area -->
        <div class="breadcrumb-area" data-black-overlay="4">
            <div class="container">
                <div class="in-breadcrumb">
                    <div class="row">
                        <div class="col">
                            <h3 class="text-white">Client Login</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="index.jsp" class="text-white">Home</a></li>
                                <li class="breadcrumb-item active text-white">Client Login</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Login Page Content -->
        <main class="page-content">
            <div class="login-page section-ptb">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-12 m-auto">
                            <div class="login-wrapper">
                                <div class="login-tab-list">
                                    <a class="active">
                                        <h4>Client Login</h4>
                                    </a>
                                </div>
                                
                                <!-- Error Message Handling -->
                                <c:if test="${not empty errorMessage}">
                                    <div class="alert alert-danger mt-3" role="alert">
                                        ${errorMessage}
                                    </div>
                                </c:if>

                                <div class="login-form-container">
                                    <div class="login-form">
                                        <form action="${pageContext.request.contextPath}/checkclubheadlogin" method="post">
                                            <div class="login-input-box">
                                                <input type="text" name="clubEmail" placeholder="Email" required 
                                                       class="form-control mb-3">
                                                <input type="password" name="password" placeholder="Password" required 
                                                       class="form-control mb-3">
                                            </div>
                                            <div class="button-box">
                                                <div class="login-toggle-btn d-flex justify-content-between align-items-center mb-3">
                                                    <div>
                                                        <input type="checkbox" id="remember-me">
                                                        <label for="remember-me" class="ml-2">Remember me</label>
                                                    </div>
                                                    <a href="#" class="text-primary">Forgot Password?</a>
                                                </div>
                                                <div class="button-box">
                                                    <button class="login-btn btn btn-block" type="submit">
                                                        <span>Login</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Required Scripts -->
    <script src="assets/js/vendor/jquery-3.6.0.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>