<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>

<%
// Retrieve session attributes
String log = (String) session.getAttribute("login");
Integer customerId = (Integer) session.getAttribute("customerId");
ResultSet rs1 = null;
ResultSet rs2 = null;

// Redirect to the main page if not logged in
if (log == null) {
    response.sendRedirect("/EScrap");
}

try {
    // Establish database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

    // Query 1: Retrieve individual cart items for the logged-in customer
    PreparedStatement stmt1 = connection.prepareStatement("SELECT * FROM cart WHERE customerId = ?");
    stmt1.setInt(1, customerId);
    rs1 = stmt1.executeQuery();

    // Query 2: Calculate total quantity in the cart for the logged-in customer
    PreparedStatement stmt2 = connection.prepareStatement("SELECT SUM(quantity) AS totalQuantity FROM cart WHERE customerId = ?");
    stmt2.setInt(1, customerId);
    rs2 = stmt2.executeQuery();
} catch (SQLException | ClassNotFoundException e) {
    e.printStackTrace();
    // Handle exceptions (e.g., log or display an error message)
}
%>

<!DOCTYPE html>

<html>

<head>
    <%@ include file="css.jsp" %>
    <title>Order: My Cart</title>
</head>

<body>
    <%@ include file="Navbar.jsp" %>

    <h2 class="text-center">My Cart</h2>
    <hr class="w-100">

    <div class="container-fluid mx-auto">
        <%
        if (rs2.next()) {
            int totalQuantity = rs2.getInt("totalQuantity");
        %>
        <%
        while (rs1.next()) {
        %>
        <!-- Your existing card display code -->
        <div class="card mb-3" style="max-width: 540px;">
            <div class="row g-0">
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title"><%=rs1.getString("item_name")%></h5>
                        <p class="card-text">
                            Quantity: <%=rs1.getString("quantity")%>
                        </p>
                        <p class="card-text">
                            Price: &#8377;<%=rs1.getString("finalprice")%>
                        </p>
                        <form action="assets/jsp/deleteItem.jsp" method="post">
                            <input type="hidden" name="itemId" value="<%=rs1.getString("item_id")%>">
                            <button type="submit" class="btn btn-danger">Delete Item</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
        }
        %>

        <%-- Check if the total quantity is more than 5kg --%>
        <%
        if (totalQuantity > 5) {
        %>
        <a href="bookSchedule.jsp" class="btn btn-warning mb-5 w-100">Schedule Pick-Up</a>
        <%
        } else if (totalQuantity > 0) {
        %>
        <p class="text-center">Total quantity must be more than 5kg to schedule pick-up.</p>
        <%
        } else {
        %>
        <p class="text-center">Your cart is empty.</p>
        <%
        }
        %>
        <%
        }
        %>
    </div>

    <%@ include file="script.jsp" %>

</body>

</html>
