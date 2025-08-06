<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%
    // Get the amount from the request parameter
    String amountParam = request.getParameter("amount");
    if (amountParam == null || amountParam.isEmpty()) {
        amountParam = "0";
    }
%>
<html>
<head>
    <title>Scan & Pay</title>
    <style>
        body {
            background: linear-gradient(to right, #000046, #1cb5e0);
            font-family: 'Segoe UI', sans-serif;
            color: white;
            text-align: center;
            padding: 50px;
        }

        .qr-container {
            background: rgba(255, 255, 255, 0.08);
            padding: 40px;
            border-radius: 20px;
            display: inline-block;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
            max-width: 400px;
            margin: auto;
        }

        img {
            width: 250px;
            height: 250px;
            margin-bottom: 20px;
            border-radius: 12px;
            border: 2px solid rgba(255, 255, 255, 0.2);
        }

        .note {
            font-size: 14px;
            color: #ddd;
            margin-top: 10px;
        }

        .amount {
            font-size: 18px;
            margin: 20px 0;
            color: #ffffff;
        }

        .gpay-button {
            display: inline-block;
            margin-top: 15px;
            padding: 12px 24px;
            background-color: #ffffff;
            color: #000046;
            font-weight: bold;
            font-size: 16px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            text-decoration: none;
        }

        .gpay-button:hover {
            background-color: #dbe9ff;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="qr-container">
        <h2>Scan & Pay via UPI</h2>

        <!-- QR Code with dynamic amount -->
        <img src=images/Qrimage.png alt="Scan to Pay">


        <p class="note">
            Use any UPI app like PhonePe, Google Pay, Paytm etc. to scan and complete the payment.
        </p>

        <p class="amount">
            <strong>Amount:</strong> ₹<%=amountParam%>
        </p>

        <!-- Google Pay UPI Intent Link -->
        <a class="gpay-button"
           href="upi://pay?pa=merchant@upi&pn=HotelName&am=<%=URLEncoder.encode(amountParam, "UTF-8")%>&cu=INR&tn=Room+Booking">
            Pay with Google Pay
        </a>
    </div>
</body>
</html>
