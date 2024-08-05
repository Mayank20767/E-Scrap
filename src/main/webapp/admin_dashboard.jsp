<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css2/slidebaradmin.css">
<link rel="stylesheet" href="assets/css2/admin.css">
</head>
<body>
	<%
	int finalPrice = 0;
	int weight = 0;

	// Retrieve the count from the session
	Integer count = (Integer) session.getAttribute("count");

	int lastOrderId = 0;
	Connection connection = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

		// Retrieve the last order ID
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("SELECT MAX(order_id) FROM order_details");

		if (resultSet.next()) {
			lastOrderId = resultSet.getInt(1);
			// Use lastOrderId as needed
		} else {
			// Handle the case when no orders are present in the table
			out.println("No orders found in the database.");
		}

		// Loop through each order to calculate the total finalPrice
		for (int i = 1; i <= lastOrderId; i++) {
			// Retrieve data from the order_details table for the specific order
			PreparedStatement selectStmt = connection.prepareStatement("SELECT * FROM order_details WHERE order_id=?");
			selectStmt.setInt(1, i); // Use i as the order ID
			ResultSet rs = selectStmt.executeQuery();

			if (rs.next()) {
		finalPrice += rs.getInt("finalPrice");
		weight += rs.getInt("weight");
			}
		}
	} catch (ClassNotFoundException | SQLException e) {
		// Handle exceptions appropriately in your application
		out.println("Error: " + e.getMessage());
	}
	%>

	<div class="container">
		<!-- Sidebar Section -->
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
				<a href="http://localhost:8080/EScrap/admin_dashboard.jsp" class="sidebar-link active"
					data-section="dashboard-section"> <span
					class="material-icons-sharp">dashboard</span>
					<h3>Dashboard</h3>
				</a> <a href="http://localhost:8080/EScrap/employee.jsp" class="sidebar-link" data-section="staff-section">
					<span class="material-icons-sharp">person_outline</span>
					<h3>Staffs</h3>
				</a> <a href="http://localhost:8080/EScrap/fetch.jsp" class="sidebar-link" data-section="track-section">
					<span class="material-icons-sharp">mail_outline</span>
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
		<!-- End of Sidebar Section -->

		<!-- Main Content -->
		<main>
			<div class="section" id="dashboard-section">
				<h1>Analytics</h1>
				<div class="analyse">
					<div class="sales">
						<div class="status">
							<div class="info">
								<h3>Total Sales</h3>
								<h1>
									Rs<%=finalPrice%></h1>
							</div>
						</div>
					</div>
					<div class="visits">
						<div class="status">
							<div class="info">
								<h3>Weight</h3>
								<h1><%=weight%></h1>
							</div>
						</div>
					</div>
					<div class="searches">
						<div class="status">
							<div class="info">
								<h3>Total Orders</h3>
								<h1><%=lastOrderId%></h1>
							</div>
						</div>
					</div>
					<div class="searches">
						<div class="status">
							<div class="info">
								<h3>Searches</h3>
								<h1><%=count%></h1>
							</div>
						</div>
					</div>
				</div>


				<div class="date-time-selection">
					<form action="fetch.jsp" method="get">
						<label for="selectedDate">Select Date:</label> 
						<input type="date" id="selectedDate" name="selectedDate" required> 
						<label for="selectedTimePeriod">Select Time Period:</label> 
								<select id="selectedTimePeriod" name="selectedTimePeriod" required>
									<option value="7am-12pm">7 am to 12 pm</option>
									<option value="12pm-3pm">12 pm to 3 pm</option>
									<option value="3pm-6pm">3 pm to 6 pm</option>
								</select>
								
						<button type="submit">Fetch Orders</button>
						
					</form>
				</div>

				<!-- Recent Orders Table -->
				<div class="recent-orders">
					<h2>Orders</h2>
					<table>
						<thead>
							<tr>
								<th>S.no</th>
								<th>Customer Id</th>
								<th>Order Id</th>
								<th>Price</th>
								<th>View Details</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 1; i <= lastOrderId; i++) {
								// Retrieve data from the order_details table for the specific order
								PreparedStatement selectStmt = connection.prepareStatement("SELECT * FROM order_details WHERE order_id=?");
								selectStmt.setInt(1, i); // Use i as the order ID
								ResultSet rs = selectStmt.executeQuery();
								if (rs.next()) {
							%>
							<tr>
								<td><%=i%></td>
								<td><%=rs.getInt("customerId")%></td>
								<td><%=rs.getInt("order_id")%></td>
								<td><%=rs.getInt("finalPrice")%></td>
								<td>view_details</td>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</main>
		<!-- End of Main Content -->
	</div>

	<script src="./js/index.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		function fetchData() {
			// Use JavaScript to make an asynchronous request to fetch data
			$.ajax({
				url : 'fetchDataServlet', // Replace with the actual servlet or endpoint to fetch data
				type : 'GET',
				success : function(response) {
					// Reload the page or update the data dynamically
					location.reload(true);
				},
				error : function(error) {
					console.error('Error fetching data:', error);
				}
			});
		}
	</script>

</body>
</html>
