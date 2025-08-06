<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
 <!DOCTYPE html>
<html lang="en">
<head>
  <title>My Bookings</title>

  <meta charset="UTF-8">
  <!-- Add your CSS styles here -->
  <style>
    body {
      font-family: 'lato', sans-serif;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 1000px;
      margin: 0 auto;
      padding: 10px;
    }

    h2 {
      font-size: 26px;
      margin: 20px 0;
      text-align: center;
    }

    h2 small {
      font-size: 0.5em;
    }

    .responsive-table {
      padding: 0;
      margin: 0;
      list-style: none;
    }

    .responsive-table .table-header {
      background-color: #95A5A6;
      font-size: 14px;
      text-transform: uppercase;
      letter-spacing: 0.03em;
      display: flex;
      justify-content: space-between;
      border-radius: 3px;
      padding: 25px 30px;
      margin-bottom: 25px;
    }

    .responsive-table .table-header .col {
      flex-basis: 25%;
    }

    .responsive-table .table-row {
      background-color: #ffffff;
      box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
      display: flex;
      border-radius: 3px;
      padding: 25px 30px;
      margin-bottom: 25px;
    }

    .responsive-table .col {
      flex-basis: 25%;
    }

    @media all and (max-width: 767px) {
      .responsive-table .table-header {
        display: none;
      }

      .responsive-table .table-row {
        display: block;
      }

      .responsive-table .col {
        flex-basis: 100%;
        display: flex;
        padding: 10px 0;
      }

      .responsive-table .col:before {
        color: #6C7A89;
        padding-right: 10px;
        content: attr(data-label);
        flex-basis: 50%;
        text-align: right;
      }
    }
  </style>
</head>
<body>

		<span class="blink">
			<h3 align=center style="color: red">${message}</h3> 
				</span>

  <div class="container">
    <!-- Hotel Bookings Table -->
    <h2>Hotel Bookings </h2>
     <button onclick="goBack()" class="btn btn-default btn-lg ">Back</button>
    <ul class="responsive-table">
      <li class="table-header" style="background-color: #5F8575">
        <div class="col">Name</div>
        <div class="col">Email</div>
        <div class="col">Hotel</div>
        <div class="col">Checkin Date</div>
        <div class="col">Checkin Time</div>
        <div class="col">Checkout Date</div>
        <div class="col">Checkout Time</div>
      </li>
      <!-- JSTL code to populate hotel booking data -->
      <c:forEach items="${hlist}" var="h">
        <li class="table-row">
          <div class="col" data-label="Name"><c:out value="${h.name}" /></div>
          <div class="col" data-label="Email"><c:out value="${h.email}" /></div>
          <div class="col" data-label="Hotel"><c:out value="${h.hotel}" /></div>
          <div class="col" data-label="Checkin Date"><c:out value="${h.checkindate}" /></div>
          <div class="col" data-label="Checkin Time"><c:out value="${h.checkintime}" /></div>
          <div class="col" data-label="Checkout Date"><c:out value="${h.checkoutdate}" /></div>
          <div class="col" data-label="Checkout Time"><c:out value="${h.checkouttime}" /></div>
        </li>
      </c:forEach>
      <!-- End of hotel booking iteration -->
    </ul>

    <!-- Rental Bookings Table -->
    <h2>Rental Bookings </h2>
    <ul class="responsive-table">
      <li class="table-header" style="background-color: #5F8575">
        <div class="col">Name</div>
        <div class="col">Contact</div>
        <div class="col">Email</div>
        <div class="col">Address</div>
        <div class="col">Vehicle</div>
        <div class="col">Date</div>
        <div class="col">Time</div>
      </li>
      <!-- JSTL code to populate rental booking data -->
      <c:forEach items="${rlist}"  var="r">
        <li class="table-row">
          <div class="col" data-label="Name"><c:out value="${r.name}" /></div>
          <div class="col" data-label="Contact"><c:out value="${r.number}" /></div>
          <div class="col" data-label="Email"><c:out value="${r.email}" /></div>
          <div class="col" data-label="Address"><c:out value="${r.address}" /></div>
          <div class="col" data-label="Vehicle"><c:out value="${r.vehicle}" /></div>
          <div class="col" data-label="Date"><c:out value="${r.date}" /></div>
          <div class="col" data-label="Time"><c:out value="${r.time}" /></div>
        </li>
      </c:forEach>
      <!-- End of rental booking iteration -->
    </ul>
  </div>
</body>
<script>
function goBack() {
    window.history.back();
}
</script>
</html>