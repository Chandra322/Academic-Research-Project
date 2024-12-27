<!doctype html>
<html class="no-js" lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login And Register Page || Eduhas - Education Bootstrap 5 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>

    <script>
        function validateLoginForm() {
            var email = document.forms["loginForm"]["email"].value;
            var password = document.forms["loginForm"]["password"].value;

            if (email == "" || password == "") {
                alert("All fields must be filled out.");
                return false;
            }

            // Password validation (for login form)
            var regExPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,}$/;
            if (!regExPassword.test(password)) {
                alert("Password must be more than 7 characters, contain at least one lowercase letter, one uppercase letter, and one special character.");
                return false;
            }

            return true;
        }

        function validateRegisterForm() {
            var registerId = document.forms["registerForm"]["registerId"].value;
            var fullname = document.forms["registerForm"]["fullname"].value;
            var gender = document.forms["registerForm"]["gender"].value;
            var email = document.forms["registerForm"]["email"].value;
            var mobilenumber = document.forms["registerForm"]["mobilenumber"].value;
            var dateofbirth = document.forms["registerForm"]["dateofbirth"].value;
            var city = document.forms["registerForm"]["city"].value;
            var state = document.forms["registerForm"]["state"].value;
            var district = document.forms["registerForm"]["district"].value;
            var pincode = document.forms["registerForm"]["pincode"].value;
            var country = document.forms["registerForm"]["country"].value;
            var password = document.forms["registerForm"]["password"].value;

            // Check if any required fields are empty
            if (registerId == "" || fullname == "" || gender == "" || email == "" || mobilenumber == "" ||
                dateofbirth == "" || city == "" || state == "" || district == "" || pincode == "" ||
                country == "" || password == "") {
                alert("All fields must be filled out.");
                return false;
            }

            // Validate registerId (must be 10 digits)
            var regExId = /^[0-9]{10}$/;
            if (!regExId.test(registerId)) {
                alert("Register ID must be exactly 10 digits.");
                return false;
            }

            // Validate mobile number (must be 10 digits)
            var regExMobile = /^[0-9]{10}$/;
            if (!regExMobile.test(mobilenumber)) {
                alert("Mobile number must be exactly 10 digits.");
                return false;
            }

            // Validate email (must be a valid gmail format)
            var regExEmail = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
            if (!regExEmail.test(email)) {
                alert("Email must be in valid '@gmail.com' format.");
                return false;
            }

            // Password validation (for register form)
            var regExPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,}$/;
            if (!regExPassword.test(password)) {
                alert("Password must be more than 7 characters, contain at least one lowercase letter, one uppercase letter, and one special character.");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>

    <div class="main-wrapper">

        <div class="breadcrumb-area" data-bgimage="assets/images/bg/breadcrumb-bg-01.jpg" data-black-overlay="4">
            <div class="container">
                <div class="in-breadcrumb">
                    <div class="row">
                        <div class="col">
                            <h3>Login And Register</h3>
                            <ul class="breadcrumb-list">
                                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                                <li class="breadcrumb-item active">Login And Register</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <main class="page-content">

            <div class="register-page section-ptb">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 col-md-12 m-auto">
                            <div class="login-register-wrapper">
                                <div class="login-register-tab-list nav">
                                    <a class="active" data-bs-toggle="tab" href="#lg1">
                                        <h4> login </h4>
                                    </a>
                                    <a data-bs-toggle="tab" href="#lg2">
                                        <h4> register </h4>
                                    </a>
                                </div>
                                <div class="tab-content">
                                    <div id="lg1" class="tab-pane active">
                                        <div class="login-form-container">
                                            <div class="login-register-form">
                                                <form name="loginForm" action="checkuserlogin" method="post" onsubmit="return validateLoginForm()">
                                                    <div class="login-input-box">
                                                        <input type="text" name="email" placeholder="Email" required>
                                                        <input type="password" name="password" placeholder="Password" required>
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
                                    <div id="lg2" class="tab-pane">
                                        <div class="login-form-container">
                                            <div class="login-register-form">
                                                <form name="registerForm" action="insertuser" method="post" enctype="multipart/form-data" onsubmit="return validateRegisterForm()">
                                                    <div class="login-input-box">
                                                       <input type="text" name="registerId" placeholder="Register Id *" required>
                                                       <input type="text" name="fullname" placeholder="Full Name *" required>
                                                       <input type="text" name="gender" placeholder="Gender  *" required>
                                                       <input type="email" name="email" placeholder="Email *" required>
                                                       <input type="text" name="mobilenumber" placeholder="Mobile Number *" required>
                                                       <input type="date" name="dateofbirth" placeholder="Date of Birth *" required="required">
                                                       <input type="text" name="city" placeholder="City">
                                                       <input type="text" name="state" placeholder="State">
                                                       <input type="text" name="district" placeholder="District">
                                                       <input type="text" name="pincode" placeholder="Pincode">
                                                       <input type="text" name="country" placeholder="Country">
                                                       <input type="password" name="password" placeholder="Password *" required>
                                                    </div>
                                                    <div class="button-box">
                                                        <button class="register-btn btn" type="submit"><span>Register</span></button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
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
    <script src="assets/js/main.js"></script>
</body>

</html>
