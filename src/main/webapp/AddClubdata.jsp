<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminsidebar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club Registration</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f6f8f9 0%, #e5ebee 100%);
        }
        .form-container {
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .form-container:hover {
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }
        input, select {
            transition: all 0.3s ease;
        }
        input:focus, select:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
        }
        .submit-btn {
            background: linear-gradient(to right, #3b82f6, #2563eb);
            transition: transform 0.2s ease;
        }
        .submit-btn:hover {
            transform: translateY(-3px);
            background: linear-gradient(to right, #2563eb, #1d4ed8);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center px-4">
    <div class="w-full max-w-lg form-container bg-white p-8 rounded-2xl shadow-2xl">
        <h2 class="text-3xl font-bold text-center text-gray-800 mb-8">Club Registration</h2>

        <!-- Display success message -->
        <c:if test="${not empty message}">
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                <span class="block sm:inline">${message}</span>
            </div>
        </c:if>

        <!-- Club Registration Form -->
        <form action="${pageContext.request.contextPath}/insertclubdata" method="POST" class="space-y-6" onsubmit="return validateForm()">
            <div>
                <label for="clubName" class="block text-sm font-medium text-gray-700 mb-2">Club Name</label>
                <input type="text" id="clubName" name="clubName" 
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" 
                    placeholder="Enter Club Name" required minlength="10">
                <small id="clubNameError" class="text-red-500 hidden">Club Name must be at least 10 characters.</small>
            </div>

            <div>
                <label for="clubCategory" class="block text-sm font-medium text-gray-700 mb-2">Club Category</label>
                <select id="clubCategory" name="clubCategory" 
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" 
                    required>
                    <option value="" disabled selected>Select a Category</option>
                    <option value="Social">Social</option>
                    <option value="Technical">Technical</option>
                    <option value="Non-Tech">Non-Tech</option>
                </select>
            </div>

            <div>
                <label for="clubEmail" class="block text-sm font-medium text-gray-700 mb-2">Club Email</label>
                <input type="email" id="clubEmail" name="clubEmail" 
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" 
                    placeholder="example@club.com" required>
                <small id="emailError" class="text-red-500 hidden">Please enter a valid email address.</small>
            </div>

            <div>
                <label for="branch" class="block text-sm font-medium text-gray-700 mb-2">Branch</label>
                <select id="branch" name="branch" 
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" 
                    required>
                    <option value="" disabled selected>Select Your Branch</option>
                    <option value="CSE">Computer Science and Engineering (CSE)</option>
                    <option value="ECE">Electronics and Communication Engineering (ECE)</option>
                    <option value="CS-IT">Computer Science and Information Technology (CS-IT)</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div>
                <label for="password" class="block text-sm font-medium text-gray-700 mb-2">Password</label>
                <input type="password" id="password" name="password" 
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" 
                    placeholder="Enter your password" required>
                <small id="passwordError" class="text-red-500 hidden">Password must be at least 7 characters long, including one uppercase, one lowercase, and one special character.</small>
            </div>

            <div>
                <button type="submit" 
                    class="w-full submit-btn text-white font-bold py-3 px-4 rounded-lg hover:opacity-90 transition duration-300 ease-in-out">
                    Register Club
                </button>
            </div>
        </form>

        <script>
            function validateForm() {
                let valid = true;
                
                // Club Name Validation
                const clubName = document.getElementById('clubName').value;
                if (clubName.length < 10) {
                    document.getElementById('clubNameError').classList.remove('hidden');
                    valid = false;
                } else {
                    document.getElementById('clubNameError').classList.add('hidden');
                }

                // Email Validation
                const email = document.getElementById('clubEmail').value;
                const emailPattern = /^[^@]+@[^@]+\.[^@]+$/;
                if (!emailPattern.test(email)) {
                    document.getElementById('emailError').classList.remove('hidden');
                    valid = false;
                } else {
                    document.getElementById('emailError').classList.add('hidden');
                }

                // Password Validation
                const password = document.getElementById('password').value;
                const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{7,}$/;
                if (!passwordPattern.test(password)) {
                    document.getElementById('passwordError').classList.remove('hidden');
                    valid = false;
                } else {
                    document.getElementById('passwordError').classList.add('hidden');
                }

                return valid;
            }
        </script>
    </div>
</body>
</html>
