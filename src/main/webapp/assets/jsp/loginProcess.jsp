<%@ page import="java.sql.*" %>

<%
String mobile = request.getParameter("mobile");
String password = request.getParameter("password");
String errorMessage = "";
String adminNumber = "7617602135";
String adminPassword = "admin";

Connection connection = null;
PreparedStatement stmt1 = null;
ResultSet rs1 = null;
session = request.getSession(true); // Initialize session

try {
    if (mobile != null && password != null) {
        if (mobile.equals(adminNumber) && password.equals(adminPassword)) {
            response.sendRedirect("/EScrap/admin_dashboard.jsp");
        } else {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

            stmt1 = connection.prepareStatement("SELECT customerId FROM user WHERE mobile = ? AND password = ?");
            stmt1.setString(1, mobile);
            stmt1.setString(2, password);

            rs1 = stmt1.executeQuery();

            if (rs1.next()) {
                int customerId = rs1.getInt(1);
                session.setAttribute("customerId", customerId);
                session.setAttribute("login", "success");
                response.sendRedirect("/EScrap");
            } else {
                errorMessage = "Invalid username or password.";
            %>
                <script>
                    alert("<%= errorMessage %>");
                    window.location.href = "/EScrap/login.jsp";
                </script>
            <%
            }
        }
    } else {
        // Handle the case where mobile or password is null
        errorMessage = "Mobile or password is null.";
    %>
        <script>
            alert("<%= errorMessage %>");
            window.location.href = "/EScrap/login.jsp";
        </script>
    <%
    }
} catch (SQLException | ClassNotFoundException e) {
    e.printStackTrace();
    response.sendRedirect("/EScrap/error.jsp");
} finally {
    try {
        if (rs1 != null) rs1.close();
        if (stmt1 != null) stmt1.close();
        if (connection != null) connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
