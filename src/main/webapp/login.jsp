<%
// Check if the order is placed
Boolean registered = (Boolean) session.getAttribute("registered");
if (registered != null && registered) {
	// Display a message
	out.println("<p>Registrtion has been successfull!</p>");

	// Reset the session attribute
	session.setAttribute("registered", false);
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="assets/css2/Login.css">
    <link rel="stylesheet" href="assets/css2/new2.css">
    <%@ include file="css.jsp"%>
    <title>E-scrap</title>
</head>

<body>
    <div class="boxed_wrapper ltr">
    
        <%@ include file="Navbar.jsp" %>
        
        <!-- Start breadcrumb area paroller -->
        <section class="breadcrumb-area">
            <div class="breadcrumb-area-bg" style="background-image: url(assets/images/contact.png);"></div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="inner-content">
                            <div class="breadcrumb-menu" data-aos="fade-down" data-aos-easing="linear"
                                data-aos-duration="1500">
                                <ul>
                                    <li><a href="index.html">Home</a></li>
                                    <li class="active">Login</li>
                                </ul>
                            </div>
                            <div class="title" data-aos="fade-up" data-aos-easing="linear" data-aos-duration="1500">
                                <h2>Login Into Account</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End breadcrumb area -->

        <section class="service-details-area">
            <div class="main">
                <section class="signup">
                    <!-- <img src="images/signup-bg.jpg" alt=""> -->
                    <div class="container">
                        <div class="signup-content">
                            <form method="POST" id="signup-form" class="signup-form"
                                action="assets/jsp/loginProcess.jsp">
                                <h2 class="form-title">Login</h2>
                                <div class="form-group">
                                    <input type="tel" id="phone" name="mobile" placeholder="Registered Mobile Number"
                                        class="form-input" pattern="[6789]\d{9}"
                                        title="Please enter a valid 10-digit mobile number" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-input" name="password" id="password"
                                        placeholder="Password" required />
                                    <span toggle="#password"
                                        class="zmdi zmdi-eye field-icon toggle-password"></span>
                                </div>
                                <div class="col-xl-12">
                                    <div class="button-box">
                                        <input id="form_botcheck" name="form_botcheck" class="form-control"
                                            type="hidden" value="">
                                        <button type=submit class="btn-one txt"  style="padding: 0px 25px; font-size: 10px;"  >
											<span class="txt" style="font-size: 10px;" >
													Sign in
											</span>													
										</button>
                                    </div>
                                </div>
                            </form>
                            <p class="loginhere">Have already an account? <a href="registration.html"
                                    class="loginhere-link">Register</a></p>
                        </div>
                    </div>
                </section>
            </div>
        </section>

        <%@ include file="footer.jsp"%>
        <%@ include file="script.jsp"%>
    </div>
</body>

</html>
