<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
// Check if the order is placed
Boolean orderPlaced = (Boolean) session.getAttribute("orderPlaced");
if (orderPlaced != null && orderPlaced) {
	// Display a message
	out.println("<p>Your order has been successfully placed!</p>");

	// Reset the session attribute
	session.setAttribute("orderPlaced", false);
}
%>

<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="UTF-8">
<title>E-Scrap</title>

<%@ include file="css.jsp"%>

</head>

<body>

<div class="boxed_wrapper ltr">

	<%@ include file="Navbar.jsp" %>  
		<!-- Start Main Slider -->
		<section class="main-slider style1">
			<div class="slider-box">
				<!-- Banner Carousel -->
				<div class="banner-carousel owl-theme owl-carousel">
					<!-- Slide -->
					<div class="slide">
						<div class="image-layer"
							style="background-image: url(assets/images/slide1.jpg)"></div>
						<div class="auto-container">
							<div class="content">
								<div class="sub-title">
									<h3>Find Sustainable Waste Services</h3>
								</div>
								<div class="big-title">
									<h2>
										First time Delhi <br>Doorstep Scrap Collection Service
									</h2>
								</div>
								<div class="btns-box">
									<a class="btn-one" href="#"> <span class="txt">
											discover more<i class="icon-refresh arrow"></i>
									</span>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="slide">
						<div class="image-layer"
							style="background-image: url(assets/images/slide2.jpg)"></div>
						<div class="auto-container">
							<div class="content">
								<div class="sub-title">
									<h3>Find Sustainable Waste Services</h3>
								</div>
								<div class="big-title">
									<h2>We deal in all kind of Recyclable Scrap Material</h2>
								</div>
								<div class="btns-box">
									<a class="btn-one" href="#"> <span class="txt">
											discover more<i class="icon-refresh arrow"></i>
									</span>
									</a>
								</div>
							</div>
						</div>
					</div>

					<!-- Slide -->
					<div class="slide">
						<div class="image-layer"
							style="background-image: url(assets/images/slide3.jpg)"></div>
						<div class="auto-container">
							<div class="content">
								<div class="sub-title">
									<h3>Find Sustainable Waste Services</h3>
								</div>
								<div class="big-title">
									<h2>We use Electronic Weighing Machine to weigh your
										Scrap.</h2>
								</div>
								<div class="btns-box">
									<a class="btn-one" href="#"> <span class="txt">
											discover more<i class="icon-refresh arrow"></i>
									</span>
									</a>
								</div>
							</div>
						</div>
					</div>

					<!-- Slide -->


				</div>
			</div>
		</section>
		<!-- End Main Slider -->

		<!--Start Features Style1 Area-->
		<section class="features-style1-area">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="features-style1__content">
							<ul>

								<li>
									<div class="single-features-style1">
										<div class="icon-holder">
											<div class="box"></div>
											<span class="icon-garbage-can"></span>
										</div>
										<div class="text-holder">
											<h3>
												<a href="#">Raise A request</a>
											</h3>
											<p>Raise a request to Pickup your scrap according to your
												category.Select Pick up date and time</p>
										</div>
									</div>
								</li>
								<li>
									<div class="single-features-style1">
										<div class="icon-holder">
											<div class="box"></div>
											<span class="icon-calendar"></span>
										</div>
										<div class="text-holder">
											<h3>
												<a href="#">Pickup Schedule</a>
											</h3>
											<p>As per your convenience select pickup date and time.
												Our representative will call you and confirm your pickup
												date and time</p>
										</div>
									</div>
								</li>
								<li>
									<div class="single-features-style1">
										<div class="icon-holder">
											<div class="box"></div>
											<span class="icon-dustbin"></span>
										</div>
										<div class="text-holder">
											<h3>
												<a href="#">Get Paid</a>
											</h3>
											<p>After Successful Pickup and weighing your scrap Get
												Paid Hassle free.</p>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--End Features Style1 Area-->



		<!--Start About Style1 Area-->
		<section class="about-style1-area">
			<div class="shape1"></div>
			<div class="container">
				<div class="row text-right-rtl">
					<div class="col-xl-6">
						<div class="about-style1__image clearfix">
							<div class="text-outer" data-aos="fade-left"
								data-aos-easing="linear" data-aos-duration="1500"></div>
							<div class="border-top"></div>
							<div class="border-left"></div>
							<div class="border-bottom"></div>
							<div class="border-right"></div>
							<ul>
								<li></li>
								<li>
									<div class="img-box">
										<img src="assets/images/home page.jpg" alt="" style="height: 530px;">
									</div>
								</li>
							</ul>
						</div>
					</div>

					<div class="col-xl-6">
						<div class="about-style1__content">
							<div class="sec-title">
								<div class="sub-title">
									<h3>Get to Know About Us</h3>
								</div>
								<h2>E-Scrap</h2>
							</div>
							<div class="inner-content">
								<div class="text">
									<p>E-scrap is an online scrap selling website. We provide
										doorstep scrap Collection service with your suitable date and
										Time. We purchase all kind of Paper Scrap, Plastic, Metals,
										Reusable Clothes, E-Waste, Tires, and Glass Bottles etc. We
										also deal in Industrial scrap, College/Institutional Scrap,
										Packaging Industry Scrap, Construction Site Scrap, Society
										Redevelopment Scrap, IT Companies Scrap, Bank/Offices Scrap.</p>
								</div>


								<div class="about-style1__bottom-content">
									<div class="row">
										<div class="col-xl-6 col-lg-6 col-md-6">
											<div class="text-box">
												<ul>
													<li>Accurate Weight.</li>
													<li>Daily Updated Rate Card.</li>
													<li>Immediate Cash Payment.</li>
													<li>Transparent and safe Service with Professional
														scrap collector.</li>
												</ul>
											</div>
										</div>
									</div>
								   
								</div>
							</div>
						</div>
					 </div>
					</div>
				</div>
		</section>
		<!--End About Style1 Area-->

		<!--Start Service Style1 Area-->
		<section class="service-style1-area">
			<div class="service-style1__bg"
				style="background-image: url(assets/images/backgroundimg01.png);"></div>
			<div class="container">
				<div class="row">
					<div class="col-xl-12">

						<div class="service-style1__top">
							<div class="service-style1__top-title">
								<div class="sec-title sec-title--style2">
									<div class="sub-title">
										<h3>Our Services</h3>
									</div>
									<h2>Waste Services</h2>
								</div>
								<div class="text">
									<p>India generates 62 million tons of garbage every year.
										Out of which only 70% is get collected  Among collected
										garbage only 19% is treated and processed and remaining goes
										to dumping ground</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row text-right-rtl">
					<!--Start Single Service Style1-->
					<div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp"
						data-wow-delay="00ms" data-wow-duration="1500ms">
						<div class="single-service-style1">
							<div class="inner">
								<div class="round-box"></div>
								<div class="icon">
									<span class="icon-garbage-bin"></span>
								</div>
								<div class="text">
									<h3>
										Door to Door <br> Pickup
									</h3>
									<p>We Provide door to door pickup service for the
										customers.</p>
								</div>
							</div>
							<div class="btn-box">
								<a href="doortodoor.html"><span class="icon-right-arrow"></span></a>
							</div>
						</div>
					</div>
					<!--End Single Service Style1-->
					<!--Start Single Service Style1-->
					<div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp"
						data-wow-delay="00ms" data-wow-duration="1500ms">
						<div class="single-service-style1">
							<div class="inner">
								<div class="round-box"></div>
								<div class="icon">
									<span class="icon-dustbin-1"></span>
								</div>
								<div class="text">
									<h3>
										Packaging Industry <br> Scrap
									</h3>
									<p>Waste Corrugated Boxes/kraft</p>
								</div>
							</div>
							<div class="btn-box">
								<a href="packagingscrap.html"><span class="icon-right-arrow"></span></a>
							</div>
						</div>
					</div>
					<!--End Single Service Style1-->
					<!--Start Single Service Style1-->
					<div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp"
						data-wow-delay="00ms" data-wow-duration="1500ms">
						<div class="single-service-style1">
							<div class="inner">
								<div class="round-box"></div>
								<div class="icon">
									<span class="icon-portable-toilet"></span>
								</div>
								<div class="text">
									<h3>
										Construction Site <br> Scrap
									</h3>
									<p>PVC Pipe Scrap, All kind of Metal Scrap, Waste Kraft, GI
										Pipe cut pieces, Used Copper / Aluminum Wires etc.</p>
								</div>
							</div>
							<div class="btn-box">
								<a href="constructionscrap.html"><span
									class="icon-right-arrow"></span></a>
							</div>
						</div>
					</div>
					<!--End Single Service Style1-->
					<!--Start Single Service Style1-->
					<div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp"
						data-wow-delay="00ms" data-wow-duration="1500ms">
						<div class="single-service-style1">
							<div class="inner">
								<div class="round-box"></div>
								<div class="icon">
									<span class="icon-recycle"></span>
								</div>
								<div class="text">
									<h3>
										IT Companies <br> Scrap
									</h3>
									<p>Old Monitors, CPUs, Printers, Telephone, Servers, UPS
										and many more.</p>
								</div>
							</div>
							<div class="btn-box">
								<a href="services-single-4.html"><span
									class="icon-right-arrow"></span></a>
							</div>
						</div>
					</div>
					<!--End Single Service Style1-->

				</div>
				<div class="row text-right-rtl">
					<!--Start Single Service Style1-->
					<div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp"
						data-wow-delay="00ms" data-wow-duration="1500ms">
						<div class="single-service-style1">
							<div class="inner">
								<div class="round-box"></div>
								<div class="icon">
									<span class="icon-garbage-bin"></span>
								</div>
								<div class="text">
									<h3>
										College Institution <br> Scrap
									</h3>
									<p>All Kind of Paper waste including old Journals,
										Assignment, Q and A sheets etc.</p>
								</div>
							</div>
							<div class="btn-box">
								<a href="collegescrap.html"><span class="icon-right-arrow"></span></a>
							</div>
						</div>
					</div>
					<!--End Single Service Style1-->
					<!--Start Single Service Style1-->
					<div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp"
						data-wow-delay="00ms" data-wow-duration="1500ms">
						<div class="single-service-style1">
							<div class="inner">
								<div class="round-box"></div>
								<div class="icon">
									<span class="icon-dustbin-1"></span>
								</div>
								<div class="text">
									<h3>
										Printing Press <br> Scrap
									</h3>
									<p>Book Cutting, LCC, Rim Cutting, Newsprint, Wrapper</p>
								</div>
							</div>
							<div class="btn-box">
								<a href="printpressscrap.html"><span
									class="icon-right-arrow"></span></a>
							</div>
						</div>
					</div>
					<!--End Single Service Style1-->
					<!--Start Single Service Style1-->
					<div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp"
						data-wow-delay="00ms" data-wow-duration="1500ms">
						<div class="single-service-style1">
							<div class="inner">
								<div class="round-box"></div>
								<div class="icon">
									<span class="icon-portable-toilet"></span>
								</div>
								<div class="text">
									<h3>
										Society Redevelopment <br> Scrap
									</h3>
									<p>Removal of Safety Door, Aluminum Window, Metal Grills,
										Water Taps, Fans, Tubelights, Wiring, Channel Gates etc.</p>
								</div>
							</div>
							<div class="btn-box">
								<a href="societyredevelopmentscrap.html"><span
									class="icon-right-arrow"></span></a>
							</div>
						</div>
					</div>
					<!--End Single Service Style1-->
					<!--Start Single Service Style1-->
					<div class="col-xl-3 col-lg-6 col-md-6 wow fadeInUp"
						data-wow-delay="00ms" data-wow-duration="1500ms">
						<div class="single-service-style1">
							<div class="inner">
								<div class="round-box"></div>
								<div class="icon">
									<span class="icon-recycle"></span>
								</div>
								<div class="text">
									<h3>
										Bank/Office <br> Scrap
									</h3>
									<p>We provide Important Documents Shredding Services with
										no any extra cost</p>
								</div>
							</div>
							<div class="btn-box">
								<a href="bankofficescrap.html"><span
									class="icon-right-arrow"></span></a>
							</div>
						</div>
					</div>
					<!--End Single Service Style1-->

				</div>
			</div>
		</section>

		<!--Start Features Style2 Area-->
		<section class="features-style2-area">
			<div class="auto-container">
				<div class="row">

					<div class="col-xl-6 col-lg-6">
						<div class="single-features-style2-box">
							<div class="inner-content">
								<div class="icon">
									<div class="box"></div>
									<span class="icon-garbage-can"></span>
								</div>
								<div class="title">

									<h2>
										Door to Door<br> Pickup Services
									</h2>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-6 col-lg-6">
						<div class="single-features-style2-box">
							<div class="img-bg"
								style="background-image: url(assets/images/landfill.png);"></div>
						</div>
					</div>

					<div class="col-xl-6 col-lg-6">
						<div class="single-features-style2-box">
							<div class="img-bg"
								style="background-image: url(assets/images/acceptlocation.png);"></div>
						</div>
					</div>

					<div class="col-xl-6 col-lg-6">
						<div class="single-features-style2-box left">
							<div class="inner-content">
								<div class="icon">
									<div class="box"></div>
									<span class="icon-toxic-waste"></span>
								</div>
								<div class="title">

									<h2>
										Accepts Special Waste<br> at Many Locations
									</h2>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>
		<!--End Features Style2 Area-->

		<!--Start Service Style2 Area-->
		<section class="service-style2-area">
			<div class="gray-bg"></div>
			<div class="container">
				<div class="sec-title text-center">
					<div class="sub-title">
						<h3>Industries We Serve</h3>
					</div>
					<h2>Solutions by Industry</h2>
				</div>
				<div class="row">

					<!--Start Single Service Style1-->
					<div class="col-xl-4 col-lg-4">
						<div class="single-service-style2">
							<div class="img-holder">
								<img src="assets/images/4.png" alt="">
								
							</div>
							<div class="text-holder text-center">
								<h3>
									<a href="industries-details.html">Residential Apartments</a>
								</h3>
								<p>Arrange Recyclable waste collection Drives after every 3
									months</p>
							</div>
						</div>
					</div>
					<!--End Single Service Style1-->

					<!--Start Single Service Style1-->
					<div class="col-xl-4 col-lg-4">
						<div class="single-service-style2">
							<div class="img-holder">
								<img src="assets/images/itofficescrap.png" alt="">																								
						</div>
							<div class="text-holder text-center">
								<h3>
									<a href="industries-details.html">IT Companies/Bank Offices</a>
								</h3>
								<p>Old Monitors, CPUs, Printers, Telephone, Servers, UPS and
									many more on regularly Basis.</p>
							</div>
						</div>
					</div>
					<!--End Single Service Style1-->

					<!--Start Single Service Style1-->
					<div class="col-xl-4 col-lg-4">
						<div class="single-service-style2">
							<div class="img-holder">
								<img src="assets/images/industry.png" alt="">
								
							</div>
							<div class="text-holder text-center">
								<h3>
									<a href="industries-details.html">Constructions and
										Industries</a>
								</h3>
								<p>PVC Pipe Scrap, All kind of Metal Scrap, Waste Kraft, GI
									Pipe cut pieces, Used Copper / Aluminum Wires etc. on Daily
									Weekly and Monthly intervals</p>
							</div>
						</div>
					</div>
					<!--End Single Service Style1-->

				</div>
			</div>
		</section>
		<!--End Service Style2 Area-->


		<!--Start Choose Style1 Area-->
		<section class="choose-style1-area">
			<div class="container">
				<div class="row">

					<div class="col-xl-4">
						<div class="choose-style1__title-box">
							<div class="sec-title sec-title--style2">
								<div class="sub-title">
									<h3>Why Choose us</h3>
								</div>
								<h2>
									We only Provide<br> Quality Waste<br> Services
								</h2>
							</div>
						</div>
					</div>

					<div class="col-xl-8">
						<div class="video-gallery-style2">
							<div class="video-gallery-style2__bg"
								style="background-image: url(assets/images/5.png);"></div>
							<div class="icon wow zoomIn animated" data-wow-delay="300ms"
								data-wow-duration="1500ms">
								<a class="video-popup" title="Video Gallery"
									href="https://www.youtube.com/watch?v=kXbs9DE1Kf8"> <span
									class="icon-play-buttton"></span>
								</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>

		<section class="slogan-area">
			<div class="container">
				<div class="row">

					<div class="col-xl-5 col-lg-12">
						<div class="phone-number-box2">
							<div class="icon">
								<span class="icon-phone-ringing"></span>
							</div>
							<div class="phone">
								<p>Have any questions?</p>
								<a href="tel:76171602135">+91-7617602135</a>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-lg-12">
						<div class="slogan-text-box">
							<!--<p>Committed To Transform</p>-->
						</div>
					</div>
				</div>
			</div>
		</section>
	
			<!--Start Footer Style-->
		<%@ include file="footer.jsp"%>
		
</div>
		<!--Start Script-->
		<%@ include file="script.jsp"%>
		

</body>

</html>