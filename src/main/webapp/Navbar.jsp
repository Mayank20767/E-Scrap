<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    // Retrieve login information from session
    String login = (String) session.getAttribute("login");
%>

<!-- Main Header -->
<header class="main-header header-style-one">
    <!-- Header Top Section -->
    <div class="header-top">
        <div class="auto-container">
            <div class="outer-box">
                <!-- Left Section of Header Top -->
                <div class="header-top__left">
                    <!-- Contact Information -->
                    <div class="header-contact-info-style1">
                        <ul>
                            <li>
                                <div class="icon">
                                    <span class="icon-pin"></span>
                                </div>
                                <div class="text">
                                    <p>Sarojini Nagar, New Delhi 110023 India</p>
                                </div>
                            </li>
                            <li>
                                <div class="icon">
                                    <span class="icon-email"></span>
                                </div>
                                <div class="text">
                                    <p>
                                        <a href="mailto:info@scrapderal.co.in">info@e-scrap.co.in</a>
                                    </p>
                                </div>
                            </li>
                            <li>
                                <div class="icon">
                                    <span class="icon-time"></span>
                                </div>
                                <div class="text">
                                    <p>Mon - Sat 8:00 am to 7:00 pm</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Right Section of Header Top -->
                <div class="header-top__right">
                    <!-- Request Pickup Button -->
                    <div class="header-button-style1">
                        <a class="btn-one" href="contactus.jsp">
                            <span class="txt">Request for a pickup<i class="icon-refresh arrow"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header Top -->

    <!-- Main Header Section -->
    <div class="header">
        <div class="auto-container">
            <div class="outer-box">
                <!-- Header Left Section -->
                <div class="header-left e-scraplogo">
                    <!-- Logo -->
                    <div class="main-logo-box">
                        <a href="/EScrap">
                            <img src="assets/images/logo.png" alt="Awesome Logo" title="" style="width: 100px;">
                        </a>
                    </div>
                </div>

                <!-- Header Right Section -->
                <div class="header-right">
                    <!-- Navigation Menu -->
                    <div class="nav-outer style1 clearfix">
                        <!-- Mobile Navigation Toggler -->
                        <div class="mobile-nav-toggler">
                            <div class="inner">
                                <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                            </div>
                        </div>

                        <!-- Main Menu -->
                        <nav class="main-menu style1 navbar-expand-lg navbar-light">
                            <div class="collapse navbar-collapse show clearfix" id="navbarSupportedContent">
                                <ul class="navigation clearfix">
                                    <!-- Navigation Items -->
                                    <li class="dropdown current"><a href="/EScrap"><span>Home</span></a></li>
                                    <li class="dropdown"><a href="#"><span>Categories</span></a>
                                        <ul>
                                            <li><a href="mixedwaste.jsp">Mixed Waste</a></li>
                                            <li><a href="paper.jsp">Paper</a></li>
                                            <li><a href="oldcloth.jsp">Old Clothes</a></li>
                                            <li><a href="metals.jsp">Metals</a></li>
                                            <li><a href="plastic.jsp">Plastic</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="ourindustry.jsp"><span>Our Industry</span></a></li>
                                    <li><a href="about.jsp"><span>About Us</span></a></li>
                                    <li><a href="contactus.jsp"><span>Contact Us</span></a></li>
                                    <!-- Conditional Menu Items based on login status -->
                                    <% if (login != null) { %>
                                        <li><a href="order.jsp"><span>Order</span></a></li>
                                        <!-- Example dropdown button -->
                                        <li>
                                            <div class="d-flex mt-4 mx-4">
                                                <div>
                                                    <a href="myCart.jsp">
                                                        <button type="button" class="btn-one" aria-expanded="false" style="padding: 2px 10px;">
                                                            <span class="txt" style="font-size: 10px;"> View Cart<i class="bi bi-cart-fill"></i></span>
                                                        </button>
                                                    </a>
                                                </div>
                                                <div style="margin-left: 30px;">
                                                    <button type="button" class="btn-one" data-bs-toggle="dropdown" aria-expanded="false" style="padding: 2px 17px;">
                                                        <span class="txt" style="font-size: 10px;"> Sign In <i class="dropdown-toggle"></i></span>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li><a class="dropdown-item" href="#">Username</a></li>
                                                        <li><a class="dropdown-item" href="#">Password</a></li>
                                                        <li><a class="dropdown-item" href="orderHistory.jsp">Order History</a></li>
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li><a class="dropdown-item bg-danger text-white" href="assets/jsp/logout.jsp">Sign up</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                    <% } else { %>
                                        <li><a href="login.jsp"><span>Login</span></a></li>
                                        <li><a href="registration.jsp"><span>Registration</span></a></li>
                                    <% } %>
                                </ul>
                            </div>
                        </nav>
                        <!-- Main Menu End -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Header -->

    <!-- Sticky Header Section -->
    <div class="sticky-header">
      	 <div class="container">
       			 <div class="clearfix">
            			<!-- Logo -->
           				 <div class="logo float-left">
                			<a href="index.jsp" class="img-responsive">
                   		    <img src="assets/images/logo.png" alt="" title="" style="width: 50px;">
                			</a>
           				 </div>
            			<!-- Right Column -->
            			<div class="right-col float-right">
               			 <!-- Main Menu -->
                		<nav class="main-menu clearfix">
                  		  <!-- Keep This Empty / Menu will come through Javascript -->
               			</nav>
          	  			</div>
        		</div>
     	</div>
    </div>
    <!-- End Sticky Header -->

    <!-- Mobile Menu Section -->
    <div class="mobile-menu">
        <div class="menu-backdrop"></div>
    	<div class="close-btn">
        	<span class="icon fa fa-times-circle"></span>
    	</div>
    	<nav class="menu-box">
        	<div class="nav-logo">
            	<a href="index.jsp"><img src="assets/images/logo.html" alt="" title=""></a>
       		</div>
       		<div class="menu-outer">
        	    <!-- Here Menu Will Come Automatically Via Javascript / Same Menu as in Header -->
        	</div>
       		 <!-- Social Links -->
        	<div class="social-links">
           		 <ul class="clearfix">
                	<li><a href="#"><span class="fab fa fa-facebook-square"></span></a></li>
                	<li><a href="#"><span class="fab fa fa-twitter-square"></span></a></li>
                	<li><a href="#"><span class="fab fa fa-pinterest-square"></span></a></li>
                	<li><a href="#"><span class="fab fa fa-google-plus-square"></span></a></li>
                	<li><a href="#"><span class="fab fa fa-youtube-square"></span></a></li>
            	</ul>
        	</div>
    	</nav>
    </div>
    <!-- End Mobile Menu -->
</header>
