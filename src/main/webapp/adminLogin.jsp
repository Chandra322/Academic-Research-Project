<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Publisher Login Page | Researcher</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
</head>

<body>

    <div class="main-wrapper">

        <%-- <%@ include file="adminHeader.jsp" %> --%>

        <div class="breadcrumb-area" data-bgimage="assets/images/bg/breadcrumb-bg-01.jpg" data-black-overlay="4">
            <div class="container">
                <div class="in-breadcrumb">
                    <div class="row">
                        <div class="col">
                            <h3>Publisher Login</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                <li class="breadcrumb-item active">Publisher Login</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <main class="page-content">

            <div class="login-page section-ptb">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-12 m-auto">
                            <div class="login-wrapper">
                                <div class="login-tab-list">
                                    <a class="active">
                                        <h4>Publisher Login</h4>
                                    </a>
                                </div>
                                <div class="login-form-container">
								    <div class="login-form">
								        <form action="checkadminlogin" method="post"> 
								            <div class="login-input-box">
								                <input type="text" name="auname" placeholder="Email" required>
								                <input type="password" name="apwd" placeholder="Password" required>
								            </div>
								            <div class="button-box">
								                <div class="login-toggle-btn">
								                    <input type="checkbox">
								                    <label>Remember me</label>
								                    <a href="#">Forgot Password?</a>
								                </div>
								                <div class="button-box">
								                    <button class="login-btn btn" type="submit"><span>Login</span></button>
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

    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/ajax-mail.js"></script>
    <script src="assets/js/main.js"></script>

</body>

</html>
