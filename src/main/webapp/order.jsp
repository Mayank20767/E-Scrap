<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String item = (String) session.getAttribute("item");

String placed = (String) session.getAttribute("placed");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>E-scrap</title>
<%@ include file="css.jsp"%>
<link rel="stylesheet" href="assets/css2/order2.css">
</head>
<body>

	<div class="boxed_wrapper ltr">

		<%@ include file="Navbar.jsp"%>

		<%
		if (item != null) {
		%>
		<div
			class="alert alert-success alert-dismissible fade show text-center massage"
			role="alert">
			<%=item%>
			<button type="button" onClick="closeAlert()" class="btn-close"
				data-bs-dismiss="alert" aria-label="Close">X</button>
		</div>
		<%
		}
		%>


		<form action="assets/jsp/addToCart.jsp" method="post">
			<h2 class="text-center mb-4">Create Order List</h2>
			<hr style="width: 100%;">
			<label for="item">Select Item:</label> <select id="item" name="item"
				required>
				<option value="iron">Iron-50&#8377;</option>
				<option value="tin">Tin-20&#8377;</option>
				<option value="plastic">Plastic-10&#8377;</option>
				<option value="steel">Steel-80&#8377;</option>
				<option value="copper">Copper-30&#8377;</option>
				<!-- Add more items as needed -->
			</select> <label for="quantity">Quantity:</label> <input
				style="border: 1px solid black;" type="number" id="quantity"
				name="quantity" onchange="updatePrice()" required=""> <label
				for="final-price">Final Price:</label> <input type="text"
				id="final-price" name="final-price" readonly>

			<div style="display: flex; justify-content: center;">
				<button type="submit" class="btn-one txt"
					style="padding: 0px 25px; font-size: 10px;">
					<span class="txt" style="font-size: 10px; text-align: center;">
						Add To Cart </span>
				</button>
			</div>

		</form>


	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>

	<script>
		function updatePrice() {
			var selectedItem = document.getElementById("item").value;
			var quantity = document.getElementById("quantity").value;

			var prices = {
				"iron" : 50,
				"tin" : 20,
				"plastic" : 10,
				"steel" : 80,
				"copper" : 30,
			};
			var finalPrice = quantity * prices[selectedItem];
			document.getElementById("final-price").value = finalPrice;
		}

		function closeAlert() {
	<%session.removeAttribute("item");%>
		var alertElement = document.querySelector('.alert');
			if (alertElement) {
				alertElement.remove();
			}
		}

		document.addEventListener('DOMContentLoaded', function() {
			var alertElement = document.querySelector('.alert');
			if (alertElement) {
				setTimeout(function() {
					closeAlert();
				}, 1000);
			}
		});
	</script>

</body>
</html>
