<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>UPI Payment</title>
    <style>
        body {
            background: linear-gradient(to right, #1e3c72, #2a5298);
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
            margin: 0;
            padding: 0;
        }
        .container {
            margin: 100px auto;
            padding: 40px;
            width: 400px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            backdrop-filter: blur(10px);
            text-align: center;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
        }
        input[type="text"], input[type="submit"] {
            width: 80%;
            padding: 12px;
            margin: 15px 0;
            border: none;
            border-radius: 10px;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #00c896;
            color: white;
            cursor: pointer;
            transition: background 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #00a87b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>UPI Payment</h2>
        <form action="create-upi-payment" method="post">
            <input type="text" name="amount" placeholder="Enter Amount (INR)" required />
            <input type="submit" value="Proceed to Pay via UPI" />
        </form>
    </div>
</body>
</html>
