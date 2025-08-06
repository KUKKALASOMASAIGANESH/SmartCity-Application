<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>UPI Payment Successful</title>
    <style>
        body {
            background: #1f4037;
            background: linear-gradient(to right, #1f4037, #99f2c8);
            font-family: 'Segoe UI', sans-serif;
            text-align: center;
            padding-top: 100px;
            color: #fff;
        }
        .box {
            background: rgba(255,255,255,0.1);
            padding: 40px;
            display: inline-block;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>🎉 Payment Successful!</h2>
        <p>Your UPI transaction has been completed successfully.</p>
        <p>Transaction ID: <strong>${transactionId}</strong></p>
        <p>Paid Amount: ₹<strong>${amount}</strong></p>
    </div>
</body>
</html>
