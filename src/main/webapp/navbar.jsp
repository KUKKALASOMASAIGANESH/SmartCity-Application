<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
body {
	margin: 0;
 	font-family: Arial, sans-serif; 
	background-color: #f5f5f5;
}

.navbar {
height: 100vh;
    width: 300px;
    position: fixed;
    left: -300px;
    top: 0;
    background-color: #222;
    color: #fff;
    transition: left 0.3s ease-in-out;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    overflow-y: auto;
    font-size: 16px;
    z-index: 3
}

.navbar img.top-image {
	display: block;
	width: 100%;
	height: 30%;
}

.navbar a {
	display: block;
	padding: 15px 20px;
	color: #fff;
	text-decoration: none;
	position: relative;
	transition: color 0.3s, background-color 0.3s;
}

.navbar a::before {
	content: "";
	position: absolute;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
	width: 5px;
	height: 40px;
	background-color: transparent;
	border-radius: 10px;
	transition: background-color 0.3s;
}

.navbar a:hover {
	color: #ffcc00;
	background-color: #444;
}

.navbar a:hover::before {
	background-color: #ffcc00;
}

.separator {
	margin: 10px 0;
	border-top: 1px solid #555;
}

.service-icon {
	margin-right: 10px;
	font-size: 1.2em;
}

.open-btn {
	position: fixed;
	top: 20px;
	left: 20px;
	background-color: #ffcc00;
	color: #333;
	border: none;
	padding: 10px;
	border-radius: 50%;
	cursor: pointer;
	transition: background-color 0.3s, transform 0.3s;
	z-index: 1;
}

.open-btn-icon {
	font-size: 24px;
}

.open-btn.active {
	display: none;
}

.open-btn:hover {
	background-color: #444;
}

.open-btn:focus {
	outline: none;
}
 .login-register-button {
      position: absolute;
      top: 20px;
      right: 20px;
      border: none;
      padding: 10px 15px;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
      z-index: 3;
    }
</style>
</head>
<body>
	<button class="open-btn" onclick="toggleNavbar()">
		<span class="open-btn-icon">☰</span>
	</button>
	<div class="navbar" id="navbar">
		 <a href="#" onclick="closeNavbar();">
        <span class="service-icon">◁</span> Back
    </a>
    <img src="images/smartcity.png" alt="Navbar Image" class="top-image">
    <div class="separator"></div>
     <%@ include file="header.jsp" %>
    <a href="citieslist?city=${param.city}"><span class="service-icon">🌍</span> Choose Other City</a>
        <div class="separator"></div>
    <a href="home?city=${param.city}">
        <span class="service-icon">🏠</span> Home
    </a>

    <div class="separator"></div>
    <a href="about?city=${param.city}">
        <span class="service-icon">ℹ️</span> About the City
    </a>
		<div class="separator"></div>
    <a href="ask?city=${param.city}"><span class="service-icon">🤖</span> ASK</a>
    <div class="separator"></div>
    <a href="touristattractions?city=${param.city}"><span class="service-icon">🏞️</span> Tourist Attractions</a>
    <div class="separator"></div>
    <a href="healthservices?city=${param.city}"><span class="service-icon">🏥</span> HealthCare Services</a>
    <div class="separator"></div>
    <a href="hotels?city=${param.city}"><span class="service-icon">🏨</span> Hotels</a>
    <div class="separator"></div>
<%--     <a href="transport?city=${param.city}"><span class="service-icon">🚆🚌</span> Transportation Services</a> --%>
<!--     <div class="separator"></div> -->
    <a href="bookings?city=${param.city}"><span class="service-icon">📅</span> Booking</a>
        <div class="separator"></div>
    <a href="colleges?city=${param.city}"><span class="service-icon">🏫</span> Educational Institutions</a>
    <div class="separator"></div>
    <a href="jobs?city=${param.city}"><span class="service-icon">💼</span>Companies/Job Findings</a>
    <div class="separator"></div>
    <a href="shoppingmalls?city=${param.city}"><span class="service-icon">🛍️</span> Shopping Malls</a>
    <div class="separator"></div>
    <a href="restaurants?city=${param.city}"><span class="service-icon">🍽️</span> Restaurants</a>
    <div class="separator"></div>
    <a href="contactus?city=${param.city}"><span class="service-icon">📞</span> Contact</a>
	</div>
	
	<div class="login-register-button">
   <%@ include file="icon.jsp" %>
  </div>

	<script>
        const navbar = document.getElementById('navbar');
        const openBtn = document.querySelector('.open-btn');

        function toggleNavbar() {
            if (navbar.style.left === '-300px' || navbar.style.left === '') {
                navbar.style.left = '0';
                openBtn.classList.add('active');
            } else {
                navbar.style.left = '-300px';
                openBtn.classList.remove('active');
            }
        }

        function closeNavbar() {
            navbar.style.left = '-300px';
            openBtn.classList.remove('active');
        }

        const navLinks = document.querySelectorAll('.navbar a');
        for (const link of navLinks) {
            link.addEventListener('click', closeNavbar);
        }
    </script>
</body>
</html>
