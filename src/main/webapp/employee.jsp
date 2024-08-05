<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-scrap</title>
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css2/AdminEmp.css">
<style>
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
}

.section {
	margin-top:20px;
    padding: 20px;
    background-color: #f8f8f8;
}

h1, h2 {
    color: #333;
}

.subsection {
    margin-top: 20px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-top: 10px;
    color: #555;
}

input,
textarea {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    margin-bottom: 15px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}


</style>
</head>
<body>

	<div class="container">

		<aside>
			<div class="toggle">
				<div class="logo">
					<h2>
						Admin<span class="danger">Dashboard</span>
					</h2>
				</div>
				<div class="close" id="close-btn">
					<span class="material-icons-sharp"> close </span>
				</div>
			</div>

			<div class="sidebar">
				<!-- Sidebar links -->
				<a href="http://localhost:8080/EScrap/admin_dashboard.jsp"
					class="sidebar-link " data-section="dashboard-section"> <span
					class="material-icons-sharp">dashboard</span>
					<h3>Dashboard</h3>
				</a> <a href="http://localhost:8080/EScrap/employee.jsp" class="sidebar-link active" data-section="staff-section">
					<span class="material-icons-sharp">person_outline</span>
					<h3>Staffs</h3>
				</a> <a href=" http://localhost:8080/EScrap/fetch.jsp"
					class="sidebar-link" data-section="track-section"> <span
					class="material-icons-sharp">mail_outline</span>
					<h3>fetch data</h3>
				</a> <a href="#" class="sidebar-link" data-section="report-section">
					<span class="material-icons-sharp">inventory</span>
					<h3>Report</h3>

				</a> <a href="login.jsp"> <span class="material-icons-sharp">logout</span>
					<h3>Logout</h3>
				</a>
				<!-- Add other sidebar links as needed -->
			</div>
		</aside>

		<div class="section" id="staff-section">
			<h1>Staff Management</h1>
			<!-- Add Employee Section -->
			<div class="subsection" id="add-employee-section">
				<h2>Add Employee</h2>
				<form action="StaffProcess.jsp" method="post" id="employee-form">
					<label for="name">Name:</label> <input type="text" id="name"
						name="name" required> <label for="email">Email:</label> <input
						type="email" id="email" name="email" required> <label
						for="password">Password:</label> <input type="password"
						id="password" name="password" required> <label for="phone">Phone:</label>
					<input type="tel" id="phone" name="phone" required> <label
						for="address">Address:</label>
					<textarea id="address" name="address" required></textarea>

					<button type="submit">Add Employee</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>