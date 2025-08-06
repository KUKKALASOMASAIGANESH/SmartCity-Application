<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%
    Map<String, String> paymentDetails = (Map<String, String>) request.getAttribute("paymentDetails");
%>
<html>
<head>
    <title>Payment Success</title>
</head>
<body>
    <h2>Payment Successful!</h2>
    <p>Transaction ID: <%= paymentDetails.get("transactionId") %></p>
    <p>Payer Name: <%= paymentDetails.get("payerName") %></p>
    <p>Amount Paid: $<%= paymentDetails.get("amount") %></p>
    <a href="/home">Back to Home</a>
</body>
</html>
