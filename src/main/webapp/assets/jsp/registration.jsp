<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
// Retrieve user input parameters
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
String password = request.getParameter("password");
String rePassword = request.getParameter("re_password");

Connection connection = null;
PreparedStatement stmt = null;
PreparedStatement stmt1 = null;
ResultSet rs = null;

try {

    // Establish database connection
    Class.forName("com.mysql.cj.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

    // Check if the mobile number is already registered
    String checkUserQuery = "SELECT * FROM user WHERE mobile=?";
    stmt1 = connection.prepareStatement(checkUserQuery);
    stmt1.setString(1, mobile);
    rs = stmt1.executeQuery();

    if (rs.next()) {
        session.setAttribute("notRegistered", true);
        // Mobile number is already registered
        response.sendRedirect("/EScrap/registration.jsp");
        return;
    } else {
        if (password.equals(rePassword)) {
            // Insert user details into the 'user' table
            String insertUserQuery = "INSERT INTO user (name, mobile, email, password) VALUES (?, ?, ?, ?)";
            stmt = connection.prepareStatement(insertUserQuery);
            stmt.setString(1, name);
            stmt.setString(2, mobile);
            stmt.setString(3, email);
            stmt.setString(4, password);

            // Execute the query and get the number of affected rows
            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                // Registration successful  
                session.setAttribute("registered", true);
                // Redirect to a welcome page or dashboard
                response.sendRedirect("/EScrap/login.jsp");
            } else {
                // Registration failed
                response.sendRedirect("registration.jsp?error=registrationFailed");
            }
        } else {
            session.setAttribute("wrongPassword", true);
            // Passwords do not match
            response.sendRedirect("/EScrap/registration.jsp");
        }
    }
} catch (SQLException | ClassNotFoundException e) {
    e.printStackTrace();
    // Handle database or class loading errors
    response.sendRedirect("registration.jsp?error=databaseError");
} finally {
    // Close database resources in a finally block
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (stmt1 != null) stmt1.close();
        if (connection != null) connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
