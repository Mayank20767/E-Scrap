<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Orders</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css2/AdminEmp.css">
<style>
/* Reset some default styles */
body, h1, h2, h3, p, ul, li {
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Arial', sans-serif;
}

.container {
    display: flex;
}

/* Main content styles */
.recent-orders {
    flex: 1;
    padding: 20px;
}

h2 {
    margin-bottom: 20px;
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

/* Responsive styles */
@media only screen and (max-width: 768px) {
    .container {
        flex-direction: column;
    }

    aside {
        width: 100%;
    }

    .recent-orders {
        padding: 10px;
    }
}

</style>
</head>
<body>

	<%
	// Variables
	Set<Integer> pincodeList = new LinkedHashSet<>();
	List<Integer> orderIdList = new ArrayList<>();
	List<Map<String, Object>> tableData = new ArrayList<>();

	String date = request.getParameter("selectedDate");
	String time = request.getParameter("selectedTimePeriod");

	Connection connection = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

		// Retrieve data from the order_details table
		PreparedStatement selectStmt = connection.prepareStatement("SELECT * FROM order_details WHERE date=? AND time=?");
		selectStmt.setString(1, date);
		selectStmt.setString(2, time);
		ResultSet rs = selectStmt.executeQuery();

		// Iterate over the result set
		while (rs.next()) {
			orderIdList.add(rs.getInt("order_id"));
			pincodeList.add(rs.getInt("pincode"));
		}
	%>

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
				<a href="http://localhost:8080/EScrap/admin_dashboard.jsp" class="sidebar-link "
					data-section="dashboard-section"> <span
					class="material-icons-sharp">dashboard</span>
					<h3>Dashboard</h3>
				</a> <a href="http://localhost:8080/EScrap/employee.jsp" class="sidebar-link" data-section="staff-section">
					<span class="material-icons-sharp">person_outline</span>
					<h3>Staffs</h3>
				</a> <a href=" http://localhost:8080/EScrap/fetch.jsp" class="sidebar-link active" data-section="track-section">
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
		
		<div class="recent-orders">
			<h2>Recent Orders</h2>
			<table>
				<thead>
					<tr>
						<th>Pincode</th>
						<th>Customer ID</th>
						<th>Cart Data</th>
						<th>Address</th>
						<th>Price</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Integer pincode : pincodeList) {
						for (int j = 0; j < orderIdList.size(); j++) {
							int orderId = orderIdList.get(j);
							PreparedStatement selectStmt2 = connection
							.prepareStatement("SELECT * FROM order_details WHERE order_id=? and pincode=?");
							selectStmt2.setInt(1, orderId);
							selectStmt2.setInt(2, pincode);
							ResultSet rs1 = selectStmt2.executeQuery();

							while (rs1.next()) {
						int customerId = rs1.getInt("customerId");
						String cartData = rs1.getString("cart");
						String address = rs1.getString("address");
						int price = rs1.getInt("finalPrice");

						// Create a map to represent a row in the table
						Map<String, Object> row = new HashMap<>();
						row.put("Customer ID", customerId);
						row.put("Cart Data", cartData);
						row.put("Address", address);
						row.put("Price", price);

						// Add the row to the list
						tableData.add(row);
					%>
					<tr>
						<td><%=pincode%></td>
						<td><%=customerId%></td>
						<td><%=cartData%></td>
						<td><%=address%></td>
						<td><%=price%></td>
					</tr>
					<%
					}
					}
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<%
	} catch (Exception e) {
	out.println(e);
	} finally {
	// Close database resources in a finally block
	try {
		if (connection != null) {
			connection.close();
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
	%>

</body>
</html>
