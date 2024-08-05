<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="css.jsp"%>
    <link rel="stylesheet" href="assets/css2/bookSchedule.css">
    <title>Order: My Cart</title>
</head>
<body>

    <%@ include file="Navbar.jsp"%>

   <div class="container-fluid mx-auto">
   
    <h2 class="text-center">Schedule Pick-Up</h2>
    <hr class="w-100">
    
        <form action="assets/jsp/scheduleProcess.jsp" method="post">
            <label for="pickup-date">Pickup Date:</label>
            <input type="date" id="pickup-date" name="pickup-date" required>

            <label for="selectedTimePeriod">Select Time Period:</label> 
								<select id="selectedTimePeriod" name="selectedTimePeriod" required>
									<option value="7am-12pm">None</option>
									<option value="7am-12pm">7 am to 12 pm</option>
									<option value="12pm-3pm">12 pm to 3 pm</option>
									<option value="3pm-6pm">3 pm to 6 pm</option>
								</select>

				<button type="submit" class="btn-one txt btn"
					style="padding: 0px 25px; font-size: 10px;">
					<span class="txt" style="font-size: 10px; text-align: center;">
						Processed To Checkout </span>
				</button>
			
        </form>
        
    </div>

    <%@ include file="script.jsp"%>
    <script>
        function validateForm() {
            var currentDate = new Date();
            var currentTime = new Time();
            var selectedDate = new Date(document.getElementById("pickup-date").value);
            var selectedTime = document.getElementById("pickup-time").value;

            // Check if the selected date is in the future
            if (selectedDate <= currentDate) {
                alert("Please select a valid date.");
                return false;
            }

            

            return true;
        }
    </script>
</body>
</html>
