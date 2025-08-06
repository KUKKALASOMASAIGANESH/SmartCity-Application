<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="styles.css">
    <title>Hotel and Rental Booking</title>
    <style>
      * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
body {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    background: #444;
}
.container {
    position: relative;
    width: 70vw;
    height:100vh;
    background: #fff;
    border-radius: 15px;
    box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.3), 0 6px 20px 0 rgba(0, 0, 0, 0.3);
    overflow: hidden;
    z-index: 0;
}
.container::before {
    content: "";
    position: absolute;
    top: 0;
    left: -50%;
    width: 100%;
    height: 100%;
    background: linear-gradient(-45deg, #df4adf, #520852);
    z-index: 6;
    transform: translateX(100%);
    transition: 1s ease-in-out;
}
.signin-signup {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: space-around;
    z-index: 5;
}
form {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    width: 40%;
    min-width: 238px;
    padding: 0 10px;
}
form.sign-in-form {
    opacity: 1;
    transition: 0.5s ease-in-out;
    transition-delay: 1s;
}
form.sign-up-form {
    opacity: 0;
    transition: 0.5s ease-in-out;
    transition-delay: 1s;
}
.title {
    font-size: 35px;
    color: #df4adf;
    margin-bottom: 10px;
}
.input-field {
    width: 100%;
    height: 50px;
    background: #f0f0f0;
    margin: 10px 0;
    border: 2px solid #df4adf;
    border-radius: 50px;
    display: flex;
    align-items: center;
}

.input-field i {
    flex: 1;
    text-align: center;
    color: #666;
    font-size: 18px;
}
.input-field input {
    flex: 5;
    background: none;
    border: none;
    outline: none;
    width: 100%;
    font-size: 18px;
    font-weight: 600;
    color: #444;
}
.input-field select {
    width: 100%;
    padding: 12px 15px;
    background: none; /* Change to 'none' to remove the default background color */
    border: none;
    outline: none;
    font-size: 18px;
    font-weight: 600;
    color: #504242;
    margin: 8px 0;
    appearance: none; /* Remove default arrow icon */
    -webkit-appearance: none;
    -moz-appearance: none;
    cursor: pointer;
}


/* Hide the default browser placeholders */
.input-field select::placeholder {
	display: none;
}

/* Show custom placeholders when input fields are empty */
.input-field select:empty+.placeholder::before {
	content: attr(data-placeholder);
	visibility: visible;
}
.btn {
    width: 150px;
    height: 40px;
    border: none;
    border-radius: 50px;
    background: #df4adf;
    color: #fff;
    font-weight: 600;
    margin: 10px 0;
    text-transform: uppercase;
    cursor: pointer;
}
.btn:hover {
    background: #c03cc0;
}
.social-text {
    margin: 10px 0;
    font-size: 16px;
}

a {
    text-decoration: none;
}
/* Add this style for the highlighted button */
/* Add this style for the highlighted button */
.account-text button {
    cursor: pointer;
    color: #df4adf;
    background-color: #fff; /* Change background color as needed */
    border: 2px solid #df4adf;
    border-radius: 50px;
    padding: 10px 20px;
    font-size: 16px;
    text-transform: uppercase;
    transition: color 0.3s ease-in-out, background-color 0.3s ease-in-out;
}

.account-text button:hover {
    color: #c03cc0;
    background-color: #f0f0f0; /* Change hover background color as needed */
}



.panels-container {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: space-around;
}
.panel {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-around;
    width: 35%;
    min-width: 238px;
    padding: 0 10px;
    text-align: center;
    z-index: 6;
}
.left-panel {
    pointer-events: none;
}
.content {
    color: #fff;
    transition: 1.1s ease-in-out;
    transition-delay: 0.5s;
}
.panel h3 {
    font-size: 24px;
    font-weight: 600;
}
.panel p {
    font-size: 15px;
    padding: 10px 0;
}
.image {
    width: 150%;
    transition: 1.1s ease-in-out;
    transition-delay: 0.4s;
}
.left-panel .image,
.left-panel .content {
    transform: translateX(-200%);
}
.right-panel .image,
.right-panel .content {
    transform: translateX(0);
}
.account-text {
    display: none;
}
/*Animation*/
.container.sign-up-mode::before {
    transform: translateX(0);
}
.container.sign-up-mode .right-panel .image,
.container.sign-up-mode .right-panel .content {
    transform: translateX(200%);
}
.container.sign-up-mode .left-panel .image,
.container.sign-up-mode .left-panel .content {
    transform: translateX(0);
}
.container.sign-up-mode form.sign-in-form {
    opacity: 0;
}
.container.sign-up-mode form.sign-up-form {
    opacity: 1;
}
.container.sign-up-mode .right-panel {
    pointer-events: none;
}
.container.sign-up-mode .left-panel {
    pointer-events: all;
}
/*Responsive*/
@media (max-width:779px) {
    .container {
        top: 0%;
        width: 100vw;
        height: 100vh;
    }
    
}
@media (max-width:635px) {
    .container::before {
        display: none;
    }
    form {
        width: 80%;
    }
    form.sign-up-form {
        display: none;
    }
    .container.sign-up-mode2 form.sign-up-form {
        display: flex;
        opacity: 1;
    }
    .container.sign-up-mode2 form.sign-in-form {
        display: none;
    }
    .panels-container {
        display: none;
    }
    .account-text {
        display: initial;
        margin-top: 30px;
    }
}
@media (max-width:320px) {
    form {
        width: 90%;
    }
}
/* Assuming Font Awesome 6 styles are used */
.fa-regular.fa-address-book {
    /* Adjust the styles based on your design preferences */
    font-size: 24px; /* Set the desired font size */
    color: #333; /* Set the desired color */
    /* Add any additional styling as needed */
}

.message-container {
    position: absolute;
    top: 10px; /* Adjust the top position as needed */
    left: 50%;
    transform: translateX(-50%);
    z-index: 7; /* Ensure it's above other elements */
    width: 100%;
    text-align: center;
}

/* Adjustments for responsiveness */
@media (max-width: 635px) {
    .message-container {
        top: 20px; /* Adjust the top position for smaller screens */
    }
}
    </style>
</head>
<body>

<%@ include file="navbar.jsp"%>

<div class="message-container">
    <span class="blink">
        <h3 align=center style="color: #f60000;">${message}</h3>
    </span>
</div>

<%@ include file="navbar.jsp"%>
 <div id="google_translate_element"></div>
    <div class="container">
        <div class="signin-signup">
            <form action="inserthotelbooking?city=${cityname}" class="sign-in-form" method="post">
                <h2 class="title">Hotel Booking</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" value="${cdata.name}" name="hotel_name" placeholder="name" required>
                </div>
                
                <div class="input-field">
                    <i class="fa fa-envelope" style="font-size:24px"></i>
                    <input type="email" value="${cdata.email}" name="hotel_email" placeholder="Email" required>
                </div>
            
                <div class="input-field">
                    <select  name="hotel" id="hotel" required>
                        <option value="" disabled selected>Select Hotel</option>
                        <c:forEach items="${hlist}" var="hotel">
                        <option value="${hotel.name}">${hotel.name}</option>
                        <!-- Add more options as needed -->
                        </c:forEach>
                    </select>
                </div>
                <div class="input-field">
                    <i style="font-size:13px" >Check In Date</i>
                    <input type="date" name="hotel_checkindate" placeholder="checkInDate" required>
                </div>
                <div class="input-field">
                    <i style="font-size:13px">Check In Time</i>
                    <input type="time" name="hotel_checkintime" placeholder="checkInTime" required>
                </div>
                <div class="input-field">
                    <i style="font-size:13px">Check Out Date</i>
                    <input type="date" name="hotel_checkoutdate" placeholder="checkOutDate" required>
                </div>
                <div class="input-field">
                    <i style="font-size:13px">Check Out Time</i>
                    <input type="time" name="hotel_checkouttime" placeholder="checkOutTime" required>
                </div>
                <input type="submit" value="Book" class="btn">
                
                <p class="account-text">Want to Book a Vehicle?<a href="#" id="sign-up-btn2">Vehicles</a></p>
            </form>
            
             
            <form action="rentalbooking?city=${cityname}" class="sign-up-form" method="post">
                <h2 class="title">Book Vehicle</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" value="${cdata.name}" name="rental_name" placeholder="name" required>
                </div>
                <div class="input-field">
                    <i class="fa fa-address-book" style="font-size:28px;color:grey"></i>
                                        <input type="text" value="${cdata.contactno }" name="rental_contact" placeholder="contact" required>
                </div>
                
                <div class="input-field">
                    <i class="fa fa-envelope" style="font-size:24px"></i>
                    <input type="email" value="${cdata.email }" 	name="rental_email" placeholder="Email" required>
                </div>
                <div class="input-field">
                    <i class="fa fa-address-card" style="font-size:24px"></i>
                    <input type="text" placeholder="Address" name="rental_address" required>
                </div>
            
                <div class="input-field">
                    
                    <select name="rental_vehicle" id="rental_vehicle" required>
                        <option value="" disabled selected>Select Vehicle</option>
                       <option value="Car">Car</option>
						<option value="Bike">Bike</option>
                        <!-- Add more options as needed -->
                    </select>
                </div>
                <div class="input-field">
                    <i class="fa fa-calendar-check-o" style="font-size:24px"></i>
                    <input type="date" placeholder="Date" name="rental_date" required>
                </div>
                <div class="input-field">
                    <i class="fa fa-history" style="font-size:24px"></i>
                    <input type="time" placeholder="time" name="rental_time" required>
                </div>

                <input type="submit" value="Book" class="btn">
               
                
                <p class="account-text">Want to Book a Hotel? <a href="#" id="sign-in-btn2">Hotels</a></p>
            </form>
        </div>
        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>Hotel Booking?</h3>
                    <p>Enter your details and start your journey with us</p>
                    <button class="btn" id="sign-in-btn">Book Hotel</button>
                </div>
                <img src="images/carbook.png" alt="" class="image">
            </div>
            <div class="panel right-panel">
                <div class="content">
                    <h3>Rental Booking?</h3>
                    <p>Enter your details and start your journey with us</p>
                    <button class="btn" id="sign-up-btn">Vehicle Booking</button>
                </div>
                <img src="images/hotelbook.png" alt="" class="image">
            </div>
        </div>
    </div>
    <%@ include file="header.jsp" %>
    
    
    <script>
      const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");
const sign_in_btn2 = document.querySelector("#sign-in-btn2");
const sign_up_btn2 = document.querySelector("#sign-up-btn2");
sign_up_btn.addEventListener("click", () => {
    container.classList.add("sign-up-mode");
});
sign_in_btn.addEventListener("click", () => {
    container.classList.remove("sign-up-mode");
});
sign_up_btn2.addEventListener("click", () => {
    container.classList.add("sign-up-mode2");
});
sign_in_btn2.addEventListener("click", () => {
    container.classList.remove("sign-up-mode2");
});
</script>
</body>
</html>