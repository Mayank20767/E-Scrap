<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.List" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Page</title>
</head>
<body>
    <!-- Total Sales -->
    <% 
        Connection connection = null;
        // Assuming customerId is available in session
        int finalPrice=0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

            // Retrieve data from the order_details table
            PreparedStatement selectStmt = connection.prepareStatement("SELECT finalPrice FROM order_details");
            ResultSet rs = selectStmt.executeQuery();

            // Iterate over the result set
            while (rs.next()) {
                 finalprice = 

                // Split cartData and addressData based on a separator (assuming semicolon here)
                String[] cartItems = cartData.split(",,");
                /* String[] addressDetails = addressData.split(","); */

                 // Initialize finalPrice inside the loop

                for (String item : cartItems) {
                    String[] itemDetails = item.split(",");
                    String thirdElement = itemDetails.length > 2 ? itemDetails[2] : "";
                    
                    // Remove non-numeric characters
                    String numericString = thirdElement.replaceAll("[^0-9]", "");

                    // Convert the numeric string to an integer
                    int thirdElementAsInt = 0; // Default value if conversion fails
                    try {
                        thirdElementAsInt = Integer.parseInt(numericString);
                        finalPrice = finalPrice + thirdElementAsInt;
                        session.setAttribute("finalPrice", finalPrice);
                    } catch (NumberFormatException e) {
                        out.println(e.getMessage());
                    } 
                }
            } // Closing brace for the while loop
        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
        } finally {
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
 --%>