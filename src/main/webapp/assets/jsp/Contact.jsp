
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String sub = request.getParameter("subject");
    String mesg = request.getParameter("message");

    try {
    	int status = 0;
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");
             
                PreparedStatement stmt = connection.prepareStatement("insert into contact_us(name, mobile, email, subject, message) VALUES (?, ?, ?, ?, ?)");
                    stmt.setString(1, name);
                    stmt.setString(2, phone);
                    stmt.setString(3, email);
                    stmt.setString(4, sub);
                    stmt.setString(5, mesg);                   
                   status = stmt.executeUpdate();
                   if(status>0){
                   response.sendRedirect("/EScrap/contactus.jsp");
                   }
    } catch (ClassNotFoundException | SQLException e) {
        // Handle exceptions (e.g., log or display an error message)
        e.printStackTrace();
    }
%>
    