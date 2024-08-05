<%
// Check if the order is placed
Boolean notRegistered = (Boolean) session.getAttribute("notRegistered");
if (notRegistered != null && notRegistered) {
    // Display a message with inline styles
    out.println("<html> <head> <style> body { text-align: center; } .name { color: red; background-color: #ffc0cb; padding: 10px; } </style> </head> <body> <p class='name'>Registration Unsuccessful Due To Same Mobile Number!</p> </body> </html>");

    // Reset the session attribute
    session.setAttribute("notRegistered", false);
}
%>


<%
// Check if the order is placed
Boolean wrongPassword = (Boolean) session.getAttribute("wrongPassword");
if (wrongPassword != null && wrongPassword) {
	// Display a message
    out.println("<html> <head> <style> body { text-align: center; } .name { color: red; background-color: #ffc0cb; padding: 10px; } </style> </head> <body> <p class='name'>Wrong rePassword!</p> </body> </html>");

	// Reset the session attribute
	session.setAttribute("wrongPassword", false);
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta tags and CSS links -->
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css2/Login.css">
    <link rel="stylesheet" href="assets/css2/new.css">
    <%@ include file="css.jsp"%>
    <meta charset="UTF-8">
    <title>E-scrap</title>
</head>

<body>
    <div class="boxed_wrapper ltr">

        <!-- Navigation Bar -->
        <%@ include file="Navbar.jsp"%>

        <!-- Breadcrumb Area -->
        <section class="breadcrumb-area">
            <div class="breadcrumb-area-bg" style="background-image: url(assets/images/contact.png);"></div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="inner-content">
                            <!-- Breadcrumb Menu -->
                            <div class="breadcrumb-menu" data-aos="fade-down" data-aos-easing="linear"
                                data-aos-duration="1500">
                                <ul>
                                    <li><a href="index.jsp">Home</a></li>
                                    <li class="active">Registration</li>
                                </ul>
                            </div>
                            <!-- Title -->
                            <div class="title" data-aos="fade-up" data-aos-easing="linear" data-aos-duration="1500">
                                <h2>Create Account</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Breadcrumb Area -->

        <!-- Registration Form Section -->
        <section class="service-details-area">
            <div class="main">
                <section class="signup">
                    <div class="container">
                        <div class="signup-content">
                            <!-- Registration Form -->
                            <form method="POST" id="signup-form" class="signup-form" onsubmit="return validateForm()"
                                action="assets/jsp/registration.jsp">
                                <h2 class="form-title">Registration</h2>
                                <!-- Name Input -->
                                <div class="form-group">
                                    <input type="text" class="form-input" name="name" id="name" placeholder="Your Name"
                                        required />
                                </div>
                                <!-- Phone Input -->
                                <div class="form-group">
                                    <input type="tel" id="phone" name="mobile" placeholder="Your Phone Number"
                                        class="form-input" pattern="[6789]\d{9}"
                                        title="Please enter a valid 10-digit mobile number" required>
                                </div>
                                <!-- Email Input -->
                                <div class="form-group">
                                    <input type="email" class="form-input" name="email" id="email"
                                        placeholder="Your Email" required>
                                </div>
                                <!-- Password Input -->
                                <div class="form-group">
                                    <label for="password" style="display: block; margin-bottom: 8px;">Password
                                        (8-15 characters with at least one number):</label>
                                    <input type="password" class="form-input" name="password" id="password"
                                        placeholder="Password" />
                                    <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"
                                        required></span>
                                </div>
                                <!-- Confirm Password Input -->
                                <div class="form-group">
                                    <input type="password" class="form-input" name="re_password" id="re_password"
                                        placeholder="Repeat your password" required />
                                </div>
                                <!-- Submit Button -->
                                <div class="col-xl-12">
                                    <div class="button-box">
                                        <input id="form_botcheck" name="form_botcheck" class="form-control" type="hidden"
                                            value="">
                                        <button type=submit class="btn-one txt"  style="padding: 0px 25px; font-size: 10px;"  >
											<span class="txt" style="font-size: 10px;" >
													Rigester
											</span>													
										</button>
                                    </div>
                                </div>
                            </form>
                            <!-- Login Link -->
                            <p class="loginhere">
                                Have already an account ? <a href="login.jsp" class="loginhere-link">Login</a>
                            </p>
                        </div>
                    </div>
                </section>
            </div>
        </section>

        <!-- Footer -->
        <%@ include file="footer.jsp"%>
    </div>

    <!-- JavaScript for Password Validation -->
    <script>
        function validateForm() {
            var passwordInput = document.getElementById("password");
            var password = passwordInput.value;

            // Check if the password meets the specified criteria
            var regex = /^(?=.*\d)[\s\S]{8,15}$/;
            if (!regex.test(password)) {
                alert("Password must be 8-15 characters and contain at least one numeric character.");
                return false;
            }

            return true;
        }
    </script>

    <!-- Additional Script Includes -->
    <%@ include file="script.jsp"%>
</body>

</html>
