<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Tourist Attractions</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
  body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
  }

  h1 {
	font-size: 5.25vmin;
	text-align: center;
	color: white;
}
p {
	font-size: max(10pt, 2.5vmin);
	line-height: 1.4;
	color: #0e390e;
	margin-bottom: 1.5rem;
}

.card-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin-left: 20px;  
    }

.wrap {
	display: flex;
	flex-wrap: nowrap;
	justify-content: space-between;
	width: 85vmin;
	height: 25em;
	margin: 2rem auto;
	border: 8px solid;
	background-color: #f5f5f5;
	transition: .3s ease-in-out;
	position: relative;
	overflow: hidden;
  width: calc(30% - 2px);
  margin-right: 150px;
  margin-left: 100px; /* Adjust the width as needed */
  margin-bottom: 20px;
}
.overlay {
	position: relative;
	display: flex;
	width: 100%;
	height: 100%;
	padding: 1rem .75rem;
	background: #9ff4ff;
	transition: .4s ease-in-out;
	z-index: 1;
}
.overlay-content {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	width: 15vmin;
	height: 100%;
	padding: .5rem 0 0 .5rem;
	border: 3px solid;
	border-image: 
    	linear-gradient(
      	to bottom, 
      	#AEA724 5%,
      	forestgreen 35% 65%,
      	#AEA724 95%
    	) 0 0 0 100%;
	transition: .3s ease-in-out .2s;
	z-index: 1;
    height: 90%;

}
.image-content1 {
	position: absolute;
	top: 0;
	right: 0;
	width: 60vmin;
	height: 100%;
	background-image: url("../images/charminarhyd.jpg");
	background-size: cover;
	transition: .3s ease-in-out;
	/* border: 1px solid green; */
}
.image-content2 {
	position: absolute;
	top: 0;
	right: 0;
	width: 60vmin;
	height: 100%;
	background-image: url("../images/jagannathtemplehyd.jpg");
	background-size: cover;
	transition: .3s ease-in-out;
	/* border: 1px solid green; */
}
.image-content3 {
	position: absolute;
	top: 0;
	right: 0;
	width: 60vmin;
	height: 100%;
	background-image: url("../images/museumhyd.jpg");
	background-size: cover;
	transition: .3s ease-in-out;
	/* border: 1px solid green; */
}
.image-content4 {
	position: absolute;
	top: 0;
	right: 0;
	width: 60vmin;
	height: 100%;
	background-image: url("../images/buddha.jpg");
	background-size: cover;
	transition: .3s ease-in-out;
	/* border: 1px solid green; */
}
.inset {
	max-width: 50%;
	margin: 0.25em 1em 1em 0;
	border-radius: 0.25em;
	float: left;
}

.dots {
	position: absolute;
	bottom: 1rem;
	right: 2rem;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-items: center;
	width: 55px;
	height: 4vmin;
	transition: .3s ease-in-out .3s;
}
.dot {
	width: 14px;
	height: 14px;
	background: yellow;
	border: 1px solid indigo;
	border-radius: 50%;
	transition: .3s ease-in-out .3s;
}

.text {
	position: absolute;
	top: 0;
	right: 0;
	width: 60vmin;
	height: 100%;
	padding: 3vmin 4vmin;
	background: #fff;
	box-shadow: inset 1px 1px 15px 0 rgba(0 0 0 / .4);
	overflow-y: scroll;
}

.wrap:hover .overlay
 {
	transform: translateX(-60vmin);
}
.wrap:hover .image-content1 {
	width: 30vmin;
}
.wrap:hover .image-content2 {
	width: 30vmin;
}
.wrap:hover .image-content3 {
	width: 30vmin;
}
.wrap:hover .image-content4 {
	width: 30vmin;
}
.wrap:hover .overlay-content {
	border: none;
	transition-delay: .2s;
	transform: translateX(60vmin);
}
.wrap:hover .dots {
	transform: translateX(1rem);
}
.wrap:hover .dots .dot {
	background: white;
}


/* Animations and timing delays */
.animate {
  animation-duration: 0.7s;
  animation-timing-function: cubic-bezier(.26, .53, .74, 1.48);
  animation-fill-mode: backwards;
}
/* Pop In */
.pop { animation-name: pop; }
@keyframes pop {
  0% {
    opacity: 0;
    transform: scale(0.5, 0.5);
  }
  100% {
    opacity: 1;
    transform: scale(1, 1);
  }
}

