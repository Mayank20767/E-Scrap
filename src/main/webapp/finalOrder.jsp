<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html lang="en">
<head>
 <%@ include file="css.jsp"%>
<title>Order: My Cart</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            margin: 0px;
        }

        .container-fluid {
            max-width: 600px; /* Adjust the maximum width as needed */
    		margin: 100px auto;
    		padding: 20px;
    		background-color: #f4f4f4;
   			box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input, button, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }
        
        input,textarea {
            border: 1px solid black;
        }

        textarea {
            resize: vertical; /* Allow vertical resizing of textarea */
        }
    </style>
</head>
<body>

<%@ include file="../../Navbar.jsp"%>

	

	<div class="container-fluid mx-auto">
	
	<h2 class="text-center">Address</h2>
	<hr class="w-100">
	
     <form action="assets/jsp/finalOrderProcess.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="mobile">Mobile Number:</label>
        <input type="tel" id="mobile" name="mobile" required>

        <label for="city">City:</label>
        <input type="text" id="city" name="city" required>

        <label for="pincode">Pin Code:</label>
        <input type="text" id="pincode" name="pincode" required>

        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="4" required></textarea>

        <button type="submit" class="btn-one txt btn"
					style="padding: 0px 25px; font-size: 10px;">
					<span class="txt" style="font-size: 10px; text-align: center;">
						Place Order </span>
				</button>
    </form>
</div>

   		<%@ include file="script.jsp"%>
</body>
</html>
