<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Register ID</title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
            line-height: 1.6;
        }

        h1 {
            color: #333;
            text-align: center;
            border-bottom: 2px solid #5bc0de;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }

        form {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #555;
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #5bc0de;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #31b0d5;
        }

        p.success-message {
            color: #3c763d;
            background-color: #dff0d8;
            border: 1px solid #d6e9c6;
            padding: 15px;
            border-radius: 4px;
            text-align: center;
            margin-top: 20px;
        }

        @media (max-width: 600px) {
            body {
                padding: 10px;
            }

            form {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <h1>Register ID</h1>

    <%@ include file="adminsidebar.jsp" %>

    <!-- Form to submit Register ID -->
    <form action="insertregisterid" method="post">
        <label for="registerId">Enter Register ID:</label>
        <input type="text" id="registerId" name="RegisterId" required>
        <button type="submit">Submit</button>
    </form>

    <!-- Display success message if available -->
    <c:if test="${not empty message}">
        <p class="success-message">${message}</p>
    </c:if>
</body>
</html>