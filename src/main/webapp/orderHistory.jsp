<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="css.jsp"%>
<link rel="stylesheet" href="assets/css2/orderHistory.css">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>E-scrap</title>
</head>
<body>

	<%
	
	Connection connection = null;
	// Assuming customerId is available in session
	Integer customerId = (Integer) session.getAttribute("customerId");

	try {
		
		int ordersFound = 0;
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

		// Retrieve data from the order_details table
		PreparedStatement selectStmt = connection.prepareStatement("SELECT * FROM order_details WHERE customerId=?");
		selectStmt.setInt(1, customerId);
		ResultSet rs = selectStmt.executeQuery();

		// Iterate over the result set
		while (rs.next()) {
			String cartData = rs.getString("cart");
			String date = rs.getString("date");
			String time = rs.getString("time");
			String addressData = rs.getString("address");
			int orderId = rs.getInt("order_id");
			ordersFound++;

			// Split cartData and addressData based on a separator (assuming semicolon here)
			String[] cartItems = cartData.split(",,");
			String[] addressDetails = addressData.split(",");

			// Check if the customerId in the result set matches the current session's customerId
			if (ordersFound == 1) {
				int finalPrice=0;
	%>
	<%@ include file="Navbar.jsp"%>
	<section class="main-slider style1">
	<h2>Order Details</h2>
<div class="fix">
	<div class="point1">
	<h3>Customer Details</h3>
		<p>
			<strong>Name:</strong>
			<%=addressDetails.length > 0 ? addressDetails[0] : ""%></p>
		<p class="email">
			<strong >Email:</strong>
			<%=addressDetails.length > 1 ? addressDetails[1] : ""%></p>
		<p>
			<strong>Mobile Number:</strong>
			<%=addressDetails.length > 2 ? addressDetails[2] : ""%></p>
		<p>
			<strong>City:</strong>
			<%=addressDetails.length > 3 ? addressDetails[3] : ""%></p>
		<p>
			<strong>Pincode:</strong>
			<%=addressDetails.length > 4 ? addressDetails[4] : ""%></p>
		<p>
			<strong>Address:</strong>
			<%=addressDetails.length > 5 ? addressDetails[5] : ""%></p>
	</div>
		
	<div class="point2">
		<h3>Order Details</h3>
		<p>
			<strong>Order Id:</strong>
			<%=orderId%></p>
		<p>
			<strong>Date:</strong>
			<%=date%></p>
		<p>
			<strong>Time:</strong>
			<%=time%></p>
	</div>
</div>
	<h3>Cart Details</h3>
	<table>
		<thead>
			<tr>
				<th>Item Name</th>
				<th>Quantity</th>
				<th>Price</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (String item : cartItems) {
				String[] itemDetails = item.split(",");
			%>
			<tr>
				<td><%=itemDetails.length > 0 ? itemDetails[0] : ""%></td>
				<td><%=itemDetails.length > 1 ? itemDetails[1] : ""%></td>
				<td><%=itemDetails.length > 2 ? itemDetails[2] : ""%></td>
			</tr>
			<%
				// Get the third element from itemDetails (if it exists)
				String thirdElement = itemDetails.length > 2 ? itemDetails[2] : "";
				
				// Remove non-numeric characters
				String numericString = thirdElement.replaceAll("[^0-9]", "");

				// Convert the numeric string to an integer
				int thirdElementAsInt = 0; // Default value if conversion fails
				try {
					thirdElementAsInt = Integer.parseInt(numericString);
				} catch (NumberFormatException e) {
					out.println(e.getMessage());
				}
				 finalPrice = finalPrice + thirdElementAsInt;
			}
			%>
			<tr>
        		<td colspan="2">Final Price:</td>
        		<td><%= finalPrice %></td>
   		    </tr>
		</tbody>
	</table>
	<!-- Download button for each session -->
	<button type="button" class="btn-one" onclick="downloadPDF()" aria-expanded="false" style="padding: 2px 20px;">
			<span class="txt" style="font-size: 10px;" >Download PDF</span>	
	</button>


	<script>
		function downloadPDF() {
			// Open a new window and print the content
			var newWindow = window.open('', '_blank');
			newWindow.document
					.write('<html><head><title>Order Details</title></head><body>');
			newWindow.document.write(document.documentElement.innerHTML);
			newWindow.document.write('</body></html>');
			newWindow.document.close();

			// Wait for the new window to be ready before calling print
			newWindow.onload = function() {
				newWindow.print();
			};
		}
	</script>
	<%
	} else {
		int finalPrice=0;
	%>
	<h2>Order Details</h2>
<div class="d-flex fix">
	<div class="point1">
		<h3>Customer Details</h3>
		<p>
			<strong>Name:</strong>
			<%=addressDetails.length > 0 ? addressDetails[0] : ""%></p>
		<p>
			<strong >Email:</strong>
			<%=addressDetails.length > 1 ? addressDetails[1] : ""%></p>
			
		<p>
			<strong>Mobile Number:</strong>
			<%=addressDetails.length > 2 ? addressDetails[2] : ""%></p>
		<p>
			<strong>City:</strong>
			<%=addressDetails.length > 3 ? addressDetails[3] : ""%></p>
		<p>
			<strong>Pincode:</strong>
			<%=addressDetails.length > 4 ? addressDetails[4] : ""%></p>
		<p>
			<strong>Address:</strong>
			<%=addressDetails.length > 5 ? addressDetails[5] : ""%></p>
	</div>
		
	<div class="point2">
	  <h3>Order Details</h3>
		<p>
			<strong>Order Id:</strong>
			<%=orderId%></p>
		<p>
			<strong>Date:</strong>
			<%=date%></p>
		<p>
			<strong>Time:</strong>
			<%=time%></p>
	</div>
</div>
	<h3>Cart Details</h3>
	<table>
		<thead>
			<tr>
				<th>Item Name</th>
				<th>Quantity</th>
				<th>Price</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (String item : cartItems) {
				String[] itemDetails = item.split(",");
			%>
			<tr>
				<td><%=itemDetails.length > 0 ? itemDetails[0] : ""%></td>
				<td><%=itemDetails.length > 1 ? itemDetails[1] : ""%></td>
				<td><%=itemDetails.length > 2 ? itemDetails[2] : ""%></td>
			</tr>
			<%
				// Get the third element from itemDetails (if it exists)
				String thirdElement = itemDetails.length > 2 ? itemDetails[2] : "";
				
				// Remove non-numeric characters
				String numericString = thirdElement.replaceAll("[^0-9]", "");

				// Convert the numeric string to an integer
				int thirdElementAsInt = 0; // Default value if conversion fails
				try {
					thirdElementAsInt = Integer.parseInt(numericString);
				} catch (NumberFormatException e) {
					out.println(e.getMessage());
				}
				 finalPrice = finalPrice + thirdElementAsInt;
			}
			%>
			<tr>
        		<td colspan="2">Final Price:</td>
        		<td><%= finalPrice %></td>
   		    </tr>
		</tbody>
	</table>
	
	
	<button type="button" class="btn-one" onclick="downloadPDF()" aria-expanded="false" style="padding: 2px 20px;">
			<span class="txt" style="font-size: 10px;" >Download PDF</span>	
	</button>
	
</section>	

	<script>
		function downloadPDF() {
			// Open a new window and print the content
			var newWindow = window.open('', '_blank');
			newWindow.document
					.write('<html><head><title>Order Details</title></head><body>');
			newWindow.document.write(document.documentElement.innerHTML);
			newWindow.document.write('</body></html>');
			newWindow.document.close();

			// Wait for the new window to be ready before calling print
			newWindow.onload = function() {
				newWindow.print();
			};
		}
	</script>
	<%
	}
	}

	if (ordersFound == 0) {
	%>
	<%@ include file="Navbar.jsp"%>
	<div>
		<p>No orders available. Please order something.</p>
	</div>
	<%
	}
	} catch (SQLException | ClassNotFoundException e) {
	System.out.println(e);
	e.printStackTrace();
	} finally {
	// Close resources (connection, statements, etc.) in a finally block
	if (connection != null) {
	try {
		connection.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
	}
	%>
	
<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>

</body>
</html>
