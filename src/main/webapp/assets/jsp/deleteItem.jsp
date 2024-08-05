<%@ page import="java.sql.*" %>

<%
String itemId = request.getParameter("itemId"); // Assuming you have an item ID in your database
Connection connection = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

    // Assuming you have a column named 'item_id' in your 'cart' table
    String deleteQuery = "DELETE FROM cart WHERE item_id=?";
    PreparedStatement deleteStmt = connection.prepareStatement(deleteQuery);
    deleteStmt.setString(1, itemId);

    int rowsAffected = deleteStmt.executeUpdate();

    if (rowsAffected > 0) {
        // Item deleted successfully
        response.sendRedirect("/EScrap/myCart.jsp");
    } else {
        // Item not found or deletion failed
        response.sendRedirect("/EScrap/myCart.jsp?error=delete_failed");
    }
} catch (SQLException | ClassNotFoundException e) {
    e.printStackTrace();
    response.sendRedirect("/EScrap/myCart.jsp?error=delete_failed");
} finally {
    if (connection != null) {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
