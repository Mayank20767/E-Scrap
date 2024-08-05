<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String city = request.getParameter("city");
String pincode = request.getParameter("pincode");
String address = request.getParameter("address");
Integer customerId = (Integer) session.getAttribute("customerId");

List<String> solderAddress = new ArrayList<>();
solderAddress.add(name);
solderAddress.add(email);
solderAddress.add(mobile);
solderAddress.add(city);
solderAddress.add(pincode);
solderAddress.add(address);

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

    // Retrieve data from the schedule table
    PreparedStatement selectStmt = connection.prepareStatement("SELECT * FROM schedule WHERE customerId=?");
    selectStmt.setInt(1, customerId);
    ResultSet rs = selectStmt.executeQuery();

    if (rs.next()) {
        String cartData = rs.getString("cart");
        String date = rs.getString("date");
        String time = rs.getString("time");

        // Insert data into order_details table
        PreparedStatement insertStmt = connection.prepareStatement("INSERT INTO order_details (cart, date, time, address, customerId) VALUES (?, ?, ?, ?, ?)");

        insertStmt.setString(1, cartData);
        insertStmt.setString(2, date);
        insertStmt.setString(3, time);
        insertStmt.setString(4, String.join(", ", solderAddress));
        insertStmt.setInt(5, customerId);

        int status = insertStmt.executeUpdate();

        if (status > 0) {
            // Delete entries from cart and schedule tables
            String deleteQuery = "DELETE FROM cart WHERE customerId=?";
            PreparedStatement deleteStmt = connection.prepareStatement(deleteQuery);
            deleteStmt.setInt(1, customerId);
            deleteStmt.executeUpdate();

            String deleteQuery2 = "DELETE FROM schedule WHERE customerId=?";
            PreparedStatement deleteStmt2 = connection.prepareStatement(deleteQuery2);
            deleteStmt2.setInt(1, customerId);
            deleteStmt2.executeUpdate();
            // Set session attribute for order placement
            session.setAttribute("orderPlaced", true);

            // Redirect to the main page
            response.sendRedirect("/EScrap");
        }
    }
} catch (SQLException | ClassNotFoundException e) {
    System.out.println(e);
    e.printStackTrace();
}
%>
