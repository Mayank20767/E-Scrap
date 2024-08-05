<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="UTF-8">
<title>E-scrap</title>

<%@ include file="css.jsp"%>



</head>

<body>

	<div class="boxed_wrapper ltr">
		<%@ include file="Navbar.jsp"%>

		<!--Start breadcrumb area paroller-->
		<section class="breadcrumb-area">
			<div class="breadcrumb-area-bg"
				style="background-image: url(assets/images/contact.png);"></div>
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="inner-content">
							<div class="breadcrumb-menu" data-aos="fade-down"
								data-aos-easing="linear" data-aos-duration="1500">
								<ul>
									<li><a href="index.html">Home</a></li>
									<li class="active">Contact</li>
								</ul>
							</div>

							<div class="title" data-aos="fade-up" data-aos-easing="linear"
								data-aos-duration="1500">
								<h2>Contact</h2>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<!--End breadcrumb area-->

		<!--Start Main Contact Form Area-->
		<section class="main-contact-form-area">
			<div class="container">
				<div class="row">
					<div class="col-xl-6 col-lg-6">
						<div class="contact-info-box">
							<div class="sec-title">
								<div class="sub-title">
									<h3>Get in Tocuh with us</h3>
								</div>
								<h2>Contact with the Team</h2>
							</div>

							<div class="contact-info-list">
								<ul>
									<li>
										<div class="icon">
											<span class="icon-telephone"></span>
										</div>

										<div class="text">
											<p>Have any questions?</p>
											<h4>
												Free: <a href="tel:7617602135">+91 7617602135</a>
											</h4>
										</div>
									</li>

									<li>
										<div class="icon">
											<span class="icon-email-1"></span>
										</div>

										<div class="text">
											<p>Write a email</p>
											<h4>
												<a href="mailto:info@escrap.co.in">info@e-scrap.co.in</a>
											</h4>
										</div>
									</li>

									<li>
										<div class="icon">
											<span class="icon-pin-1"></span>
										</div>

										<div class="text">
											<p>Visit our location</p>
											<h4>Sarojini Nagar, New Delhi 110023 India,
												Neighbourhood Minto Road</h4>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>


					<div class="col-xl-6 col-lg-6">
						<div class="contact-form contact-form--style2">
							<div class="sec-title">
								<div class="sub-title">
									<h3>Write Message</h3>
								</div>
								<h2>Send a Message</h2>
							</div>

							<form action="assets/jsp/Contact.jsp" class="default-form2"
								onsubmit="return submitForm()">
								<div class="row">
									<div class="col-xl-12">
										<div class="form-group">
											<div class="input-box">
												<input type="text" name="name" id="formName"
													placeholder="Full Name" required="">
											</div>
										</div>
									</div>

									<div class="col-xl-12">
										<div class="form-group">
											<div class="input-box">
												<input type="email" name="email" id="formEmail"
													placeholder="Email Address" required="">
											</div>
										</div>
									</div>

									<div class="col-xl-12">
										<div class="form-group">
											<div class="input-box">
												<input type="tel" name="phone" value="" id="formPhone"
													placeholder="Phone">
											</div>
										</div>
									</div>

									<div class="col-xl-12">
										<div class="form-group">
											<div class="input-box">
												<input type="text" name="subject" value="" id="formSubject"
													placeholder="Subject" required="">
											</div>
										</div>
									</div>

									<div class="col-xl-12">
										<div class="form-group">
											<div class="input-box">
												<textarea name="message" id="formMessage"
													placeholder="Write a Message" required=""></textarea>
											</div>
										</div>
									</div>

									<div class="col-xl-12">
										<div class="button-box">
											<button class="btn-one" type="submit">Send a Message</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div id="success-message" style="display: none; color: green;">Message
				sent successfully!</div>

		</section>


		<!--Start Footer Style-->
		<%@ include file="footer.jsp"%>

	</div>
	<!--Start Script-->
	<%@ include file="script.jsp"%>

	<script>
	 function submitForm() {
	        // Your form submission logic here
	        // For example, you can use AJAX to submit the form asynchronously

	        // Reset the form
	        document.getElementById('formName').value = '';
	        document.getElementById('formEmail').value = '';
	        document.getElementById('formPhone').value = '';
	        document.getElementById('formSubject').value = '';
	        document.getElementById('formMessage').value = '';
	        
	        // Display the success message
	        document.getElementById('success-message').style.display = 'block';

	        // Prevent the form from submitting in the traditional way
	        return false;
	</script>

</body>

</html>