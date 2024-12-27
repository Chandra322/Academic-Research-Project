<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --text-color: #333;
            --background-color: #f4f7f6;
            --card-background: #ffffff;
            --border-radius: 12px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', Arial, sans-serif;
            line-height: 1.6;
            background-color: var(--background-color);
            color: var(--text-color);
        }

        .profile-container {
            width: 100%;
            max-width: 900px;
            margin: 2rem auto;
            background-color: var(--card-background);
            border-radius: var(--border-radius);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .profile-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2rem;
            text-align: center;
            position: relative;
        }

        .profile-header h1 {
            font-size: 2rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .profile-header p {
            font-size: 0.9rem;
            opacity: 0.8;
        }

        .profile-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            padding: 2rem;
            background-color: var(--card-background);
        }

        .profile-details > div {
            background-color: #f9f9f9;
            padding: 1rem;
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .profile-details > div:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .profile-label {
            font-weight: 500;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            text-transform: uppercase;
        }

        .profile-value {
            font-weight: 400;
            color: var(--text-color);
            font-size: 1rem;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            padding: 1.5rem;
            background-color: #f4f4f4;
        }

        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background-color: var(--primary-color);
            color: white;
            border: 2px solid var(--primary-color);
        }

        .btn-edit:hover {
            background-color: #2980b9;
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }

        .btn-back {
            background-color: transparent;
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
        }

        .btn-back:hover {
            background-color: var(--primary-color);
            color: white;
        }

        @media screen and (max-width: 600px) {
            .profile-details {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="profile-header">
            <h1>User Profile</h1>
            <%@ include file="usersidebar.jsp" %>
            <p>View your personal information</p>
        </div>

        <div class="profile-details">
            <div>
                <span class="profile-label">Full Name</span>
                <span class="profile-value">${user.fullName}</span>
            </div>
            <div>
                <span class="profile-label">Gender</span>
                <span class="profile-value">${user.gender}</span>
            </div>
            <div>
                <span class="profile-label">Email</span>
                <span class="profile-value">${user.email}</span>
            </div>
            <div>
                <span class="profile-label">Mobile Number</span>
                <span class="profile-value">${user.mobileNumber}</span>
            </div>
            <div>
                <span class="profile-label">Date of Birth</span>
                <span class="profile-value">${user.dateOfBirth}</span>
            </div>
            <div>
                <span class="profile-label">City</span>
                <span class="profile-value">${user.city}</span>
            </div>
            <div>
                <span class="profile-label">State</span>
                <span class="profile-value">${user.state}</span>
            </div>
            <div>
                <span class="profile-label">District</span>
                <span class="profile-value">${user.district}</span>
            </div>
            <div>
                <span class="profile-label">Pincode</span>
                <span class="profile-value">${user.pincode}</span>
            </div>
            <div>
                <span class="profile-label">Country</span>
                <span class="profile-value">${user.country}</span>
            </div>
        </div>

        <div class="action-buttons">
<!--             <a href="/employee/profile/edit" class="btn btn-edit">Edit Profile</a> -->
           
        </div>
    </div>
</body>
</html>