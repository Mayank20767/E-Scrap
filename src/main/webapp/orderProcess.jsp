<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    // Initialize or retrieve the ArrayList from the session
    List<String> orderArrayList = (List<String>) session.getAttribute("orderArrayList");

    if (orderArrayList == null) {
        orderArrayList = new ArrayList<>();
        session.setAttribute("orderArrayList", orderArrayList);
    }

    // Get parameters from the request
    String selectedItem = request.getParameter("itemDropdown");
    String quantity = request.getParameter("quantity");

    // Add the selected item and quantity to the ArrayList
    String order = selectedItem + " - " + quantity + " Kg";
    orderArrayList.add(order);
%>