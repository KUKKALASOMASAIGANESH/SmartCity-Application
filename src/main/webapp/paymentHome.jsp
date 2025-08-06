<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Make Payment</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #2c3e50, #3498db);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .payment-card {
            background: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            margin-bottom: 20px;
            color: #2c3e50;
        }

        label {
            font-size: 15px;
            color: #555;
            font-weight: 500;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        button,
        a.button-link {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        button:hover,
        a.button-link:hover {
            background-color: #2980b9;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="payment-card">
     <div id="google_translate_element"></div>
        <h2>Make a Payment</h2>

        <!-- Form to create PayPal payment -->
        <form action="/create-payment" method="post">
            <label for="amount">Enter Amount (in ₹)</label>
            <input type="text" id="amount" name="amount" required placeholder="Ex: 500">

            <div class="btn-group">
                <!-- PayPal Button -->
                <button type="submit">Pay through PayPal</button>

                <!-- UPI Payment Redirect Button -->
                <a href="upiPaymentHome" class="button-link">Pay via UPI</a>
            </div>
        </form>
    </div>
</body>
</html>
