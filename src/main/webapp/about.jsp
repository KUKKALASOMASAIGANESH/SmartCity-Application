<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>About</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Reset some default styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f4f4f9;
    color: #333;
    line-height: 1.6;
}

header.header-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 1rem 2rem;
    background: linear-gradient(to right, #4e54c8, #8f94fb);
    color: #fff;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.header-text h1 {
    font-size: 2rem;
    font-weight: bold;
}

nav {
    background: #222;
    padding: 1rem;
    text-align: center;
}

nav ul {
    list-style: none;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 1.5rem;
}

nav ul li a {
    color: #fff;
    text-decoration: none;
    font-weight: 500;
    padding: 0.5rem 1rem;
    border-radius: 20px;
    transition: background 0.3s ease;
}

nav ul li a:hover {
    background: #4e54c8;
}

/* Sections */
section {
    padding: 2rem;
    margin: 1rem auto;
    max-width: 1000px;
    background: rgba(255, 255, 255, 0.9);
    border-radius: 16px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
}

section h2 {
    margin-bottom: 1rem;
    color: #4e54c8;
}

/* Image Styling */
section img {
    max-width: 100%;
    height: auto;
    border-radius: 12px;
    margin-bottom: 1rem;
}

/* Image Grid for Festivals */
.image-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1rem;
}

/* Image Gallery for Food */
.image-gallery {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    justify-content: center;
}

.image-box {
    flex: 1 1 30%;
    min-width: 200px;
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.image-box img {
    width: 100%;
    height: auto;
}

/* Map iframe */
section#map iframe {
    width: 100%;
    border-radius: 12px;
    margin-top: 1rem;
}

/* Footer */
footer {
    text-align: center;
    padding: 1rem;
    background: #222;
    color: #ccc;
    font-size: 0.9rem;
}

/* Google Translate Position */
#google_translate_element {
    margin-left: auto;
    margin-right: 1rem;
}

/* Responsive tweaks */
@media (max-width: 768px) {
    header.header-container {
        flex-direction: column;
        text-align: center;
    }

    nav ul {
        flex-direction: column;
        gap: 0.75rem;
    }

    .image-gallery,
    .image-grid {
        flex-direction: column;
    }
}

    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<header class="header-container">
    <img src="" alt="" width="70">
    <div class="header-text">
        <h1><c:out value="${abc.cname}"/></h1>
    </div>

</header>
<nav>
    <ul>
        <li><a href="#about">About</a></li>
        <li><a href="#culture">Culture</a></li>
        <li><a href="#festivals">Festivals</a></li>
        <li><a href="#politics">Politics</a></li>
    </ul>
</nav>

<section id="about">
    <img src="displaycityimage?id=${abc.id}" alt="City" width="400" height="100">
    <p><c:out value="${abc.description}"/></p>
</section>

<section id="culture">
    <h2>Culture of the City</h2>
    <img src="displaycitycultureimage?id=${abc.id}" alt="Culture">
    <p><c:out value="${abc.cultureDescription}"/></p>
</section>

<section id="festivals">
    <h2>Festivals in the City</h2>
    <p>Description of festivals celebrated in the City.</p>
    <div class="image-grid">
        <img src="displaycityfestivalimage1?id=${abc.id}" alt="Festival 1">
        <img src="displaycityfestivalimage2?id=${abc.id}" alt="Festival 2">
        <img src="displaycityfestivalimage3?id=${abc.id}" alt="Festival 3">
    </div>
</section>

<section id="gallery">
    <h2>City Famous Food</h2>
    <div class="image-gallery">
        <div class="image-box">
            <img src="displayfamousfoodimage1?id=${abc.id}" alt="Image 1">
        </div>
        <div class="image-box">
            <img src="displayfamousfoodimage2?id=${abc.id}" alt="Image 2">
        </div>
        <div class="image-box">
            <img src="displayfamousfoodimage3?id=${abc.id}" alt="Image 3">
        </div>
        <!-- Add more image-box elements as needed -->
    </div>
</section>

<section id="politics">
    <h2>Politics in the City</h2>
    <div class="image-box">
        <img src="displaypoliticsimage?id=${abc.id}" alt="Image">
    </div>
    <p><c:out value="${abc.politicsDescription}"/></p>
</section>

<section id="map">
    <h2>City Map</h2>
    <p>Explore City on the map:</p>
    <iframe
        src="${abc.maplink}"
        width="100%"
        height="450"
        style="border:0; border-radius:12px;"
        allowfullscreen=""
        loading="lazy">
    </iframe>
</section>


<footer>
    <p></p>
</footer>


<script>
    // JavaScript for navbar toggle (ensure you have a navbar element to work with this script)
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
