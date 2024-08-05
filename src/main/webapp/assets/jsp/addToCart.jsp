<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%
String item = request.getParameter("item");
String quantity = request.getParameter("quantity");
String finalPrice = request.getParameter("final-price");
Integer customerId = (Integer) session.getAttribute("customerId");

try {
    int status = 0;
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

    PreparedStatement stmt = connection.prepareStatement("INSERT INTO cart (customerId, item_name, quantity, finalprice) VALUES (?, ?, ?, ?)");
    stmt.setInt(1, customerId);
    stmt.setString(2, item);
    stmt.setString(3, quantity);
    stmt.setString(4, finalPrice);

    status = stmt.executeUpdate();

    if (status > 0) {
        session.setAttribute("item", "Item Added Successfully to Cart.");
        response.sendRedirect("/EScrap/order.jsp");
    }
} catch (SQLException | ClassNotFoundException e) {
    System.out.println(e);
    e.printStackTrace();
}
%>
