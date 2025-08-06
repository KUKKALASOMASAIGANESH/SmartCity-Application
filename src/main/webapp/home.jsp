<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-image: url("images/homepagebgc.png");
	 background-repeat: no-repeat;
    background-size: cover;
}

/* styles.css */
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow: hidden;
}

.carousel-container {
	display: flex;
	width: 100%;
	height: 100%;
	overflow: hidden;
	position: relative;
}

.slide {
	flex: 0 0 100%;
	height: 100%;
	opacity: 0;
	position: absolute;
	width: 100%;
	transition: opacity 0.5s ease-in-out;
}

.slide.active {
	opacity: 1;
}

img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.overlay-text {
	position: absolute;
	top: 20px; /* Adjust this value to your preferred top position */
	left: 90px; /* Adjust this value to your preferred left position */
	color: white; /* Text color in yellow */
	padding: 10px;
	font-size: 70px; /* Larger font size for a painted text effect */
	text-align: left; /* Align the text to the left */
	opacity: 1; /* Set opacity to 1 for full visibility */
	transition: opacity 0.3s;
	font-family: "Pacifico", cursive;
	/* Use the Pacifico font for painted text effect */
}

/* Ensure the video covers the entire viewport */
/* Hide video controls */
#fullscreen-video::-webkit-media-controls {
	display: none;
}

#fullscreen-video::-webkit-media-controls-enclosure {
	display: none;
}

#fullscreen-video::-webkit-media-controls-panel {
	display: none;
}

.mobile-image {
	width: 100%; /* Adjust the width as needed */
	height: auto; /* Maintain the aspect ratio */
	display: none; /* Initially hide the image */
}

@media only screen and (max-width: 768px) {
	#fullscreen-video {
		display: none;
	}
	body {
		background-color: #f5f5f5;
	}
	.welcome-section {
		margin-top: 20px;
	}
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<!-- Add this image element with the .mobile-image class -->

	<!-- Video Container -->
	<c:choose>
		<c:when test="${cityname == 'Hyderabad'}">
			<video autoplay loop muted playsinline id="fullscreen-video"
				style="width: 100%; height: 100%; object-fit: cover; transform: scale(1.00);">
				<source src="video/hydvideo.mp4" type="video/mp4">
			</video>
		</c:when>
		
		<c:when test="${cityname == 'Yanam'}">
			<video autoplay loop muted playsinline id="fullscreen-video"
				style="width: 100%; height: 100%; object-fit: cover; transform: scale(1.00);">
				<source src="video/ynmvideo.mp4" type="video/mp4">
			</video>
		</c:when>
		
		<c:when test="${cityname == 'chennai'}">
			<video autoplay loop muted playsinline id="fullscreen-video"
				style="width: 100%; height: 100%; object-fit: cover; transform: scale(1.00);">
				<source src="video/chennaivideo.mp4" type="video/mp4">
			</video>
		</c:when>
		
		<c:when test="${cityname == 'Vijayawada'}">
			<video autoplay loop muted playsinline id="fullscreen-video"
				style="width: 100%; height: 100%; object-fit: cover; transform: scale(1.00);">
				<source src="video/vjyvideo.mp4" type="video/mp4">
			</video>
		</c:when>
		
		
	</c:choose>


	<script>
    const navbar = document.getElementById('navbar');
    const openBtn = document.querySelector('.open-btn');
  
    function toggleNavbar() {
      if (navbar.style.left === '0px' || navbar.style.left === '') {
        navbar.style.left = '-1000px';
        openBtn.classList.remove('active');
      } else {
        navbar.style.left = '0';
        openBtn.classList.add('active');
      }
    }
  
    function closeNavbar() {
      navbar.style.left = '-1000px';
      openBtn.classList.remove('active');
    }
  
    const navLinks = document.querySelectorAll('.navbar a');
    for (const link of navLinks) {
      link.addEventListener('click', closeNavbar);
    }
  
    // script.js
    const slides = document.querySelectorAll('.slide');
    let currentIndex = 0;
  
    function showSlide(index) {
      slides.forEach((slide, i) => {
        if (i === index) {
          slide.classList.add('active');
        } else {
          slide.classList.remove('active');
        }
      });
    }
  
    function nextSlide() {
      currentIndex = (currentIndex + 1) % slides.length;
      showSlide(currentIndex);
    }
  
    setInterval(nextSlide, 4000); // Auto slide every 4 seconds
    showSlide(currentIndex); // Show initial slide
  
    // Check if the screen width is less than or equal to 768px (mobile)
    const video = document.getElementById('fullscreen-video');
    const mobileImage = document.querySelector('.mobile-image');
  
    function handleScreenSize() {
      if (window.innerWidth <= 768) {
        video.style.display = 'none';
        mobileImage.style.display = 'block';
        closeNavbar(); // Close the navbar when switching to mobile view
      } else {
        video.style.display = 'block';
        mobileImage.style.display = 'none';
      }
    }
  
    // Initial check on page load
    handleScreenSize();
  
    // Add event listener for screen size changes
    window.addEventListener('resize', handleScreenSize);
  </script>

</body>
</html>