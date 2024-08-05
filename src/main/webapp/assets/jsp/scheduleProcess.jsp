<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%
Connection connection = null;
Integer customerId = (Integer) session.getAttribute("customerId");

try {
    String pd = request.getParameter("pickup-date");
    String pt = request.getParameter("pickup-time");

    Class.forName("com.mysql.cj.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

    // Retrieve cart items
    PreparedStatement stmt1 = connection.prepareStatement("SELECT * FROM cart Where customerId=?");
    stmt1.setInt(1, customerId);
    ResultSet rs1 = stmt1.executeQuery();

    List<String> cart = new ArrayList<>();
    while (rs1.next()) {
        cart.add(rs1.getString("item_name"));
        cart.add(rs1.getString("quantity"));
        cart.add(rs1.getString("finalprice"));
        /* cart.add(";"); */
        if (!rs1.isLast()) {
            cart.add(",");
        }
    } // Closing brace for the while loop iterating over cart items

    // Check if the customerId exists in the schedule table
    PreparedStatement stmt2 = connection.prepareStatement("SELECT customerId FROM schedule");
    ResultSet rs2 = stmt2.executeQuery();

    while (rs2.next()) {
        if (rs2.getInt("customerId") == customerId) {
            // Update existing schedule entry
            PreparedStatement stmt3 = connection.prepareStatement("UPDATE schedule SET cart=?, date=?, time=? WHERE customerId=?");
            stmt3.setString(1, cart.toString());
            stmt3.setString(2, pd);
            stmt3.setString(3, pt);
            stmt3.setInt(4, customerId);
            stmt3.executeUpdate();

            // Assuming you want to use session to store a success message
            session.setAttribute("schedule", "Scheduled Successfully.");
            response.sendRedirect("/EScrap/finalOrder.jsp");
        }
    }

    // If customerId doesn't exist, insert a new schedule entry
    PreparedStatement stmt4 = connection.prepareStatement("INSERT INTO schedule(cart, customerId, date, time) VALUES (?, ?, ?, ?)");
    stmt4.setString(1, cart.toString());
    stmt4.setInt(2, customerId);
    stmt4.setString(3, pd);
    stmt4.setString(4, pt);
    int status = stmt4.executeUpdate();

    if (status > 0) {
        // Assuming you want to use session to store a success message
        session.setAttribute("schedule", "Scheduled Successfully.");
        response.sendRedirect("/EScrap/finalOrder.jsp");
    }

} catch (ClassNotFoundException | SQLException e) {
    // Handle exceptions (e.g., log or display an error message)
    e.printStackTrace();
} finally {
    // Close resources in a finally block
    try {
        if (connection != null) connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