/* Slide In */
.slide { animation-name: slide; }
@keyframes slide {
  0% {
    opacity: 0;
    transform: translate(4em, 0);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0);
  }
}

/* Slide Left */
.slide-left { animation-name: slide-left; }
@keyframes slide-left {
  0% {
    opacity: 0;
    transform: translate(-40px, 0);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0);
  }
}

.slide-up {animation-name: slide-up;}
@keyframes slide-up {
	0% {
		opacity: 0;
		transform: translateY(3em);
	}
	100% {
		opacity: 1;
		transform: translateY(0);
	}
}

.delay-1 {
  animation-delay: 0.3s;
}
.delay-2 {
  animation-delay: 0.6s;
}
.delay-3 {
  animation-delay: 0.9s;
}
.delay-4 {
  animation-delay: 1.2s;
}
.delay-5 {
  animation-delay: 1.5s;
}
.delay-6 {
  animation-delay: 1.8s;
}
.delay-7 {
  animation-delay: 2.1s;
}
.delay-8 {
  animation-delay: 2.4s;
}
  .map-button {
        display: block;
        margin: 0 auto;
        padding: 10px 20px;
        background-color: #007bff; /* Change to your desired color */
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    body, h1, h2, h3, h4, h5, h6 {
      font-family: "Raleway", sans-serif;
    }
    .w3-card {
    transition: transform 0.2s;
  }

  .w3-card:hover {
    transform: scale(1.01);
  }
  body, html {height: 70%}
.bgimg {
  background-image: url('displaycentralimage?id=${ta.id}');
  min-height: 100%;
  background-position: center;
  background-size: cover;
}
.card-zoom:hover {
  transform: scale(1.02); /* Increase the size when hovering */
  transition: transform 0.8s ease; /* Add a smooth transition */
}
@keyframes zoom-out {
  0% {
    transform: scale(1);
  }
  100% {
    transform: scale(1.1); /* Adjust the scale factor as needed */
  }
}

.w3-animate-zoom {
  animation: zoom-out 1s ease;
}

</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
  <div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
    <div class="w3-display-topleft w3-padding-large w3-xlarge">
    </div>
    <div class="w3-display-middle">
      <h1 class="w3-jumbo w3-animate-zoom" style="color:red;"></h1>
      <hr class="w3-border-grey" style="margin: auto; width: 40%">
      <p class="w3-large w3-center" style="color: black; font-size: 24px !important;"></p>
    </div>
  </div>
  
  </div>
        <h1 style="color: #222;"><b>City Tourist Attractions</b></h1>
     </div></header>
      
  <br>
  <br>
  
  <!-- Grid -->
  <div class="page-section" id="page-1">
         
    <!-- Add your content for page 1 here -->
  <div class="w3-row-padding">
  <div class="w3-third w3-container w3-margin-bottom card-zoom">
    <img src="touristattractionimg1?id=${ta.id }" alt="Norway" style="width:100%" class="w3-hover-opacity">
    <div class="w3-container w3-white">
      <p><b><c:out value="${ta.taname1}"></c:out></b></p>
      <p><c:out value="${ta.tadesc1}"></c:out></p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
		<p><a href="${ta.talink1}" target="_blank"><button class="w3-button w3-padding-large w3-white w3-border"><b>EXPLORE »</b></button></a></p>       
		</div>
        <div class="w3-col m4 w3-hide-small">
          <p><span class="w3-padding-large w3-right"><b>  </b> </p>
        </div>
      </div>
    </div>
  </div>
  <div class="w3-third w3-container w3-margin-bottom card-zoom">
    <img src="touristattractionimg2?id=${ta.id }" alt="Norway" style="width:100%" height="90%" class="w3-hover-opacity">
    <div class="w3-container w3-white">
      <p><b><c:out value="${ta.taname2}"></c:out></b></p>
      <p><c:out value="${ta.tadesc2}"></c:out></p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
          <p><a href="${ta.talink2}" target="_blank"><button class="w3-button w3-padding-large w3-white w3-border"><b>EXPLORE »</b></button></a></p>
        </div>
        <div class="w3-col m4 w3-hide-small">
          <p><span class="w3-padding-large w3-right"><b>  </b> </p>
        </div>
      </div>
    </div>
  </div>
  <div class="w3-third w3-container w3-margin-bottom card-zoom">
    <img src="touristattractionimg3?id=${ta.id }" alt="Norway" style="width:100%" class="w3-hover-opacity">
    <div class="w3-container w3-white">
      <p><b><c:out value="${ta.taname3}"></c:out></b></p>
      <p><c:out value="${ta.tadesc3}"></c:out></p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
		<p><a href="${ta.talink3}" target="_blank"><button class="w3-button w3-padding-large w3-white w3-border"><b>EXPLORE »</b></button></a></p>        </div>
        <div class="w3-col m4 w3-hide-small">
          <p><span class="w3-padding-large w3-right"><b>  </b> </p>
        </div>
      </div>
    </div>
  </div>
  </div>
  
  <!-- Second Photo Grid-->
  <div class="w3-row-padding">
  <div class="w3-third w3-container w3-margin-bottom card-zoom">
          <img src="touristattractionimg4?id=${ta.id }" alt="Norway" style="width:100%" class="w3-hover-opacity">
    <div class="w3-container w3-white">
      <p><b><c:out value="${ta.taname4}"></c:out></b></p>
      <p><c:out value="${ta.tadesc4}"></c:out></p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
		<p><a href="${ta.talink4}" target="_blank"><button class="w3-button w3-padding-large w3-white w3-border"><b>EXPLORE »</b></button></a></p>        </div>
        <div class="w3-col m4 w3-hide-small">
          <p><span class="w3-padding-large w3-right"><b>  </b> </p>
        </div>
      </div>
    </div>
  </div>
  <div class="w3-third w3-container w3-margin-bottom card-zoom">
    <img src="touristattractionimg5?id=${ta.id }" alt="Norway" style="width:100%" class="w3-hover-opacity">
    <div class="w3-container w3-white">
      <p><b><c:out value="${ta.taname5}"></c:out></b></p>
      <p><c:out value="${ta.tadesc5}"></c:out></p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
	<p><a href="${ta.talink5}" target="_blank"><button class="w3-button w3-padding-large w3-white w3-border"><b>EXPLORE »</b></button></a></p>        </div>
        <div class="w3-col m4 w3-hide-small">
          <p><span class="w3-padding-large w3-right"><b>  </b> </p>
        </div>
      </div>
    </div>
  </div>
  <div class="w3-third w3-container w3-margin-bottom card-zoom">
    <img src="touristattractionimg6?id=${ta.id }" alt="Norway" style="width:100%" class="w3-hover-opacity">
    <div class="w3-container w3-white">
      <p><b><c:out value="${ta.taname6}"></c:out></b></p>
      <p><c:out value="${ta.tadesc6}"></c:out></p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
		<p><a href="${ta.talink6}" target="_blank"><button class="w3-button w3-padding-large w3-white w3-border"><b>EXPLORE	 »</b></button></a></p>        </div>
        <div class="w3-col m4 w3-hide-small">
          <p><span class="w3-padding-large w3-right"><b>  </b> </p>
        </div>
      </div>
    </div>
  </div>
  </div>
  <!-- End page content -->
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
    const pageSections = document.querySelectorAll('.page-section');
      const pageLinks = document.querySelectorAll('.page-link');
      const prevPageLink = document.getElementById('prev-page');
      const nextPageLink = document.getElementById('next-page');

      let currentPage = 1; // Current page index

      function showPage(page) {
        pageSections.forEach((section) => {
          section.style.display = 'none'; // Hide all sections
        });
        document.getElementById(`page-${page}`).style.display = 'block'; // Show the selected section
      }

      pageLinks.forEach((link) => {
        link.addEventListener('click', () => {
          const page = parseInt(link.dataset.page, 10);
          showPage(page);
        });
      });

      prevPageLink.addEventListener('click', () => {
        if (currentPage > 1) {
          currentPage--;
          showPage(currentPage);
        }
      });

      nextPageLink.addEventListener('click', () => {
        // You can add logic here to check if there are more pages to load
        currentPage++;
        showPage(currentPage);
      });

      // Initial load
      showPage(currentPage);
  </script>
</body>
</html>
